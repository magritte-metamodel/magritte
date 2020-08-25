Class {
	#name : #MARelationComponent,
	#superclass : #MAElementComponent,
	#instVars : [
		'selected'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #'accessing-dynamic' }
MARelationComponent >> classes [
	^ self magritteDescription classes
]

{ #category : #private }
MARelationComponent >> editorFor: anObject [
	^ anObject asComponent
		addValidatedForm;
		yourself
]

{ #category : #'rendering-tools' }
MARelationComponent >> renderSelectButtonOn: html [
	self subclassResponsibility
]

{ #category : #'rendering-tools' }
MARelationComponent >> renderSelectListOn: html [
	self classes size > 1 ifTrue: [
		html select
			list: self classes;
			selected: self selected;
			callback: [ :value | self selected: value ];
			labels: [ :value | value label ] ].
	self classes notEmpty
		ifTrue: [ self renderSelectButtonOn: html ]
]

{ #category : #accessing }
MARelationComponent >> selected [
	^ selected ifNil: [ selected := self classes first ]
]

{ #category : #accessing }
MARelationComponent >> selected: aClass [
	selected := aClass
]
