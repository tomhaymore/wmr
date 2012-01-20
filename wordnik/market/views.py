# python imports
import datetime
import chart

# django imports
from django.contrib.auth import authenticate, login as auth_login
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render_to_response
from django.template import RequestContext
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from market.models import Company, Comment, Segment, Source, Tag, Metric, MetricType, Report
from market.forms import SourceForm, MetricForm, CompanyForm, CompanyEditForm, CompanyCommentForm, SegmentForm
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def handleUploadedFile(f):
	destination = open('/Users/thaymore/Sites/wordnik/media/' + f.name, 'wb+')
	for chunk in f.chunks():
		destination.write(chunk)
	destination.close()

def login(request):
    msg = []
    if request.method == "POST":
        msg.append('You submitted your form!')
        
        #msg.append(username)
        #msg.append(password)
        user = authenticate(username=request.POST['username'], password=request.POST['password'])
        if user is not None:
        #    msg.append("You authenticated!")
            if user.is_active:
                auth_login(request, user)
                return HttpResponseRedirect('/')
            else:
                msg.append("Your account is disabled")
        else:
            msg.append("Your login credentials are invalid")
    return render_to_response('market/login.html', {'errors':msg},context_instance=RequestContext(request))

@login_required
def addCompany(request):
	if request.method == 'POST': # if the form has been submitted
		form = CompanyForm(request.POST,request.FILES) # a form is bound to the Post data
		if form.is_valid(): # validation passes
			# upload file
			if request.FILES:
				handleUploadedFile(request.FILES['logo'])
			
			# process submitted form fields
			name = form.cleaned_data['name']
			description = form.cleaned_data['description']
			#slogan = form.cleaned_data['slogan']
			url = form.cleaned_data['url']
			logo = form.cleaned_data['logo']
			platform = form.cleaned_data['platform']
			state = form.cleaned_data['state']
			ecosystems = form.cleaned_data['ecosystem']
			segments = form.cleaned_data['segments']
			tags = form.cleaned_data['tags']
			tags = tags.split(',') # break into separate tags
			newCo = Company(name=name,description=description,url=url,logo=logo,platform=platform,state=state)
			newCo.save()
			for tag in tags:
				newTag = None
				try:
					newTag = Tag.objects.get(name=tag)
				except ObjectDoesNotExist:
					newTag = Tag.objects.create(name=tag)
				newCo.tags.add(newTag)
			for eco in ecosystems:
				newCo.ecosystem.add(eco)
			for seg in segments:
				newCo.segments.add(seg)
			newCo.save()
			return HttpResponseRedirect('/company/'+str(newCo.id)) # redirect to company detail page
	else:
		form = CompanyForm() # unbound form, passes to template
	
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/company/add.html', {
		'form':form, 'segment_list':segment_list, 'recent_news':recent_news
		},
		context_instance=RequestContext(request)
	)

def editCompany(request,co_id):
	co = Company.objects.get(pk=co_id)
	if request.method == 'POST': # if the form has been submitted
		form = CompanyEditForm(request.POST,request.FILES) # a form is bound to the Post data
		#co = Company.objects.get(pk=form.cleaned_data['id'])
		if form.is_valid(): # validation passes
			# process submitted form fields
			
			co.name = form.cleaned_data['name']
			co.description = form.cleaned_data['description']
			#co.slogan = form.cleaned_data['slogan']
			co.url = form.cleaned_data['url']
			co.logo = form.cleaned_data['logo']
			co.platform = form.cleaned_data['platform']
			co.state = form.cleaned_data['state']
			# save these values to db
			co.save()
			
			# zero out existing M2M relationships
			co.ecosystem = []
			co.segment = []
			
			# reset M2M relationships
			co.ecosystem = form.cleaned_data['ecosystem']
			co.segments = form.cleaned_data['segments']
			co.save()
			
			# parse through the tags
			tags = form.cleaned_data['tags']
			tags = tags.split(',') # break into separate tags
		
			for tag in tags:
				newTag = None
				try:
					newTag = Tag.objects.get(name=tag)
				except ObjectDoesNotExist:
					newTag = Tag.objects.create(name=tag)
				co.tags.add(newTag)

			co.save()
			return HttpResponseRedirect('/company/'+str(co.id)) # redirect to company detail page
	else:
		
		i = 0
		allTags = None
		for tag in co.tags.all():
			if i == 0:
				allTags = str(tag)
			else:
				allTags += ', ' + str(tag)
		data = {
			'id' : co.id,
			'name' : co.name,
			'description' : co.description,
			'slogan' : co.slogan,
			'url' : co.url,
			'platform': co.platform,
			'state'	: co.state,
			'ecosystem' : co.ecosystem.all(), 
			'segments' : co.segments.all(),
			'tags' : allTags
		}
		
		form = CompanyEditForm(initial=data) # unbound form, passes to template
	
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/company/edit.html', {
		'form':form, 'segment_list':segment_list, 'recent_news':recent_news, 'co':co
		},
		context_instance=RequestContext(request)
	)

def allCompanies(request):
	co_list = Company.objects.all()
	paginator = Paginator(co_list, 20)
	page = request.GET.get('page')
	try:
		cos = paginator.page(page)
	except TypeError:
		cos = paginator.page(1)
	except PageNotAnInteger:
		cos = paginator.page(1)
	except EmptyPage:
		cos = paginator.page(paginator.num_pages)
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/company/all.html',{'recent_news':recent_news,'segment_list':segment_list,'cos':cos},context_instance=RequestContext(request))

@login_required
def index(request):
	segment_list = Segment.objects.all().order_by('name')
	comments = Comment.objects.all().order_by('-modified')[:5]
	latest_companies_list = Company.objects.all().order_by('-modified')[:5]
	latest_comments_list = Comment.objects.all().order_by('-modified')[:5]
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/index.html',{'comments':comments,'recent_news':recent_news,'segment_list':segment_list,'latest_comments_list':latest_comments_list,'latest_companies_list':latest_companies_list},context_instance=RequestContext(request))
	
def companyDetail(request, co_id):
	segment_list = Segment.objects.all().order_by('name')
	c = get_object_or_404(Company, pk=co_id)
	if request.method == 'POST':
		form = CompanyCommentForm(request.POST)
		if form.is_valid():
			
			# save clean data from form
			user = form.cleaned_data['user']
			body = form.cleaned_data['body']
			company = form.cleaned_data['company']
			category = form.cleaned_data['category']
			
			# save new comment
			newComment = Comment(user=user,body=body,company=company,category=category)
			newComment.save()
			
			# return to company details page
			return HttpResponseRedirect('/company/' + co_id)
	
	else:
		
		
		# set initial data for form
		data = {
			'user' : request.user,
			'company' : c,
			'category' : 'co'
		}
		
		# create and bind initial data to form
		form = CompanyCommentForm(initial=data)
		
	# initialize other data for view
	
	comments = Comment.objects.all().filter(company=c)
	metrics = Metric.objects.all().filter(company=c)
	sources = Source.objects.all().filter(company=c)
	recent_news = Source.objects.all().order_by('-modified')[:5]
	
	userType = MetricType.objects.get(pk=15)
	uniqType = MetricType.objects.get(pk=18)
	blogType = MetricType.objects.get(pk=26)
	userMetrics = chart.getMetrics(c,userType)
	uniqMetrics = chart.getMetrics(c,uniqType)
	blogMetrics = chart.getMetrics(c,blogType)
	
	data = {
		'comments':comments,
		'form':form,
		'recent_news':recent_news,
		'sources':sources,
		'segment_list':segment_list,
		'co':c,
		'metrics':metrics
	}
	
	if uniqMetrics:
		data['uniqDates'] = uniqMetrics['dates']
		data['uniqStats'] = uniqMetrics['stats']
	
	if userMetrics:
		data['userDates'] = userMetrics['dates']
		data['userStats'] = userMetrics['stats']
	
	if blogMetrics:
		data['blogDates'] = blogMetrics['dates']
		data['blogStats'] = blogMetrics['stats']
	
	return render_to_response('market/company/detail.html',data,context_instance=RequestContext(request))			
	
	#else:
	#	return render_to_response('market/company/detail.html',{'metrics':metrics,'comments':comments,'form':form,'recent_news':recent_news,'sources':sources,'segment_list':segment_list,'co':c},context_instance=RequestContext(request))
	


def search(request):
	
	if request.GET:
		search_term = request.GET['term']
		company_results = Company.objects.filter(name__icontains=search_term)
		source_results = Source.objects.filter(title__icontains=search_term)
		segment_list = Segment.objects.all().order_by('name')
		recent_news = Source.objects.all().order_by('-modified')[:5]
		return render_to_response('market/search.html',{'recent_news':recent_news,'source_results':source_results,'company_results':company_results,'segment_list':segment_list},context_instance=RequestContext(request))
	return HttpResponseRedirect("/")

def sourceDetail(request, source_id):
	s = get_object_or_404(Source, pk=source_id)
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/source/detail.html',{'recent_news':recent_news,'segment_list':segment_list,'s':s},context_instance=RequestContext(request))

def sourceAdmin(request):
	source_list = Source.objects.all()
	paginator = Paginator(source_list, 25)
	page = request.GET.get('page')
	try:
		sources = paginator.page(page)
	except TypeError:
		sources = paginator.page(1)
	except PageNotAnInteger:
		sources = paginator.page(1)
	except EmptyPage:
		sources = paginator.page(paginator.num_pages)
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/source/admin.html',{'recent_news':recent_news,'segment_list':segment_list,'sources':sources},context_instance=RequestContext(request))

def allSources(request):
	source_list = Source.objects.all()
	paginator = Paginator(source_list, 25)
	page = request.GET.get('page')
	try:
		sources = paginator.page(page)
	except TypeError:
		sources = paginator.page(1)
	except PageNotAnInteger:
		sources = paginator.page(1)
	except EmptyPage:
		sources = paginator.page(paginator.num_pages)
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/source/all.html',{'recent_news':recent_news,'segment_list':segment_list,'sources':sources},context_instance=RequestContext(request))

def addSource(request):
	if request.method == 'POST': # if the form has been submitted
		form = SourceForm(request.POST,request.FILES) # a form is bound to the Post data
		if form.is_valid(): # validation passes
			# upload file
			if request.FILES:
				handleUploadedFile(request.FILES['file'])
			# process submitted form fields
			author = form.cleaned_data['author']
			source = form.cleaned_data['source']
			title = form.cleaned_data['title']
			file = form.cleaned_data['file']
			url = form.cleaned_data['url']
			#type = form.cleaned_data['type']
			tags = form.cleaned_data['tags']
			tags = tags.split(',') # break into separate tags
			insight = form.cleaned_data['insight']
			companies = form.cleaned_data['companies']
			newSource = Source(source=source,url=url,title=title,insight=insight,author=author)
			newSource.save()
			for c in companies:
					newSource.company.add(c)		
			for tag in tags:
				newTag = None
				try:
					newTag = Tag.objects.get(name=tag)
				except ObjectDoesNotExist:
					newTag = Tag.objects.create(name=tag)
				newSource.tags.add(newTag)
			newSource.save()
			return HttpResponseRedirect('/source/'+str(newSource.id)) # redirect to source detail page
	else:
		form = SourceForm() # unbound form, passes to template
	
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/source/add.html', {
		'form':form, 'segment_list':segment_list, 'recent_news':recent_news
		},
		context_instance=RequestContext(request)
	)

#def sourceDelete(request, source_id):

def addMetric(request):
	if request.method == 'POST': # if the form has been submitted
		form = MetricForm(request.POST) # a form is bound to the Post data
		if form.is_valid(): # validation passes
			# process submitted form fields
			company = form.cleaned_data['company']
			platform = form.cleaned_data['platform']
			category = form.cleaned_data['category']
			stat = form.cleaned_data['stat']
			date = form.cleaned_data['date']
			source = form.cleaned_data['source']
			newMetric = Metric(company=company,platform=platform,category=category,stat=stat,date=date,source=source)
			newMetric.save()
			return HttpResponseRedirect('/company/'+str(company.id)) # redirect to source detail page
	else:
		form = MetricForm() # unbound form, passes to template
	
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/metric/add.html', {
		'form':form, 'segment_list':segment_list, 'recent_news':recent_news
		},
		context_instance=RequestContext(request)
	)

def segmentDetail(request, seg_id):
	# get segment details
	s = get_object_or_404(Segment, pk=seg_id)
	
			
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/segment/detail.html',{'recent_news':recent_news,'segment_list':segment_list,'s':s},context_instance=RequestContext(request))

def editSegment(request, seg_id):
	# get segment details
	s = get_object_or_404(Segment, pk=seg_id)
	
	# check to see if edit form has been submitted
	if request.POST:
		# bind form
		form = SegmentForm(request.POST)
		
		# validate form
		if form.is_valid():
			# save cleaned data from form
			s.name = form.cleaned_data['name']
			s.description = form.cleaned_data['description']
			s.save()
			
			# return to segment details page
			return HttpResponseRedirect('/segment/'+seg_id)
	else:
		# gather initial data
		data = {
			'name' : s.name,
			'description' : s.description
		}
		# initialize unbound form
		form = SegmentForm(initial=data)
	
	segment_list = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/segment/edit.html',{'form':form,'recent_news':recent_news,'segment_list':segment_list,'s':s},context_instance=RequestContext(request))
	
	
def allSegments(request):
	segments = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/segment/all.html', {
		'recent_news': recent_news, 'segs' : segments
		},
		context_instance=RequestContext(request)
	)
	
def addSegment(request):
	if request.POST:
		# bind form to post data
		form = SegmentForm(request.POST)
		
		# validate form
		if form.is_valid():
			seg = Segment(name=form.cleaned_data['name'])
			seg.save()
			return HttpResponseRedirect('/segment/'+str(seg.id))
	else:
		form = SegmentForm() # load unbound form
	
	segments = Segment.objects.all().order_by('name')
	recent_news = Source.objects.all().order_by('-modified')[:5]
	return render_to_response('market/segment/add.html', {
		'form':form,'recent_news' : recent_news, 'segments' : segments
		},
		context_instance=RequestContext(request)
	)

# views for tags

def tagDetail(request, tag_id):
	# fetch tag or error
	tag = get_object_or_404(Tag,pk=tag_id)
	
	# get other entities associated with tag
	cos = Company.objects.filter(tags=tag)
	sources = Source.objects.filter(tags=tag)
	reports = Report.objects.filter(tags=tag)
	
	# render page
	return render_to_response('market/tag/detail.html', {
		'tag':tag,'cos':cos,'sources':sources,'reports':reports
		},
		context_instance=RequestContext(request)
	)
	
def tagAll(request):
	# get all tags
	tag_list = Tag.objects.all()

	paginator = Paginator(tag_list, 25)
	page = request.GET.get('page')
	try:
		tags = paginator.page(page)
	except TypeError:
		tags = paginator.page(1)
	except PageNotAnInteger:
		tags = paginator.page(1)
	except EmptyPage:
		tags = paginator.page(paginator.num_pages)
	
	return render_to_response('market/tag/all.html', {
		'tags':tags
		},
		context_instance=RequestContext(request)
	)
 
# report views

def reportDetail(request, report_id):
	# get report or 404
	report = get_object_or_404(Report, pk=report_id)
	
	return render_to_response('market/report/detail.html', {
		'report':report
		},
		context_instance=RequestContext(request)
	)
	
def reportAll(request):
	# get all tags
	rep_list = Report.objects.all()

	paginator = Paginator(rep_list, 25)
	page = request.GET.get('page')
	try:
		reps = paginator.page(page)
	except TypeError:
		reps = paginator.page(1)
	except PageNotAnInteger:
		reps = paginator.page(1)
	except EmptyPage:
		reps = paginator.page(paginator.num_pages)
	
	return render_to_response('market/report/all.html', {
		'reps':reps
		},
		context_instance=RequestContext(request)
	)
	
# admin functions	
	

# user functions

