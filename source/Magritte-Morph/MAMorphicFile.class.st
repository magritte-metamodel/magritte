Class {
	#name : 'MAMorphicFile',
	#superclass : 'MAMorphicElement',
	#instVars : [
		'rectangleMorph'
	],
	#category : 'Magritte-Morph-Model'
}

{ #category : 'private-building' }
MAMorphicFile >> buildMorphView [

	| button |
	rectangleMorph := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	button := self buttonMorph: #choose.
	button
		hResizing: #shrinkWrap.
	rectangleMorph addMorphBack: button.
	self value ifNotNil: [ self displayCurrentValue ].
	^ rectangleMorph.
]

{ #category : 'actions' }
MAMorphicFile >> choose [
	| file |
	file := self
		choose: 'Choose ', self magritteDescription label
		in: self magritteDescription defaultDirectory. 
	file ifNil: [ ^ self ].
	self value: file.
	self displayCurrentValue.
]

{ #category : 'private' }
MAMorphicFile >> choose: titleString in: defaultDirectory [

	^ UIManager default chooseFile: titleString in: defaultDirectory.

	"We're using UIManager apparently for two reasons:
		1. To maintain compatibility between Pharo and Squeak.
		2. If this is a Seaside app, we may be headless
	However, none of the Squeak/Pharo common UIManager API does what's needed e.g. to specify a starting folder. So I'm implementing the #chooseFile:in: for headful Pharo. At such time when someone tries in another scenario i.e. headless/Squeak, we have an entry point to implement support for those"
]

{ #category : 'private' }
MAMorphicFile >> currentValueMorph [

	| exists |
	exists := rectangleMorph submorphs size = 2.
	exists ifFalse: [ rectangleMorph addMorph: StringMorph new ].
	^ rectangleMorph submorphs first.
]

{ #category : 'private' }
MAMorphicFile >> displayCurrentValue [

	| displayString |
	displayString := self magritteDescription toString: self value.
	self currentValueMorph contents: displayString.
]
