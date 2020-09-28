Extension { #name : #MABooleanDescription }

{ #category : #'*magritte-seaside-defaults' }
MABooleanDescription class >> defaultComponentClasses [
	^ Array with: MACheckboxComponent with: MASelectListComponent with: MARadioGroupComponent
]
