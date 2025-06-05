Extension { #name : 'MABooleanDescription' }

{ #category : '*magritte-morph-default' }
MABooleanDescription classSide >> defaultMorphicClasses [
	^ Array with: MAMorphicCheckbox with: MAMorphicSingleSelectList
]
