Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Morph' }
MAToOneRelationDescription class >> defaultMorphClasses [
	^ Array with: MAMorphicExternalEditor with: MAMorphicInternalEditor
]
