Extension { #name : #GtPhlowProtoView }

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClass [
	
	^ self 
		maColumnedListOf: aClass 
		descriptionsSelect: [ :desc | true ]
]

{ #category : #'*Magritte-GToolkit' }
GtPhlowProtoView >> maColumnedListOf: aClass descriptionsSelect: aBlock [
	
	| result |
	result := self columnedList.
		
	aClass magritteTemplate magritteDescription children
		select: aBlock
		thenDo: [ :desc | desc gtAddColumnTo: result ].
				
	^ result
]
