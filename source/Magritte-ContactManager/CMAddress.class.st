"
A simple address for a city located in Switzerland.
"
Class {
	#name : #CMAddress,
	#superclass : #Object,
	#instVars : [
		'street',
		'plz',
		'place',
		'canton',
		'nationality'
	],
	#category : 'Magritte-ContactManager'
}

{ #category : #comparing }
CMAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self plz = anObject plz
		and: [ self place = anObject place
		and: [ self canton = anObject canton ] ] ] ]
]

{ #category : #accessing }
CMAddress >> canton [
	^ canton
]

{ #category : #accessing }
CMAddress >> canton: anObject [
	canton := anObject
]

{ #category : #descriptions }
CMAddress >> descriptionCanton [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #( 'Zurich' 'Bern' 'Luzern' 'Uri' 'Schwyz' 'Unterwalden' 'Glarus' 'Zug' 'Freiburg' 'Solothurn' 'Basel' 'Schaffhausen' 'Appenzell' 'St. Gallen' 'Graubunden' 'Aargau' 'Thurgau' 'Ticino' 'Vaud' 'Valais' 'Neuchatel' 'Geneve' 'Jura' );
		reference: MAStringDescription new;
		accessor: #canton;
		label: 'Canton';
		priority: 40;
		beSorted;
		yourself
]

{ #category : #descriptions }
CMAddress >> descriptionPlace [
	<magritteDescription>
	
	^ MAStringDescription new
			accessor: #place;
			label: 'Place';
			priority: 30;
			yourself
]

{ #category : #descriptions }
CMAddress >> descriptionPlz [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #plz;
		label: 'PLZ';
		priority: 20;
		min: 1000;
		max: 9999;
		yourself
]

{ #category : #descriptions }
CMAddress >> descriptionStreet [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #street;
		label: 'Street';
		priority: 10;
		yourself
]

{ #category : #comparing }
CMAddress >> hash [
	^ self street hash bitXor: self place hash
]

{ #category : #accessing }
CMAddress >> nationality [
	^ nationality
]

{ #category : #accessing }
CMAddress >> nationality: anObject [
	nationality := anObject
]

{ #category : #accessing }
CMAddress >> place [
	^ place
]

{ #category : #accessing }
CMAddress >> place: anObject [
	place := anObject
]

{ #category : #accessing }
CMAddress >> plz [
	^ plz
]

{ #category : #accessing }
CMAddress >> plz: anObject [
	plz := anObject
]

{ #category : #accessing }
CMAddress >> street [
	^ street
]

{ #category : #accessing }
CMAddress >> street: anObject [
	street := anObject
]
