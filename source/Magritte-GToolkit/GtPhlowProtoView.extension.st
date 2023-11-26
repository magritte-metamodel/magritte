Extension { #name : #GtPhlowProtoView }

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListFromContainer: anMAContainer descriptionsSelect: aBlock [
	
	| result |
	result := self columnedList.
		
	anMAContainer children
		select: aBlock
		thenDo: [ :desc | desc gtAddColumnTo: result ].
				
	^ result
]

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClass [
	
	^ self 
		maColumnedListOf: aClass 
		descriptionsSelect: [ :desc | true ]
]

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClass descriptionsSelect: aBlock [
	
	^ self 
		maColumnedListFromContainer: aClass magritteTemplate magritteDescription 
		descriptionsSelect: aBlock
]
