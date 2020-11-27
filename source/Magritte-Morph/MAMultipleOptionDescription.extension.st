Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*Magritte-Morph' }
MAMultipleOptionDescription class >> defaultMorphClasses [
	^ Array with: MATokenCompletionMorph with: MAMultiSelectListMorph
]
