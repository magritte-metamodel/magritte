Extension { #name : 'MAToOneRelationDescription' }

{ #category : '*magritte-seaside-defaults' }
MAToOneRelationDescription classSide >> defaultComponentClasses [
	^ Array with: MAExternalEditorComponent with: MAInternalEditorComponent
]
