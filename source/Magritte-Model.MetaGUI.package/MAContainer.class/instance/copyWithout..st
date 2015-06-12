copying
copyWithout: anObject
	^self reject: [:each | each = anObject]