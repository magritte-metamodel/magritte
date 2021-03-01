Class {
	#name : #MAMorphicText,
	#superclass : #MAMorphicMemo,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicText >> buildMorphView [
	^ Smalltalk ui theme
		newTextEntryIn: nil
		for: self
		get: #string
		set: #string:
		class: String
		getEnabled: #enabled
		help: self magritteDescription comment
]
