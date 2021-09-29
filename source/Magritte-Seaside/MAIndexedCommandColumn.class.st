Class {
	#name : #MAIndexedCommandColumn,
	#superclass : #MACommandColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #'accessing-defaults' }
MAIndexedCommandColumn >> defaultFormat [
	^ MessageSend receiver: self selector: #renderCellContent:on:index:
]

{ #category : #rendering }
MAIndexedCommandColumn >> renderCellContent: anObject on: html index: anInteger [
	self commands
		do: [ :each |
			html anchor
				callback: [ each key valueWithArguments: (Array
					with: anObject
					with: anInteger) ];
				with: each value ]
		separatedBy: [ html space ]
]
