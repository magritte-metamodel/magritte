"
A RadioButtonGroup is a group for radio buttons which ensure that only radio button of this group is activated at the same time.
"
Class {
	#name : 'RadioButtonGroup',
	#superclass : 'Object',
	#instVars : [
		'buttons'
	],
	#category : 'Spec-Widgets-Utilities'
}

{ #category : 'protocol' }
RadioButtonGroup >> addRadioButton: aButton [

	buttons do: [:b | 
		aButton whenActivatedDo: [ b privateSetState: false ].
		b whenActivatedDo: [ aButton privateSetState: false ]].
		
	buttons add: aButton.
	aButton privateSetState: false
]

{ #category : 'protocol' }
RadioButtonGroup >> default: aButton [

	aButton privateSetState: true.
	aButton takeKeyboardFocus.
]

{ #category : 'initialization' }
RadioButtonGroup >> initialize [
	"Initialization code for RadioButtonGroup"

	super initialize.

	buttons := OrderedCollection new.
]
