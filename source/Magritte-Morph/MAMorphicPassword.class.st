Class {
	#name : 'MAMorphicPassword',
	#superclass : 'MAMorphicText',
	#category : 'Magritte-Morph-Model',
	#package : 'Magritte-Morph',
	#tag : 'Model'
}

{ #category : 'private' }
MAMorphicPassword >> buildMorphView [
	^ super buildMorphView
		font: (StrikeFont passwordFontSize: 12);
		yourself
]
