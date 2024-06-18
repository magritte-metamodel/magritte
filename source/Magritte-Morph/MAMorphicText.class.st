Class {
	#name : #MAMorphicText,
	#superclass : #MAMorphicElement,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicText >> buildMorphView [
	^ self theme
		newTextEntryIn: nil
		for: self
		get: #string
		set: #string:
		class: String
		getEnabled: #enabled
		help: self magritteDescription comment
]

{ #category : #accessing }
MAMorphicText >> enabled [

	^ self magritteDescription readOnly not
]
