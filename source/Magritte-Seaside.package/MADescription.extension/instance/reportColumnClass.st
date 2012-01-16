*magritte-seaside-accessing
reportColumnClass
	^ self propertyAt: #reportColumnClass ifAbsent: [ self class defaultReportColumnClass ]