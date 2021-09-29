Extension { #name : 'GtDocumenter' }

{ #category : '*Magritte-GToolkit' }
GtDocumenter class >> maFor: anObject using: aDescription [
	| result |
	result := self new.
	result editorElement maFor: anObject using: aDescription.
	^ result read
]
