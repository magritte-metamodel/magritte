Extension { #name : #MADescription }

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphColor [
	^ Color white
]

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphicClass [
	^ self defaultMorphicClasses notEmpty
		ifTrue: [ self defaultMorphicClasses first ]
]

{ #category : #'*Magritte-Morph' }
MADescription class >> defaultMorphicClasses [
	^ Array new
]

{ #category : #'*magritte-morph-accessing' }
MADescription >> descriptionMorphicClass [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #morphicClass;
		label: 'Morph Class';
		priority: 2000;
		reference: MAClassDescription new;
		options: self class defaultMorphicClasses;
		default: self class defaultMorphicClass;
		yourself
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphColor [
	^ self propertyAt: #morphColor ifAbsent: [ self class defaultMorphColor ]
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphColor: aColor [
	^ self propertyAt: #morphColor put: aColor
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphicClass [
	^ self propertyAt: #morphicClass ifAbsent: [ self class defaultMorphicClass ]
]

{ #category : #'*Magritte-Morph' }
MADescription >> morphicClass: aClass [
	^ self propertyAt: #morphicClass put: aClass
]
