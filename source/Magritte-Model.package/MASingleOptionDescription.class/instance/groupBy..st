accessing-properties
groupBy: anAccessor
	"anAccessor to be sent to the options objects for getting their group."
	
	self propertyAt: #groupBy put: anAccessor asAccessor