Class {
	#name : #MAPatchMacro,
	#superclass : #Object,
	#instVars : [
		'operations'
	],
	#category : #'Magritte-Merging'
}

{ #category : #accessing }
MAPatchMacro class >> example [
	<gtExample>
	^ self
		given: [ self new ]
		when: [ :macro |
			| op |
			op := MAPatchOperation example.
			macro operations
				add: op;
				add: (MAPatchOperation example2 receiver: op receiver; yourself).
			macro ]
		then: [ :macro |
			macro operations size should equal: 2 ]
]

{ #category : #accessing }
MAPatchMacro >> addOperationFor: modelObject set: aDescription to: valueObject [
	| newOp |
	newOp := MAPatchOperation
		for: modelObject
		set: aDescription
		to: valueObject.
	newOp isNoOp ifTrue: [ ^ self ].
	^ self operations add: newOp.
]

{ #category : #accessing }
MAPatchMacro >> children [
	^ self operations
]

{ #category : #'accessing-magritte' }
MAPatchMacro >> descriptionOperations [
	<magritteDescription>
	<gtInspectorPresentationOrder: 1>
	^ MAToManyRelationDescription new
		accessor: #operations;
		glmPresentation: [ :a | a list ];
		classes: { MAPatchOperation };
		default: OrderedCollection new;
		yourself
]

{ #category : #accessing }
MAPatchMacro >> diffStrings [
	| lhs rhs |
	lhs := String streamContents: [ :lstr |
		rhs := String streamContents: [ :rstr | 
			self operations 
				do: [ :op |
					| opDiff |
					opDiff := op diffStrings.
					lstr nextPutAll: opDiff first.
					rstr nextPutAll: opDiff second ]
				separatedBy: [ lstr lf. rstr lf ] ] ].
	^ { lhs. rhs }
]

{ #category : #execution }
MAPatchMacro >> execute [
	self operations do: #execute
]

{ #category : #accessing }
MAPatchMacro >> gtElementViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Element';
		priority: 25;
		stencil: [ self asElement asScrollableElement ]
]

{ #category : #accessing }
MAPatchMacro >> operations [
	^ self maLazyInstVarUsing: self descriptionOperations
]

{ #category : #accessing }
MAPatchMacro >> operations: anObject [
	operations := anObject
]

{ #category : #printing }
MAPatchMacro >> printOn: aStream [

	self receivers
		ifNotEmpty: [ :recs |
			aStream nextPutAll: 'Patch for '.
			recs
				do: [ :e | aStream print: e ]
				separatedBy: [ aStream space ] ]
		ifEmpty: [ super printOn: aStream ]
]

{ #category : #accessing }
MAPatchMacro >> receivers [
	^ self operations collect: #receiver as: Set
]

{ #category : #execution }
MAPatchMacro >> undo [
	self operations do: #undo
]
