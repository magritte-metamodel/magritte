Class {
	#name : #MADescribedColumn,
	#superclass : #MAColumn,
	#instVars : [
		'description'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #accessing }
MADescribedColumn >> classFor: aDescription [
	| classes |
	classes := OrderedCollection withAll: aDescription currentCssClasses.
	^ classes isEmpty ifFalse: [ classes reduce: [ :a :b | a , ' ' , b ] ]
]

{ #category : #'accessing-defaults' }
MADescribedColumn >> defaultComment [
	^ self magritteDescription comment
]

{ #category : #'accessing-defaults' }
MADescribedColumn >> defaultLabel [
	^ self magritteDescription label
]

{ #category : #'accessing-defaults' }
MADescribedColumn >> defaultSorter [
	^ (self magritteDescription isSortable and: [ self magritteDescription isRequired ])
		ifTrue: [ super defaultSorter ]
]

{ #category : #'accessing-defaults' }
MADescribedColumn >> defaultVisible [
	^ self magritteDescription isVisible
]

{ #category : #accessing }
MADescribedColumn >> isSortable [
	^self magritteDescription isSortable and: [super isSortable]
]

{ #category : #accessing }
MADescribedColumn >> magritteDescription [
	^ description
]

{ #category : #accessing }
MADescribedColumn >> magritteDescription: aDescription [
	description := aDescription.
	accessor := aDescription accessor
]

{ #category : #actions }
MADescribedColumn >> stringFor: anObject [
	^ self magritteDescription toString: anObject
]

{ #category : #accessing }
MADescribedColumn >> tableDataClass [
	^ self classFor: self magritteDescription
]

{ #category : #accessing }
MADescribedColumn >> tableHeadingClass [
	^ self classFor: self magritteDescription
]

{ #category : #actions }
MADescribedColumn >> valueFor: aRow [
	^ (super valueFor: aRow) ifNil: [ self magritteDescription default ]
]
