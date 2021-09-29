Class {
	#name : #MAExampleEditor,
	#superclass : #WAComponent,
	#instVars : [
		'description',
		'report'
	],
	#category : 'Magritte-Seaside-Examples'
}

{ #category : #'instance creation' }
MAExampleEditor class >> description: aDescription [
	^ self new
		magritteDescription: aDescription;
		yourself
]

{ #category : #private }
MAExampleEditor >> buildEditorFor: anObject titled: aString [
	^ anObject asComponent
		addValidatedForm;
		addMessage: aString;
		yourself
]

{ #category : #private }
MAExampleEditor >> buildReport [
	self subclassResponsibility
]

{ #category : #actions }
MAExampleEditor >> cancel [
	self answer: nil
]

{ #category : #accessing }
MAExampleEditor >> children [
	^ Array with: self report
]

{ #category : #'accessing-configuration' }
MAExampleEditor >> defaultDescription [
	self subclassResponsibility
]

{ #category : #actions }
MAExampleEditor >> edit [
	self show: (self
		buildEditorFor: description
		titled: 'Edit Container')
]

{ #category : #accessing }
MAExampleEditor >> magritteDescription [
	^ description ifNil: [ description := self defaultDescription ]
]

{ #category : #accessing }
MAExampleEditor >> magritteDescription: aDescription [
	description := aDescription
]

{ #category : #'actions-items' }
MAExampleEditor >> moveDown: aDescription [
	self magritteDescription moveDown: aDescription.
	self refresh
]

{ #category : #'actions-items' }
MAExampleEditor >> moveUp: aDescription [
	self magritteDescription moveUp: aDescription.
	self refresh
]

{ #category : #actions }
MAExampleEditor >> preview [
	self subclassResponsibility
]

{ #category : #actions }
MAExampleEditor >> refresh [
	self report rows: self magritteDescription children
]

{ #category : #rendering }
MAExampleEditor >> renderButtonsOn: html [
	html submitButton on: #edit of: self.
	html submitButton on: #preview of: self
]

{ #category : #rendering }
MAExampleEditor >> renderChildrenOn: html [
	html render: self children
]

{ #category : #rendering }
MAExampleEditor >> renderContentOn: html [
	html form: [
		self renderChildrenOn: html. "One of the children supplies input for the form"
		self renderButtonsOn: html ]
]

{ #category : #accessing }
MAExampleEditor >> report [
	^ report ifNil: [ report := self buildReport ]
]

{ #category : #actions }
MAExampleEditor >> save [
	self answer: self magritteDescription
]
