Class {
	#name : #MAMockAddress,
	#superclass : #Object,
	#instVars : [
		'place',
		'street',
		'plz'
	],
	#category : 'Magritte-Tests-Model-Mocks'
}

{ #category : #comparing }
MAMockAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self plz = anObject plz
		and: [ self place = anObject place ] ] ]
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		propertyAt: #addressContainerBase put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled1 [
	<magritteDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled1: aDescription [
	<magritteDescription: #descriptionNilled1>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled2 [
	<magritteDescription>
	^ MAStringDescription new
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled2: aDescription [
	<magritteDescription: #descriptionNilled2>
	^ nil
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlace [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #place;
		label: 'Place';
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlace: aDescription [
	<magritteDescription: #descriptionPlace>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlaceOther: aDescription [
	<magritteDescription: #descriptionPlace>
	^ aDescription beHidden
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlz [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #plz;
		label: 'PLZ';
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionStreet [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #street;
		label: 'Street';
		yourself
]

{ #category : #comparing }
MAMockAddress >> hash [
	^ self street hash
]

{ #category : #'accessing-generated' }
MAMockAddress >> place [
	^ place
]

{ #category : #'accessing-generated' }
MAMockAddress >> place: anObject [
	place := anObject
]

{ #category : #'accessing-generated' }
MAMockAddress >> plz [
	^ plz
]

{ #category : #'accessing-generated' }
MAMockAddress >> plz: anObject [
	plz := anObject
]

{ #category : #'accessing-generated' }
MAMockAddress >> street [
	^ street
]

{ #category : #'accessing-generated' }
MAMockAddress >> street: anObject [
	street := anObject
]
