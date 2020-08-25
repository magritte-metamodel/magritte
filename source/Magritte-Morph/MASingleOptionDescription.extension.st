Extension { #name : #MASingleOptionDescription }

{ #category : #'*Magritte-Morph' }
MASingleOptionDescription classSide >> defaultMorphClasses [
	^ Array
			with: MASingleSelectListMorph
			with: MADropListMorph
]
