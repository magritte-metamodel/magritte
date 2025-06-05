Extension { #name : 'MAToOneRelationDescription' }

{ #category : '*Magritte-Morph' }
MAToOneRelationDescription classSide >> defaultMorphicClasses [
	^ Array with: MAMorphicExternalEditor with: MAMorphicInternalEditor
]
