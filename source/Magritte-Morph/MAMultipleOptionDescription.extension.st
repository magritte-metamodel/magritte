Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*Magritte-Morph' }
MAMultipleOptionDescription class >> defaultMorphicClasses [
	^ Array with: MAMorphicTokenCompletion with: MAMorphicMultiSelectList
]
