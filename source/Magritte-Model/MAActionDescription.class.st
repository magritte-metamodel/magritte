Class {
	#name : #MAActionDescription,
	#superclass : #Object,
	#instVars : [
		'selector',
		'enableBlock',
		'model',
		'comment',
		'priority',
		'label'
	],
	#category : 'Magritte-Model-Description'
}

{ #category : #accessing }
MAActionDescription >> comment: aString [

	comment := aString.
]

{ #category : #accessing }
MAActionDescription >> enableBlock: aBlock [
	"aBlock
		- one argument (optional); the model object
		- returns a boolean indicating whether the button should be enabled"
	
	enableBlock := aBlock.
]

{ #category : #'initialize-release' }
MAActionDescription >> initialize [

	super initialize.
	enableBlock := [ true ].
]

{ #category : #testing }
MAActionDescription >> isEnabled [

	^ enableBlock cull: model.
]

{ #category : #accessing }
MAActionDescription >> label [

	^ label ifNil: [ selector capitalized normalizeCamelCase ].
]

{ #category : #accessing }
MAActionDescription >> label: aString [

	label := aString.
]

{ #category : #private }
MAActionDescription >> perform [

	model perform: selector.
]

{ #category : #accessing }
MAActionDescription >> priority: anInteger [ 

	priority := anInteger.
]

{ #category : #accessing }
MAActionDescription >> selector: aSymbol [

	selector := aSymbol.
]
