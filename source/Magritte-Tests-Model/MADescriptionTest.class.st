Class {
	#name : #MADescriptionTest,
	#superclass : #MAObjectTest,
	#instVars : [
		'description'
	],
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MADescriptionTest class >> isAbstract [
	^ true
]

{ #category : #testing }
MADescriptionTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
MADescriptionTest >> actualClass [
	^ MADescription
]

{ #category : #'acessing-magritte' }
MADescriptionTest >> description [
	^ description
]

{ #category : #private }
MADescriptionTest >> descriptionInstance [
	^ self actualClass new
		accessor: MANullAccessor new;
		yourself
]

{ #category : #accessing }
MADescriptionTest >> instance [
	^ description
]

{ #category : #running }
MADescriptionTest >> setUp [
	super setUp.
	description := self descriptionInstance.
	self assert: description accessor notNil
]

{ #category : #asserting }
MADescriptionTest >> should: aBlock raiseSingle: aClass [ 
	self should: aBlock raiseSingle: aClass withExceptionDo: [ :e | ]
]

{ #category : #asserting }
MADescriptionTest >> should: aBlock raiseSingle: aClass withExceptionDo: exceptionBlock [
	self should: aBlock
		raise: MAMultipleErrors
		withExceptionDo: [ :e | 
			self assert: e collection size equals: 1.
			e collection first isKindOf: aClass.
			exceptionBlock value: e collection first ].
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testAccessor [
	self description accessor: (MASelectorAccessor selector: #foo).
	self assert: self description accessor selector = #foo
]

{ #category : #'tests-converting' }
MADescriptionTest >> testAsContainer [
	self subclassResponsibility
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testComment [
	self description comment: 'bar'.
	self assert: self description comment = 'bar'
]

{ #category : #'tests-copying' }
MADescriptionTest >> testCopyAccessor [
	self assert: self description copy accessor = self description accessor.
	self deny: self description copy accessor == self description accessor
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testDefaultLabel [
	self assert: self description label = ''.
	self description accessor: #foo.
	self assert: self description label = 'Foo'
]

{ #category : #'tests-identity' }
MADescriptionTest >> testDictionaryKey [
	| dictionary |
	dictionary := Dictionary new.

	dictionary at: self instance put: 1.
	self assert: (dictionary at: self instance) = 1.

	dictionary at: self instance put: 2.
	self assert: (dictionary at: self instance) = 2
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testGroup [
	self assert: self description group isNil.
	self description group: 'foo'.
	self assert: self description group = 'foo'
]

{ #category : #'tests-testing' }
MADescriptionTest >> testHasChildren [
	self deny: self description hasChildren
]

{ #category : #'tests-testing' }
MADescriptionTest >> testHasComment [
	self description comment: nil.
	self deny: self description hasComment.

	self description comment: ''.
	self deny: self description hasComment.

	self description comment: 'comment'.
	self assert:  self description hasComment
]

{ #category : #'tests-testing' }
MADescriptionTest >> testHasLabel [
	self description label: nil.
	self deny: self description hasLabel.

	self description label: ''.
	self deny: self description hasLabel.

	self description label: 'label'.
	self assert:  self description hasLabel
]

{ #category : #'tests-testing' }
MADescriptionTest >> testIsContainer [
	self deny: self description isContainer
]

{ #category : #'tests-testing' }
MADescriptionTest >> testIsDescription [
	self assert: self description isDescription
]

{ #category : #'tests-testing' }
MADescriptionTest >> testIsSortable [
	self assert: (self description isSortable or: [ self description isSortable not ])
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testLabel [
	self description label: 'foo'.
	self assert: self description label = 'foo'
]

{ #category : #'tests-accessing' }
MADescriptionTest >> testPriority [
	self description priority: 123.
	self assert: self description priority = 123
]

{ #category : #'tests-actions' }
MADescriptionTest >> testReadOnly [
	self description beReadOnly.
	self assert: self description readOnly.
	self assert: self description isReadOnly.

	self description beWriteable.
	self deny: self description readOnly.
	self deny: self description isReadOnly
]

{ #category : #'tests-actions' }
MADescriptionTest >> testRequired [
	self description beRequired.
	self assert: self description required.
	self assert: self description isRequired.

	self description beOptional.
	self deny: self description required.
	self deny: self description isRequired
]

{ #category : #'tests-identity' }
MADescriptionTest >> testSetElement [
	| set |
	set := Set new.

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance).

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance)
]

{ #category : #'tests-actions' }
MADescriptionTest >> testVisible [
	self description beHidden.
	self deny: self description visible.
	self deny: self description isVisible.

	self description beVisible.
	self assert: self description visible.
	self assert: self description isVisible
]
