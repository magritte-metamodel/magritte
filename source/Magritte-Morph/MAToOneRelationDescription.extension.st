Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Morph' }
MAToOneRelationDescription class >> defaultMorphicClasses [
	^ Array with: MAMorphicExternalEditor with: MAMorphicInternalEditor
]
