Extension { #name : 'AbstractDictionary' }

{ #category : '*magritte-gemstone-model' }
AbstractDictionary >> optionFor: anObject ifPresent: aBlock [
	self at: anObject ifPresent: aBlock

]
