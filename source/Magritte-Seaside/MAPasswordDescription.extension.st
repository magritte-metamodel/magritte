Extension { #name : 'MAPasswordDescription' }

{ #category : '*magritte-seaside-default' }
MAPasswordDescription classSide >> defaultComponentClasses [
	^ Array with: MATextPasswordComponent with: MAVerifiedPasswordComponent with: MATextInputComponent
]
