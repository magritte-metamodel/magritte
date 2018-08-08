comparing
= aTable
	^ self species = aTable species
		and: [ self rowCount = aTable rowCount
		and: [ self columnCount = aTable columnCount
		and: [ self contents = aTable contents ] ] ]