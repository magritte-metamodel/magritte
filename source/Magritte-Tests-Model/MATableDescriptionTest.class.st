Class {
	#name : #MATableDescriptionTest,
	#superclass : #MAReferenceDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MATableDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MATableDescriptionTest >> actualClass [
	^ MATableDescription
]

{ #category : #private }
MATableDescriptionTest >> includedInstance [
	^ MATableModel rows: 3 columns: 3 contents: #( '1' '2' '3' '2' '4' '6' '3' '6' '9' )
]

{ #category : #private }
MATableDescriptionTest >> shouldSkipStringTests [
	^ true
]
