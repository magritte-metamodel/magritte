Class {
	#name : #MAOneToOneComponent,
	#superclass : #MARelationComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MAOneToOneComponent >> create [
	self subclassResponsibility
]

{ #category : #actions }
MAOneToOneComponent >> remove [
	self value: nil
]

{ #category : #rendering }
MAOneToOneComponent >> renderButtonsOn: html [
]

{ #category : #rendering }
MAOneToOneComponent >> renderEditorOn: html [
	self value isNil
		ifTrue: [ self renderSelectListOn: html ]
		ifFalse: [ self renderViewerOn: html; renderButtonsOn: html ]
]

{ #category : #'rendering-tools' }
MAOneToOneComponent >> renderSelectButtonOn: html [
	html submitButton on: #create of: self
]
