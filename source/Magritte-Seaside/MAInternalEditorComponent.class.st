Class {
	#name : #MAInternalEditorComponent,
	#superclass : #MAOneToOneComponent,
	#instVars : [
		'component'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAInternalEditorComponent class >> isAbstract [
	^ false
]

{ #category : #private }
MAInternalEditorComponent >> buildComponent [
	^ self value isNil ifFalse: [ 
		(self magritteDescription reference asComponentOn: self value)
			setParent: self;
			yourself ]
]

{ #category : #accessing }
MAInternalEditorComponent >> children [
	^ Array with: self component
]

{ #category : #accessing }
MAInternalEditorComponent >> component [
	^ component ifNil: [ component := self buildComponent ]
]

{ #category : #actions }
MAInternalEditorComponent >> create [
	self value: self selected new.
	component := nil
]

{ #category : #rendering }
MAInternalEditorComponent >> renderViewerOn: html [
	html render: (self component
		readonly: self isReadonly;
		yourself)
]
