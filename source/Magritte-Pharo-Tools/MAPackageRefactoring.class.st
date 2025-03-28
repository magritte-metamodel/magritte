Class {
	#name : #MAPackageRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'classes'
	],
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #initialization }
MAPackageRefactoring class >> model: model classes: classes [
	^  self new
		model: model;
		classes: classes;
		yourself
]

{ #category : #accessing }
MAPackageRefactoring >> classes [
	^ classes
]

{ #category : #accessing }
MAPackageRefactoring >> classes: anObject [
	classes := anObject
]

{ #category : #preconditions }
MAPackageRefactoring >> preconditions [
	^ RBCondition true
]

{ #category : #transforming }
MAPackageRefactoring >> transform [
	self privateTransform
]

{ #category : #transforming }
MAPackageRefactoring >> privateTransform [
	self classes 
		collect: [ :each | MAClassRefactoring model: self model className: each ]
		thenDo: [ :each | self generateChangesFor: each ]
]
