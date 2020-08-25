Class {
	#name : #MASelectionColumn,
	#superclass : #MAActionColumn,
	#instVars : [
		'selection'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #'accessing-defaults' }
MASelectionColumn >> defaultSelection [
	self subclassResponsibility
]

{ #category : #'accessing-defaults' }
MASelectionColumn >> defaultStringDeselected [
	self subclassResponsibility
]

{ #category : #'accessing-defaults' }
MASelectionColumn >> defaultStringSelected [
	self subclassResponsibility
]

{ #category : #actions }
MASelectionColumn >> deselectRow: anObject [
	self subclassResponsibility
]

{ #category : #testing }
MASelectionColumn >> isSelected: anObject [
	self subclassResponsibility
]

{ #category : #actions }
MASelectionColumn >> refresh [
	super refresh.
	self selection: self defaultSelection
]

{ #category : #rendering }
MASelectionColumn >> renderCellLinkContent: anObject on: html [
	| selected |
	selected := self isSelected: anObject.
	html anchor 
		class: (selected ifTrue: [ 'selected' ]);
		callback: [ self selectRow: anObject value: selected not ];
		with: (selected
			ifTrue: [ self stringSelected ]
			ifFalse: [ self stringDeselected ])
]

{ #category : #actions }
MASelectionColumn >> selectRow: anObject [
	self subclassResponsibility
]

{ #category : #actions }
MASelectionColumn >> selectRow: anObject value: aBoolean [
	aBoolean
		ifTrue: [ self selectRow: anObject ]
		ifFalse: [ self deselectRow: anObject ]
]

{ #category : #accessing }
MASelectionColumn >> selection [
	selection isNil
		ifTrue: [ self selection: self defaultSelection ].
	^ selection
]

{ #category : #accessing }
MASelectionColumn >> selection: anObject [
	selection := anObject
]

{ #category : #'accessing-settings' }
MASelectionColumn >> stringDeselected [
	^ self propertyAt: #stringDeselected ifAbsent: [ self defaultStringDeselected ]
]

{ #category : #'accessing-settings' }
MASelectionColumn >> stringDeselected: aString [
	self propertyAt: #stringDeselected put: aString
]

{ #category : #'accessing-settings' }
MASelectionColumn >> stringSelected [
	^ self propertyAt: #stringSelected ifAbsent: [ self defaultStringSelected ]
]

{ #category : #'accessing-settings' }
MASelectionColumn >> stringSelected: aString [
	self propertyAt: #stringSelected put: aString
]

{ #category : #private }
MASelectionColumn >> webdings: aString [
	^ [ :html | html span style: 'font-family: Webdings'; with: [ html html: aString ] ]
]
