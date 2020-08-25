Extension { #name : #MAToManyScalarRelationDescription }

{ #category : #'*magritte-seaside-accessing-defaults' }
MAToManyScalarRelationDescription classSide >> defaultComponentClasses [
	^ Array with: MAOneToManyScalarComponent
]

{ #category : #'*magritte-seaside-accessing-defaults' }
MAToManyScalarRelationDescription classSide >> defaultReportColumnClasses [
	^ Array with: MADescribedScalarColumn
]
