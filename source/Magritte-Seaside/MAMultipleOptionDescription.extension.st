Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*magritte-seaside-defaults' }
MAMultipleOptionDescription class >> defaultComponentClasses [
	^ Array with: MAMultiselectListComponent with: MACheckboxGroupComponent with: MAListCompositonComponent
]
