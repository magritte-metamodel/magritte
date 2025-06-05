Extension { #name : 'MADateDescription' }

{ #category : '*magritte-seaside' }
MADateDescription classSide >> defaultComponentClasses [
	^ Array with: MADateInputComponent with: MADateSelectorComponent
]
