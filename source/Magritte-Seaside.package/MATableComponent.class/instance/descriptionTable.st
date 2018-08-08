accessing
descriptionTable
	^ descriptionTable ifNil: [ descriptionTable := self buildDescriptionTable ]