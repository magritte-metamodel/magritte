*magritte-seaside-defaults
defaultReportColumnClass
	^ self defaultReportColumnClasses notEmpty
		ifTrue: [ self defaultReportColumnClasses first ]