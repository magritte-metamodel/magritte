Extension { #name : #MAContainer }

{ #category : #'*magritte-morph-converting' }
MAContainer >> asMorphOn: anObject [
	| memento |
	memento := anObject mementoClass
			model: anObject
			description: self.
	^ self morphicClass memento: memento
]

{ #category : #'*Magritte-Morph' }
MAContainer class >> defaultMorphicClasses [
	^ Array with: MAMorphicContainer
]
