Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Morph' }
MAToOneRelationDescription classSide >> defaultMorphClasses [
	^ Array with: MAExternalEditorMorph with: MAInternalEditorMorph
]
