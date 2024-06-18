Class {
	#name : 'MAMorphicDirectory',
	#superclass : 'MAMorphicFile',
	#category : 'Magritte-Morph-Model',
	#package : 'Magritte-Morph',
	#tag : 'Model'
}

{ #category : 'private' }
MAMorphicDirectory >> choose: titleString in: defaultDirectory [

	^ UIManager default chooseDirectory: titleString from: defaultDirectory.
]
