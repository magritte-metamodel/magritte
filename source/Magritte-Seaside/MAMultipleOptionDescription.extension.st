Extension { #name : 'MAMultipleOptionDescription' }

{ #category : '*magritte-seaside-defaults' }
MAMultipleOptionDescription classSide >> defaultComponentClasses [
	^ Array with: MAMultiselectListComponent with: MACheckboxGroupComponent with: MAListCompositionComponent
]
