Extension { #name : 'MANumberDescription' }

{ #category : '*magritte-seaside' }
MANumberDescription classSide >> defaultComponentClasses [
	^ Array with: MATextInputComponent with: MARangeComponent
]
