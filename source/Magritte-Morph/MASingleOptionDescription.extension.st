Extension { #name : 'MASingleOptionDescription' }

{ #category : '*Magritte-Morph' }
MASingleOptionDescription classSide >> defaultMorphicClasses [
	^ Array
			with: MAMorphicSingleSelectList
			with: MAMorphicDropList
]
