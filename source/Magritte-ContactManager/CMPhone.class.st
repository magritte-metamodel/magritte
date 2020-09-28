"
A simple phone model
"
Class {
	#name : #CMPhone,
	#superclass : #Object,
	#instVars : [
		'kind',
		'number'
	],
	#category : 'Magritte-ContactManager'
}

{ #category : #comparing }
CMPhone >> = anObject [
	^ self species = anObject species
		and: [ self kind = anObject kind
		and: [ self number = anObject number ] ]
]

{ #category : #descriptions }
CMPhone >> descriptionKind [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #kind;
		label: 'Kind';
		priority: 10;
		yourself
]

{ #category : #descriptions }
CMPhone >> descriptionNumber [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #number;
		label: 'Number';
		priority: 20;
		yourself
]

{ #category : #comparing }
CMPhone >> hash [
	^ self kind hash bitXor: self number hash
]

{ #category : #accessing }
CMPhone >> kind [
	^ kind
]

{ #category : #accessing }
CMPhone >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
CMPhone >> number [
	^ number
]

{ #category : #accessing }
CMPhone >> number: anObject [
	number := anObject
]
