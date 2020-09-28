Extension { #name : #Class }

{ #category : #'*Magritte-Developer' }
Class >> maAddField [
	| fieldName |
	fieldName := UIManager default request: 'Field name?'.
	fieldName ifNil: [ ^ self ].
	self maAddField: fieldName asSymbol
]
