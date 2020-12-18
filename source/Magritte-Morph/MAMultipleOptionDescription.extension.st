Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*Magritte-Morph' }
MAMultipleOptionDescription class >> defaultMorphClasses [
	^ Array with: MAMorphicTokenCompletion with: MAMorphicMultiSelectList
]
