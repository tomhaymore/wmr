from django.conf.urls.defaults import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'market.views.index'),
    url(r'^search','market.views.search'),
    url(r'^company/all','market.views.allCompanies'),
    url(r'^company/(?P<co_id>\d+)/$', 'market.views.companyDetail'),
    url(r'^company/add','market.views.addCompany'),
    url(r'^company/edit/(?P<co_id>\d+)/$','market.views.editCompany'),
    url(r'^source/(?P<source_id>\d+)/$', 'market.views.sourceDetail'),
    #url(r'^source/delete/(?P<source_id>\d+)/$','market.views.sourceDelete'),
    #url(r'^source/admin','market.views.sourceAdmin'),
    url(r'^source/add','market.views.addSource'),
    url(r'^source/all','market.views.allSources'),
    #url(r'^metric/(?P<metric_id>\d+)/$','market.views.metricDetail'),
    url(r'^metric/add','market.views.addMetric'),
    url(r'^segment/all','market.views.allSegments'),
    url(r'^segment/(?P<seg_id>\d+)/$', 'market.views.segmentDetail'),
    url(r'^segment/add','market.views.addSegment'),
    url(r'^segment/edit/(?P<seg_id>\d+)/$', 'market.views.editSegment'),
    url(r'^tag/(?P<tag_id>\d+)/$', 'market.views.tagDetail'),
    url(r'^tag/all', 'market.views.tagAll'),
    url(r'^report/(?P<report_id>\d+)/$', 'market.views.reportDetail'),
    url(r'^report/all', 'market.views.reportAll'),
    url(r'^report/add', 'market.views.reportAdd'),
    url(r'^reportstream/add', 'market.views.reportStreamAdd'),
    url(r'^reportstream/(?P<stream_id>\d+)/$', 'market.views.reportStreamDetail'),
    url(r'^login','market.views.login'),
    url(r'^logout','market.views.logout_view'),
    # url(r'^wordnik/', include('wordnik.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    
)

urlpatterns += staticfiles_urlpatterns()