Class {
	#name : #MADropdownWish,
	#superclass : #BrWish,
	#instVars : [
		'selection'
	],
	#category : #'Magritte-GToolkit'
}

{ #category : #accessing }
MADropdownWish >> selection [
	^ selection
]

{ #category : #accessing }
MADropdownWish >> selection: anObject [
	selection := anObject
]
