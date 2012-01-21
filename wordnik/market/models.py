from django.db import models
from django.contrib.auth.models import User

import datetime

PLATFORM_CHOICES = (
	('web','web'),
	('mobile','mobile'),
	('tablet','tablet'),
	('webmob','web, mobile'),
	('mobtab','mobile, tablet'),
	('webmobtab','web, mobile, tablet'),
)

STATE_CHOICES = (
	('active','active'),
	('inactive','inactive'),
	('alpha','alpha'),
	('beta','beta'),
)

EXIT_CHOICES = (
	('acq','acquisition'),
	('mgr','merger'),
	('bkrpt','bankruptcy'),
	('in','inactive'),
)

COMMENT_CHOICES = (
	('co','company'),
	('prod','product'),
	('met','metric'),
	('fea','feature'),
	('exit','exit'),
)

REGION_CHOICES = (
	('usa', 'United States'),
	('worldwide', 'Worldwide'),
)

class Comment(models.Model):
	user = models.ForeignKey(User)
	body = models.TextField()
	company = models.ForeignKey("Company",blank=True,null=True)
	category = models.CharField(max_length=20,choices=COMMENT_CHOICES)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	
	def was_published_today(self):
		return self.created.date() == datetime.date.today()
	
	def was_modified_today(self):
		return self.modified.date() == datetime.date.today()
	
# exit events for companies
class Exit(models.Model):
	type = models.CharField(max_length=450,choices=EXIT_CHOICES)
	amount = models.DecimalField(max_digits=24, decimal_places=2,blank=True,null=True)
	company = models.ForeignKey("Company",blank=True,null=True,related_name="company")
	acquirer = models.ForeignKey("Company",blank=True,null=True,related_name="acquirer")
	date = models.DateField(blank=True,null=True)
	modified = models.DateTimeField(auto_now=True)

# tags, used on pretty much all types of entities
class Tag(models.Model):
	name = models.CharField(max_length=450)
	description = models.TextField(null=True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		return self.name

# different market segments
class Segment(models.Model):
	name = models.CharField(max_length=250)
	description = models.TextField(blank=True,null=True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		return self.name

# pretty much the base model for linking all the other information together
# need to add logo
class Company(models.Model):
	name = models.CharField(max_length=250)
	parent = models.ForeignKey('self',blank=True,null=True,related_name="parent_comp")
	description = models.TextField(blank=True, null=True)
	slogan = models.TextField(blank=True)
	logo = models.FileField(upload_to='logos',blank=True)
	url = models.URLField(max_length=250,blank=True)
	platform = models.CharField(max_length=45,default="web",blank=True)
	ecosystem = models.ManyToManyField("Ecosystem",blank=True,null=True)
	segments = models.ManyToManyField(Segment,blank=True)
	#comments = models.ManyToManyField(Comment,blank=True,null=True)
	tags = models.ManyToManyField(Tag,blank=True)
	#exit = models.ForeignKey(Exit,blank=True,null=True)
	state = models.CharField(max_length=45,default="active",choices=STATE_CHOICES)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	public = models.IntegerField(default=0)
	ticker = models.CharField(max_length=45,blank=True,null=True)
	
	class Meta:
		verbose_name_plural = 'Companies'
	
	def __unicode__(self):
		return self.name

# specific company products	
class Product(models.Model):
	name = models.CharField(max_length=450)
	description = models.TextField(blank=True,null=True)
	value_prop = models.CharField(max_length=450)
	state = models.CharField(max_length=45,choices=STATE_CHOICES)
	features = models.ManyToManyField("Feature",through="ProductFeature")
	#comments = models.ManyToManyField(Comment,blank=True,null=True)
	tags = models.ManyToManyField(Tag)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		return self.name

# generic feature type	
class Feature(models.Model):
	gen_name = models.CharField(max_length=450)
	gen_descr = models.TextField()
	gen_modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		return self.gen_name

# product-specific features
class ProductFeature(models.Model):
	product = models.ForeignKey(Product)
	feature = models.ForeignKey(Feature)
	spec_name = models.CharField(max_length=250)
	spec_descr = models.TextField()
	tags = models.ManyToManyField(Tag,blank=True,null=True)
	#comments = models.ManyToManyField(Comment,blank=True,null=True)
	spec_modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		return self.spec_name

class Source(models.Model):
	author = models.CharField(max_length=450,blank=True,null=True)
	source = models.CharField(max_length=450,blank=True,null=True)
	url = models.URLField(blank=True,null=True)
	file = models.FileField(upload_to='sources',blank=True,null=True)
	title = models.CharField(max_length=450)
	date = models.DateField(blank=True,null=True)
	tags = models.ManyToManyField(Tag,blank=True,null=True)
	#comments = models.ManyToManyField(Comment,blank=True,null=True)
	insight = models.TextField(blank=True,null=True)
	company = models.ManyToManyField(Company,blank=True, null=True)
	modified = models.DateTimeField(auto_now=True)
	
	def __unicode__(self):
		if len(self.title) > 65:
			return self.title[:65] + " ..."
		else:
			return self.title
	
class Ecosystem(models.Model):
	name = models.CharField(max_length=450)
	description = models.TextField(blank=True,null=True)
	modified = models.DateTimeField(auto_now=True)

	def __unicode__(self):
		return self.name

class MetricType(models.Model):
	name = models.CharField(max_length=450)
	
	def __unicode__(self):
		return self.name

class Metric(models.Model):
	category = models.ForeignKey(MetricType)
	platform = models.CharField(max_length=25,blank=True)
	product = models.ForeignKey(Product,blank=True,null=True)
	region = models.CharField(max_length=45,choices=REGION_CHOICES,blank=True)
	company = models.ForeignKey(Company)
	round = models.CharField(max_length=45,blank=True,null=True)
	stat = models.CharField(max_length=25)
	date = models.DateField(blank=True,null=True)
	source = models.ForeignKey(Source,blank=True,null=True)
	
class BusinessModel(models.Model):
	name = models.CharField(max_length=250)
	description = models.TextField(blank=True,null=True)
	comments = models.ManyToManyField(Comment,blank=True,null=True)
	companies = models.ManyToManyField(Company,blank=True,null=True,through="BusinessModelDetails") 
	
	def __unicode__(self):
		return self.name
		
class BusinessModelDetails(models.Model):
	model = models.ForeignKey(BusinessModel)
	company = models.ForeignKey(Company)
	details = models.TextField()
	
class ReportStream(models.Model):
	name = models.CharField(max_length=450)
	description = models.TextField()
	tags = models.ManyToManyField(Tag,blank=True)
	companies = models.ManyToManyField(Company,blank=True)
	segments = models.ManyToManyField(Segment,blank=True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)

class Report(models.Model):
	title = models.CharField(max_length=250)
	description = models.TextField()
	file = models.FileField(upload_to='reports',blank=True)
	stream = models.ForeignKey(ReportStream)
	version = models.CharField(max_length=15)
	author = models.ForeignKey(User)
	created = models.DateTimeField(auto_now_add=True)
	