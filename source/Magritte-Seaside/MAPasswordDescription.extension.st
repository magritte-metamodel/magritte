Extension { #name : #MAPasswordDescription }

{ #category : #'*magritte-seaside-default' }
MAPasswordDescription class >> defaultComponentClasses [
	^ Array with: MATextPasswordComponent with: MAVerifiedPasswordComponent with: MATextInputComponent
]
