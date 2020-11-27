Extension { #name : #MAToOneRelationDescription }

{ #category : #'*magritte-seaside-defaults' }
MAToOneRelationDescription class >> defaultComponentClasses [
	^ Array with: MAExternalEditorComponent with: MAInternalEditorComponent
]
