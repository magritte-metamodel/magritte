Class {
	#name : #MAMorphicCheckbox,
	#superclass : #MAMorphicElement,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicCheckbox >> buildMorphView [
	^ self theme
		newCheckboxIn: nil
		for: self
		getSelected: #selected
		setSelected: #selected:
		getEnabled: #enabled
		label: ''
		help: self magritteDescription comment
]

{ #category : #actions }
MAMorphicCheckbox >> enabled [
	^ true
]

{ #category : #actions }
MAMorphicCheckbox >> selected [
	^ (self value ifNil: [ self magritteDescription default ]) ifNil: [ false ]
]

{ #category : #actions }
MAMorphicCheckbox >> selected: aBoolean [
	self value: aBoolean 
]
