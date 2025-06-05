Class {
	#name : 'MAMorphicExternalEditor',
	#superclass : 'MAMorphicOneToOne',
	#category : 'Magritte-Morph-Model'
}

{ #category : 'testing' }
MAMorphicExternalEditor class >> isAbstract [
	^ false
]

{ #category : 'actions' }
MAMorphicExternalEditor >> create [
	self newRelation asMagritteMorph
		onAnswer: [ :result | result isNil ifFalse: [ self value: result ] ];
		addButtons; 
		addWindow;
		openInWorld
]

{ #category : 'actions' }
MAMorphicExternalEditor >> edit [
	self chooser: (self editorFor: self value)
]

{ #category : 'rendering' }
MAMorphicExternalEditor >> renderButtonsOn: html [
	html submitButton on: #remove of: self.
	html submitButton on: #edit of: self
]

{ #category : 'rendering' }
MAMorphicExternalEditor >> renderViewerOn: html [
	html render: (self reference toString: self value)
]
