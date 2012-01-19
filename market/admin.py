from market.models import Comment, Exit, Tag, Segment, Company, Product, Feature, ProductFeature, Source, Ecosystem, MetricType, Metric
from django.contrib import admin

class CommentAdmin(admin.ModelAdmin):
	fields = ['company','category','user']
	list_display = ['company','category','user','created']

admin.site.register(Comment,CommentAdmin)
admin.site.register(Exit)
admin.site.register(Tag)
admin.site.register(Segment)
admin.site.register(Company)
admin.site.register(Product)
admin.site.register(Feature)
admin.site.register(Source)
admin.site.register(Ecosystem)
admin.site.register(Metric)


