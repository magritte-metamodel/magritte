Class {
	#name : 'MAMorphicDirectory',
	#superclass : 'MAMorphicFile',
	#category : 'Magritte-Morph-Model'
}

{ #category : 'private' }
MAMorphicDirectory >> choose: titleString in: defaultDirectory [

	^ UIManager default chooseDirectory: titleString from: defaultDirectory.
]
