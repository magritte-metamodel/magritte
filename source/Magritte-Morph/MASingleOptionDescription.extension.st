Extension { #name : #MASingleOptionDescription }

{ #category : #'*Magritte-Morph' }
MASingleOptionDescription class >> defaultMorphClasses [
	^ Array
			with: MAMorphicSingleSelectList
			with: MAMorphicDropList
]
