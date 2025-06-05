Extension { #name : 'MAToManyRelationDescription' }

{ #category : '*magritte-morph-defaults' }
MAToManyRelationDescription classSide >> defaultMorphicClasses [
	^ Array with: MAMorphicOneToMany
]
