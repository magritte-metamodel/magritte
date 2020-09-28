Extension { #name : #Dictionary }

{ #category : #'*magritte-model-description' }
Dictionary >> optionFor: anObject ifPresent: aBlock [
	self at: anObject ifPresent: aBlock

]
