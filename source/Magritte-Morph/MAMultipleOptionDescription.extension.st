Extension { #name : 'MAMultipleOptionDescription' }

{ #category : '*Magritte-Morph' }
MAMultipleOptionDescription classSide >> defaultMorphicClasses [
	^ Array with: MAMorphicTokenCompletion with: MAMorphicMultiSelectList
]
