Extension { #name : #MATimeDescription }

{ #category : #'*magritte-seaside' }
MATimeDescription classSide >> defaultComponentClasses [
	^ Array with: MATimeInputComponent with: MATimeSelectorComponent
]
