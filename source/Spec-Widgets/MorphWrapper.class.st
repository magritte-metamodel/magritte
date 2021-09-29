"
A MorphWrapper is used to wrap a morph with a layout in the goal to be easily added to another morph
"
Class {
	#name : #MorphWrapper,
	#superclass : #Object,
	#instVars : [
		'layout',
		'morph'
	],
	#category : 'Spec-Widgets-Utilities'
}

{ #category : #'instance creation' }
MorphWrapper class >> morph: morph layout: layout [ 

	^ self new
		layout: layout;
		morph: morph;
		yourself
]

{ #category : #adding }
MorphWrapper >> addIn: aContainer [
		
	aContainer
		addMorph: morph
		fullFrame: layout
]

{ #category : #accessing }
MorphWrapper >> frame: rectangle [
	
	layout := rectangle asLayoutFrame
]

{ #category : #accessing }
MorphWrapper >> fullFrame: anObject [
	
	layout := anObject
]

{ #category : #accessing }
MorphWrapper >> morph: anObject [
	
	morph := anObject
]
