Extension { #name : #GtPhlowProtoView }

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClassOrContainer [
	
	^ self 
		maColumnedListOf: aClassOrContainer 
		descriptionsSelect: [ :desc | true ]
]

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClassOrContainer descriptionsSelect: aBlock [
	
	| result container |
	result := self columnedList.
	
	container := aClassOrContainer isClass
		ifTrue: [ aClassOrContainer magritteTemplate magritteDescription ]
		ifFalse: [ aClassOrContainer ].
		
	container children
		select: aBlock
		thenDo: [ :desc | desc gtAddColumnTo: result ].
				
	^ result
]
