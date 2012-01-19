import csv
from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from market.models import Company, Segment, Ecosystem, Exit, Tag


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
				try:
					newTag = Tag.objects.get(name=tag)
				except ObjectDoesNotExist:
					newTag = Tag.objects.create(name=tag)
				AllTags.append(newTag)
	
		c = Company(name=unicode(row['Company'],'utf-8','replace'),description=unicode(row['Official Description'],'utf-8','replace'),slogan=unicode(row['Slogan'],'utf-8','replace'),url=row['URL'],platform=row['Platform'],state=row['State'])
		c.save()
		if eco is not None:
			c.ecosystem = eco
		for seg in AllSegments:
			c.segments.add(seg)
		for tag in AllTags:
			c.tags.add(tag)
		c.save()
	