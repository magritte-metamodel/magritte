Extension { #name : #MADescription }

{ #category : #'*Magritte-GToolkit' }
MADescription >> blocClass [
	^ self propertyAt: #blocClass ifAbsent: [ MAElementBuilder"self class defaultMorphicClass" ]
]

{ #category : #'*Magritte-GToolkit' }
MADescription >> blocClass: aClass [
	^ self propertyAt: #blocClass put: aClass
]
