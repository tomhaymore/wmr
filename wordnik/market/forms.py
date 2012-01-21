from django import forms
from django.forms.widgets import HiddenInput
from django.contrib.auth.models import User
from market.models import Company, MetricType, Source, Segment, Ecosystem, AnalysisStream

SOURCE_TYPE_CHOICES = [
	('general','general'),
	('specific','specific')
	]

STATE_CHOICES = (
	('active','active'),
	('inactive','inactive'),
	('alpha','alpha'),
	('beta','beta'),
)

COMMENT_TYPE_CHOICES = (
	('co','company'),
	('prod','product'),
	('met','metric'),
	('fea','feature'),
	('exit','exit'),
)

ROUND_CHOICES = (
	('A','A'),
	('B','B'),
	('C','C'),
	('D','D'),
	('E','E'),
	('F','F'),
	('G','G'),
	('Un','Unattributed')
)

REGION_CHOICES = (
	('usa', 'United States'),
	('worldwide', 'Worldwide'),
)

PUBLIC_CHOICES = (
	(0,'No'),
	(1,'Yes'),
)

USERS = User.objects.all()

COMPANIES = Company.objects.all().order_by('name')

METRIC_TYPES = MetricType.objects.all().order_by('name')

SOURCES = Source.objects.all().order_by('title')

SEGMENTS = Segment.objects.all().order_by('name')

ECO = Ecosystem.objects.all().order_by('name')

ANALYSIS_STREAMS = AnalysisStream.objects.all().order_by('-created')

class CompanyForm(forms.Form):
	name = forms.CharField(max_length=250)
	description = forms.CharField(widget=forms.Textarea)
	public = forms.ChoiceField(choices=PUBLIC_CHOICES)
	stock_symbol = forms.CharField(required=False)
	#slogan = forms.CharField(required=False)
	logo = forms.FileField(required=False)
	url = forms.URLField()
	platform = forms.CharField()
	ecosystem = forms.ModelMultipleChoiceField(queryset=ECO,required=False)
	segments = forms.ModelMultipleChoiceField(queryset=SEGMENTS)
	tags = forms.CharField(required=False)
	state = forms.ChoiceField(choices=STATE_CHOICES)

class CompanyEditForm(forms.Form):
	id = forms.IntegerField(widget=HiddenInput)
	name = forms.CharField(max_length=250)
	description = forms.CharField(widget=forms.Textarea)
	public = forms.ChoiceField(choices=PUBLIC_CHOICES)
	#slogan = forms.CharField(required=False)
	logo = forms.FileField(required=False)
	url = forms.URLField()
	platform = forms.CharField(required=False)
	ecosystem = forms.ModelMultipleChoiceField(queryset=ECO,required=False)
	segments = forms.ModelMultipleChoiceField(queryset=SEGMENTS)
	tags = forms.CharField(required=False)
	state = forms.ChoiceField(required=True,choices=STATE_CHOICES)

class SourceForm(forms.Form):
	author = forms.CharField(required=False)
	source = forms.CharField()
	title = forms.CharField()
	date = forms.DateField(required=False)
	file = forms.FileField(required=False)
	url = forms.URLField(label="URL")
	type = forms.ChoiceField(choices=SOURCE_TYPE_CHOICES)
	companies = forms.ModelMultipleChoiceField(queryset=COMPANIES,required=False)
	tags = forms.CharField(required=False)
	insight = forms.CharField(required=False,widget=forms.Textarea)
	
class MetricForm(forms.Form):
	company = forms.ModelChoiceField(queryset=COMPANIES,empty_label="Choose a company")
	platform = forms.CharField(max_length=25)
	category = forms.ModelChoiceField(queryset=METRIC_TYPES,empty_label="Choose a metric type")
	region = forms.ChoiceField(choices=REGION_CHOICES,required=False)
	stat = forms.CharField(max_length=25)
	round = forms.ChoiceField(choices=ROUND_CHOICES,required=False)
	date = forms.DateField()
	source = forms.ModelChoiceField(queryset=SOURCES,empty_label="Choose a source",required=False)

class SegmentForm(forms.Form):
	name = forms.CharField()
	description = forms.CharField(widget=forms.Textarea)

class CompanyCommentForm(forms.Form):
	user = forms.ModelChoiceField(queryset=USERS,widget=HiddenInput)
	category = forms.ChoiceField(choices=COMMENT_TYPE_CHOICES,widget=HiddenInput)
	company = forms.ModelChoiceField(queryset=COMPANIES,widget=HiddenInput)
	body = forms.CharField(widget=forms.Textarea)

class AnalysisStreamAddForm(forms.Form):
	name = forms.CharField()
	description = forms.CharField(widget=forms.Textarea)
	tags = forms.CharField()
	companies = forms.ModelMultipleChoiceField(queryset=COMPANIES,required=False)
	segments = forms.ModelMultipleChoiceField(queryset=SEGMENTS,required=False)
	
class AnalysisAddForm(forms.Form):
	title = forms.CharField()
	description = forms.CharField(widget=forms.Textarea)
	file = forms.FileField()
	stream = forms.ModelChoiceField(queryset=ANALYSIS_STREAMS)
	version = forms.CharField()
	author = forms.ModelChoiceField(queryset=USERS)
