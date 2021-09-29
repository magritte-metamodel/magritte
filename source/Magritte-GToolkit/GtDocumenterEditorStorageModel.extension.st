Extension { #name : 'GtDocumenterEditorStorageModel' }

{ #category : '*Magritte-GToolkit' }
GtDocumenterEditorStorageModel >> maFor: anObject using: aDescription [ 
	| s |
	s := MAGtDescriptionStorageStrategy new
		description: aDescription;
		object: anObject;
		yourself.
	self storage: s
]
