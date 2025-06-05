Class {
	#name : 'MAGtInputFieldAptitude',
	#superclass : 'BrGlamorousInputFieldSpacingAptitude',
	#category : 'Magritte-GToolkit'
}

{ #category : 'accessing' }
MAGtInputFieldAptitude >> initialize [

	super initialize.
	self add: BrGlamorousEditorAptitude
]
