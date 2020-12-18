Class {
	#name : #MAMorphicMemo,
	#superclass : #MAMorphicElement,
	#category : #'Magritte-Morph-Model'
}

{ #category : #accessing }
MAMorphicMemo >> annotation [
	^ self string
]

{ #category : #private }
MAMorphicMemo >> buildMorphView [
	"The selector #annotation should be #string instead, but we use this one and dispatch since this prevents morphic to draw a thin red border around changed fields. Stupid hack, really, but doesn't work otherwise."

	| result lineSpacingFactor height |
	result := RubPluggableTextMorph on: self text: #annotation accept: #string: readSelection: nil menu: nil.
	
	"We want to set the height to honor the #lineCount from the description, but PluggableTextMorph doesn't seem to have an API to get the height of a hypothetical block of text e.g. 5 lines in the current font. So we work out an approximation as follows..."
	lineSpacingFactor := 1.1. "This seems to account well for space between lines"
	height := (description lineCount * result font height * lineSpacingFactor) + (result borderWidth * 2).
	
	^ result
			height: height;
			hResizing: #spaceFill;
			borderColor: #inset;
			borderWidth: 1
]

{ #category : #accessing }
MAMorphicMemo >> enabled [

	^ self magritteDescription readOnly not
]

{ #category : #accessing }
MAMorphicMemo >> selected [
	^ (self value ifNil: [ self magritteDescription default ]) ifNil: [ false ]
]

{ #category : #accessing }
MAMorphicMemo >> selected: aBoolean [
	self value: aBoolean 
]
