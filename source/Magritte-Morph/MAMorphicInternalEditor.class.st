Class {
	#name : #MAMorphicInternalEditor,
	#superclass : #MAMorphicOneToOne,
	#instVars : [
		'component'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #testing }
MAMorphicInternalEditor class >> isAbstract [
	^ false
]

{ #category : #private }
MAMorphicInternalEditor >> buildComponent [
	^ self value isNil ifFalse: [ 
		(self magritteDescription reference asComponentOn: self value)
			setParent: self;
			yourself ]
]

{ #category : #accessing }
MAMorphicInternalEditor >> children [
	^ Array with: self component
]

{ #category : #accessing }
MAMorphicInternalEditor >> component [
	^ component ifNil: [ component := self buildComponent ]
]

{ #category : #actions }
MAMorphicInternalEditor >> create [
	self value: self newRelation.
	component := nil
]

{ #category : #rendering }
MAMorphicInternalEditor >> renderViewerOn: html [
	html render: (self component
		readOnly: self isReadOnly;
		yourself)
]
