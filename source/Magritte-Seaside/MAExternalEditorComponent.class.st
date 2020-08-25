Class {
	#name : #MAExternalEditorComponent,
	#superclass : #MAOneToOneComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAExternalEditorComponent class >> isAbstract [
	^ false
]

{ #category : #actions }
MAExternalEditorComponent >> create [
	self chooser: (self editorFor: self selected new)
]

{ #category : #actions }
MAExternalEditorComponent >> edit [
	self chooser: (self editorFor: self value)
]

{ #category : #rendering }
MAExternalEditorComponent >> renderButtonsOn: html [
	html submitButton on: #remove of: self.
	html submitButton on: #edit of: self
]

{ #category : #rendering }
MAExternalEditorComponent >> renderViewerOn: html [
	html render: (self reference toString: self value)
]
