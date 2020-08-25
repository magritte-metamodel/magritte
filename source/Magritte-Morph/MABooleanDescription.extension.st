Extension { #name : #MABooleanDescription }

{ #category : #'*magritte-morph-default' }
MABooleanDescription classSide >> defaultMorphClasses [
	^ Array with: MACheckboxMorph with: MASingleSelectListMorph
]
