Class {
	#name : #MAComponentRenderer,
	#superclass : #MAVisitor,
	#instVars : [
		'component',
		'html',
		'errors',
		'group'
	],
	#category : 'Magritte-Seaside-Renderer'
}

{ #category : #'instance creation' }
MAComponentRenderer class >> component: aComponent on: aRenderer [
	^ self new component: aComponent on: aRenderer
]

{ #category : #rendering }
MAComponentRenderer >> basicRenderControl: aDescription [
	html render: (self childAt: aDescription)
]

{ #category : #private }
MAComponentRenderer >> childAt: aDescription [
	^ component childAt: aDescription
]

{ #category : #private }
MAComponentRenderer >> classFor: aDescription [
	| classes |
	classes := OrderedCollection withAll: aDescription currentCssClasses.
	(self hasError: aDescription)
		ifTrue: [ classes add: 'error' ].
	^ classes isEmpty
		ifFalse: [ classes reduce: [ :a :b | a , ' ' , b ] ]
]

{ #category : #visiting }
MAComponentRenderer >> component: aComponent on: aRenderer [
	self setComponent: aComponent; setRenderer: aRenderer.
	self visit: aComponent magritteDescription
]

{ #category : #testing }
MAComponentRenderer >> hasError: aDescription [
	| current |
	errors isNil
		ifFalse: [ ^ errors includes: aDescription ].
	errors := IdentitySet new.
	current := component.
	[ current notNil ] whileTrue: [
		current isMagritteContainer ifTrue: [
			errors addAll: (current errors collect: [ :each |
				each tag isDescription
					ifTrue: [ each tag ]
					ifFalse: [ current magritteDescription ] ]) ].
		current := current parent ].
	^ self hasError: aDescription
]

{ #category : #rendering }
MAComponentRenderer >> renderContainer: aDescription [
	self visitAll: (aDescription select: [ :each |
		each isVisible
			and: [ each componentClass notNil ] ])
]

{ #category : #rendering }
MAComponentRenderer >> renderControl: aDescription [

	self basicRenderControl: aDescription
]

{ #category : #rendering }
MAComponentRenderer >> renderElement: aDescription [
	aDescription group = group
		ifFalse: [ self renderGroup: aDescription ].
	self renderLabel: aDescription.
	self renderControl: aDescription
]

{ #category : #rendering }
MAComponentRenderer >> renderGroup: aDescription [
	group := aDescription group
]

{ #category : #rendering }
MAComponentRenderer >> renderLabel: aDescription [
	| label |
	aDescription hasLabel ifFalse: [ ^ self ].
	label := html label.
	(self childAt: aDescription) hasLabelId
		ifTrue: [ label for: (self childAt: aDescription) labelId ].
	label with: [ html render: aDescription label; text: ':' ]
]

{ #category : #initilization }
MAComponentRenderer >> setComponent: aComponent [
	component := aComponent
]

{ #category : #initilization }
MAComponentRenderer >> setRenderer: aRenderer [
	html := aRenderer
]

{ #category : #'visiting-description' }
MAComponentRenderer >> visitContainer: aDescription [
	self renderContainer: aDescription
]

{ #category : #'visiting-description' }
MAComponentRenderer >> visitElementDescription: aDescription [
	self renderElement: aDescription
]
