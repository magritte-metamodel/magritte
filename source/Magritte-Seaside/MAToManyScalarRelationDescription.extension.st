Extension { #name : #MAToManyScalarRelationDescription }

{ #category : #'*magritte-seaside-accessing-defaults' }
MAToManyScalarRelationDescription class >> defaultComponentClasses [
	^ Array with: MAOneToManyScalarComponent
]

{ #category : #'*magritte-seaside-accessing-defaults' }
MAToManyScalarRelationDescription class >> defaultReportColumnClasses [
	^ Array with: MADescribedScalarColumn
]
