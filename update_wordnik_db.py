# python imports
import csv
import re

# django imports
from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from market.models import Company, Segment, Ecosystem, Exit, Tag, Source


def importComps():
	f = open('ext_data/wordnik_companies.csv','rU')
	c = csv.DictReader(f)
	
	for row in c:
		
		# retrieve or create the ecosystem
		if row['Ecosystem'] != '':
			try:
				eco = Ecosystem.objects.get(name=row['Ecosystem'])
			except ObjectDoesNotExist:
				eco = Ecosystem.objects.create(name=row['Ecosystem'])
		else:
			eco = None
			
		# retrieve or create the market segment
		AllSegments = []
		if row['Segment'] != '':
			segments = row['Segment'].split(',')
			for seg in segments:
				try:
					newSeg = Segment.objects.get(name=row['Segment'])
				except ObjectDoesNotExist:
					newSeg = Segment.objects.create(name=row['Segment'])
				AllSegments.append(newSeg)
		else:
			seg = None
			
		# retrieve or create the tags
		AllTags = []
		if row['Tags'] != '':
			tags = row['Tags'].split(',')
			for tag in tags:
				if tag != '':
					try:
						newTag = Tag.objects.get(name=tag.strip())
					except ObjectDoesNotExist:
						newTag = Tag.objects.create(name=tag.strip())
					AllTags.append(newTag)
	
		c = Company(name=unicode(row['Company'],'utf-8','replace'),description=unicode(row['Official Description'],'utf-8','replace'),slogan=unicode(row['Slogan'],'utf-8','replace'),url=row['URL'],platform=row['Platform'],state=row['State'])
		c.save()
		if eco is not None:
			c.ecosystem.add(eco)
		for seg in AllSegments:
			c.segments.add(seg)
		for tag in AllTags:
			c.tags.add(tag)
		c.save()
		
def importSources():
	
	# initialize list for sources that don't find company matches
	badSources = []
	
	f = open('ext_data/wordnik_sources.csv','rU')
	c = csv.DictReader(f)
	
	for row in c:
		# make sure it's not a general article; I'll handle these manually later
		if row['Company'] != 'General':
			# set url to source field
			url = row['Source']
			source = ''
			# crummy list of regex to match url to source
			reDict = {
				r'crunchbase':'CrunchBase',
				r'techcrunch':'TechCrunch',
				r'allthingsd':'AllThingsD',
				r'gigaom':'GigaOM',
				r'readwriteweb':'ReadWriteWeb',
				r'pcmag':'PC Magazine',
				r'searchenginewatch':'Search Engine Watch',
				r'mashable':'Mashable',
				r'quora':'Quora',
				r'businessinsider':'Business Insider',
				r'quantcast':'Quantcast',
				r'time':'Time',
				r'nytimes':'NY Times',
				r'tumblr':'Tumblr',
				r'twitter':'Twitter',
				r'fastcompany': 'Fast Company',
				r'venturebeat': 'Venture Beat',
				r'wsg':'Wall Street Journal',
				r'dowjones':'DowJones.com',
				r'zdnet':'ZD Net',
				r'jackmyers': 'Jackmyers.com',
				r'businessweek':'BusinessWeek',
				r'guardian': 'Guardian',
				r'paidcontent': 'PaidContent.org',
				r'techaviv':'Techaviv',
				r'thenextweb':'TheNextWeb',
				r'wired':'Wired',
				r'scobleizer':'Scobleizer',
				r'cnet':'CNet',
				r'buzzmachine':'Buzzmachine',
				r'arstechnica':'Ars Technica',
				r'adage': 'Ad Age',
				r'ycombinator' : 'Hacker News'
			}
			
			# match url to particular source
			for k,v in reDict.iteritems():
				if re.search(k,url):
					source = v
			
			# try to match source to particular company
			try:
				comp = Company.objects.get(name=row['Company'])
			except ObjectDoesNotExist:
				# if can't match company, add line to review later, continue
				badSources.append(row)
				continue
			print row['Company']	
			s = Source(source=unicode(source,'utf-8','replace'),url=unicode(url,'utf-8','replace'),title=unicode(row['Title'],'utf-8','replace'))
			s.save()
			s.company.add(comp)
			s.save()
		
		
			
	