builder
canExpand
	" used to expand a relation description into a group "
	^self propertyAt: #canExpand ifAbsent: [ self defaultCanExpand ]