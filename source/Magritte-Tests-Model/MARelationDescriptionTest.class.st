Class {
	#name : #MARelationDescriptionTest,
	#superclass : #MAReferenceDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MARelationDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
MARelationDescriptionTest >> actualClass [
	^ MARelationDescription
]

{ #category : #private }
MARelationDescriptionTest >> addressInstance1 [
	^ MAMockAddress new
		street: 'Tillierstrasse 17';
		plz: 3005; place: 'Bern';
		yourself
]

{ #category : #private }
MARelationDescriptionTest >> addressInstance2 [
	^ MAMockAddress new
		street: 'In der Au';
		plz: 8765; place: 'Engi';
		yourself
]

{ #category : #running }
MARelationDescriptionTest >> setUp [
	super setUp.
	self description
		reference: MAMockAddress magritteDescription;
		classes: (Array with: MAMockAddress)
]

{ #category : #private }
MARelationDescriptionTest >> shouldSkipStringTests [
	^ true
]

{ #category : #'tests-copying' }
MARelationDescriptionTest >> testCopyClasses [
	self assert: self description copy classes = self description classes.
	self deny: self description copy classes == self description classes
]
