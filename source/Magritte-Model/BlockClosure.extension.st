Extension { #name : #BlockClosure }

{ #category : #'*magritte-model-description' }
BlockClosure >> optionFor: anObject ifPresent: aBlock [
	aBlock value: (self cull: anObject)
]
