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

{ #category : #'*magritte-morph-converting' }
MAContainer >> elementBuilderFor: anObject [
	
	self flag: 'Commented out from #asMorphOn:'.
	"memento := anObject mementoClass
			model: anObject
			description: self."
	^ self blocClass buildElementFor: anObject"memento: memento"
]
