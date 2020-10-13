accessing
isLabelVisible
	"Experiment: Are label and icon 'either-or', or might a user want both?"
	^ self propertyAt: #isLabelVisible ifAbsent: [ true ].