Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*Magritte-Morph' }
MAMultipleOptionDescription classSide >> defaultMorphClasses [
	^ Array with: MATokenCompletionMorph with: MAMultiSelectListMorph
]
