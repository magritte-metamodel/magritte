Extension { #name : #MASingleOptionDescription }

{ #category : #'*Magritte-Morph' }
MASingleOptionDescription class >> defaultMorphicClasses [
	^ Array
			with: MAMorphicSingleSelectList
			with: MAMorphicDropList
]
