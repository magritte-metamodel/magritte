Extension { #name : 'MABooleanDescription' }

{ #category : '*magritte-seaside-defaults' }
MABooleanDescription classSide >> defaultComponentClasses [
	^ Array with: MACheckboxComponent with: MASelectListComponent with: MARadioGroupComponent
]
