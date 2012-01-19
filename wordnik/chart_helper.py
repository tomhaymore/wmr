import datetime
from market.models import MetricType, Metric, Company

def getMetrics():
	c = Company.objects.get(name="Fab.com")
	metricType = MetricType.objects.get(pk=15)
	metrics = Metric.objects.all().filter(company=c).filter(category=metricType).order_by('date')
	
	if metrics:
	
		# initialize arrays for co's dates / stats
		
		years = [2009, 2010, 2011, 2012]
		monthsDict = {1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'}
		
		dates = []
		stats = []
	
		oldStat = None
		today = datetime.date.today()
		for y in years:
			
			if y >= metrics[0].date.year:
				print y
				for i in range(1,13):
					
					# check to see if within range; if so, append to dates array
					if y == today.year and i > today.month:
						break
					elif i == 1:
						dates.append(monthsDict[i]+" "+str(y))
					else:
						dates.append(monthsDict[i])
					
					print monthsDict[i]
					# add stats data
					ticker = True
					for m in metrics:
						print m.date
						print m.category.name + " : " + m.stat
						
						
						if m.date.year == y and m.date.month == i:
							# check to see if this is the first metric
							if not oldStat: 
								stats.append(int(m.stat))
								#oldStat = m
								#ticker = False
							elif m.date.month == oldStat.date.month and int(m.stat) > int(oldStat.stat): # check to see if we have two metrics in one month
								if stats:
									stats.pop()
								stats.append(int(m.stat))
								#oldStat = m
								#ticker = False
							else:
								stats.append(int(m.stat))
								#oldStat = m
								#ticker = False
							oldStat = m
							ticker = False
					if ticker:
						if not oldStat:
							stats.append(0)
						else:
							stats.append(int(oldStat.stat))
		print dates
		print stats
