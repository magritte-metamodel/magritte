Class {
	#name : #MACompositeAccessor,
	#superclass : #MAChainAccessor,
	#instVars : [
		'kind'
	],
	#classInstVars : [
		'elementKind'
	],
	#category : #'Magritte-Model-Accessor'
}

{ #category : #'instance creation' }
MACompositeAccessor class >> via: anAccessor using: aDescription [
	| result |
	result := (self on: aDescription accessor asAccessor accessor: anAccessor asAccessor)
		kind: aDescription kind;
		yourself.
	aDescription hasLabel ifTrue: [ aDescription label: (result accessor defaultLabelFor: aDescription) , '::' , aDescription label ].
	aDescription accessor: result.
	^ result
]

{ #category : #testing }
MACompositeAccessor >> canRead: aModel [
	^ (self accessor canRead: aModel) and: [ (self elementsFrom: aModel) allSatisfy: [ :e | self next canRead: e ] ]
]

{ #category : #testing }
MACompositeAccessor >> canWrite: aModel [
	^ (self accessor canRead: aModel) and: [ (self elementsFrom: aModel) allSatisfy: [ :e | self next canWrite: e ] ]
]

{ #category : #testing }
MACompositeAccessor >> elementsFrom: aModel [
	^ self accessor read: aModel
]

{ #category : #accessing }
MACompositeAccessor >> kind [
	^ kind
]

{ #category : #accessing }
MACompositeAccessor >> kind: aClass [
	kind := aClass
]

{ #category : #model }
MACompositeAccessor >> read: aModel [
	| elements values |
	elements := self elementsFrom: aModel.
	values := elements collect: [ :e | self next read: e ].
	^ values asSet size > 1
		ifTrue: [ MACompositeConflict new kind: self kind; yourself  ]
		ifFalse: [ values first ].
	
]

{ #category : #model }
MACompositeAccessor >> write: anObject to: aModel [
	^ (self elementsFrom: aModel) do: [ :e | 
		(anObject isKindOf: MACompositeConflict) ifFalse: [ self next write: anObject to: e ] ]
]
