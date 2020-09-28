Class {
	#name : #MATableRenderer,
	#superclass : #MAComponentRenderer,
	#category : 'Magritte-Seaside-Renderer'
}

{ #category : #rendering }
MATableRenderer >> renderContainer: aDescription [ 
	html table
		class: (self classFor: aDescription);
		with: [ super renderContainer: aDescription ]
]

{ #category : #rendering }
MATableRenderer >> renderControl: aDescription [
	html tableData
		class: (self classFor: aDescription);
		with: [ self basicRenderControl: aDescription ]
]

{ #category : #rendering }
MATableRenderer >> renderElement: aDescription [
	aDescription group = group
		ifFalse: [ self renderGroup: aDescription ].
	html tableRow: [ self renderElementRow: aDescription ]
]

{ #category : #rendering }
MATableRenderer >> renderElementRow: aDescription [
	"Extracted this method to be better able to override behavior"

	self renderLabel: aDescription.
	self renderControl: aDescription
]

{ #category : #rendering }
MATableRenderer >> renderGroup: aDescription [
	super renderGroup: aDescription.
	group isNil ifTrue: [ ^ self ].
	html tableRow class: 'group'; with: [ 
		html tableHeading
			colSpan: 2;
			with: group ]
]

{ #category : #rendering }
MATableRenderer >> renderLabel: aDescription [
	html tableHeading
		title: aDescription comment;
		class: (self classFor: aDescription);
		with: [ super renderLabel: aDescription ]
]
