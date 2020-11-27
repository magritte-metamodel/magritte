Class {
	#name : #MACssRenderer,
	#superclass : #MAComponentRenderer,
	#category : 'Magritte-Seaside-Renderer'
}

{ #category : #rendering }
MACssRenderer >> renderContainer: aDescription [ 
	html definitionList
		class: (self classFor: aDescription);
		with: [ super renderContainer: aDescription ]
]

{ #category : #rendering }
MACssRenderer >> renderControl: aDescription [
	html definitionData
		class: (self classFor: aDescription);
		with: [ super renderControl: aDescription ]
]

{ #category : #rendering }
MACssRenderer >> renderGroup: aDescription [
	super renderGroup: aDescription.
	group isNil ifTrue: [ ^ self ].
	html definitionTerm
		class: 'group';
		with: group
]

{ #category : #rendering }
MACssRenderer >> renderLabel: aDescription [
	html definitionTerm
		title: aDescription comment;
		class: (self classFor: aDescription);
		with: [ super renderLabel: aDescription ]
]
