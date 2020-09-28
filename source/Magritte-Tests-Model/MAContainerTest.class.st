Class {
	#name : #MAContainerTest,
	#superclass : #MADescriptionTest,
	#instVars : [
		'child1',
		'child2',
		'child3'
	],
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAContainerTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAContainerTest >> actualClass [
	^ MAContainer
]

{ #category : #accessing }
MAContainerTest >> child1 [
	^ child1 ifNil: 
		[ child1 := MAStringDescription new
			accessor: #child1;
			label: 'child1';
			priority: 1;
			yourself ]
]

{ #category : #accessing }
MAContainerTest >> child2 [
	^ child2 ifNil: 
		[ child2 := MAStringDescription new
			accessor: #child2;
			label: 'child2';
			priority: 2;
			yourself ]
]

{ #category : #accessing }
MAContainerTest >> child3 [
	^ child3 ifNil: 
		[ child3 := MAStringDescription new
			accessor: #child3;
			label: 'child3';
			priority: 3;
			yourself ]
]

{ #category : #private }
MAContainerTest >> exampleInstance [
	^ MACachedMemento new
		setDescription: self description;
		setCache: (Dictionary new
			at: self child1 put: nil;
			at: self child2 put: nil;
			at: self child3 put: nil;
			yourself);
		yourself
]

{ #category : #'tests-adding' }
MAContainerTest >> testAdd [
	self description add: self child1.
	self assert: (self description size = 1).
	self assert: (self description includes: self child1).

	self description add: self child2.
	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)
]

{ #category : #'tests-adding' }
MAContainerTest >> testAddAll [
	self description
		addAll: (Array with: self child1 with: self child2).

	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testAllSatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description allSatisfy: [ :each | each = self child1 or: [ each = self child2 ] ]).
	self deny: (self description allSatisfy: [ :each | each = self child1 ])
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testAnySatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description anySatisfy: [ :each | each = self child2 ]).
	self deny: (self description anySatisfy: [ :each | each isNil ])
]

{ #category : #'tests-converting' }
MAContainerTest >> testAsContainer [
	self assert: self description asContainer = self description.
	self assert: self description asContainer == self description
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testAt [
	self description add: self child1; add: self child2.
	self assert: (self description at: 1) = self child1.
	self assert: (self description at: 2) = self child2.
	self should: [ self description at: 3 ] raise: Error
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testAtIfAbsent [
	self description add: self child1; add: self child2.
	self assert: (self description at: 1 ifAbsent: [ 'not' ]) = self child1.
	self assert: (self description at: 2 ifAbsent: [ 'not' ]) = self child2.
	self assert: (self description at: 3 ifAbsent: [ 'not' ]) = 'not'
]

{ #category : #'tests-accessing' }
MAContainerTest >> testChildren [
	self assert: self description children isCollection.
	self assert: self description children isEmpty
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testCollect [
	| collected |
	self description add: self child1; add: self child2.
	collected := self description collect: [ :each | each ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each | each copy ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each |
		each copy
			accessor: (MASelectorAccessor selector: #foo);
			yourself ].
	self deny: self description = collected.
	self deny: self description == collected
]

{ #category : #'tests-operators' }
MAContainerTest >> testConcatenate [
	| concatenate |
	concatenate := self child1 , self child2.
	self assert: concatenate size = 2.
	self assert: concatenate children first = self child1.
	self assert: concatenate children second = self child2.

	concatenate := self child1 , self child2 , self child3.
	self assert: concatenate size = 3.
	self assert: concatenate children first = self child1.
	self assert: concatenate children second = self child2.
	self assert: concatenate children third = self child3
]

{ #category : #'tests-copying' }
MAContainerTest >> testCopy [
	self description add: self child1; add: self child2.
	super testCopy.

	self deny: self description copy children == self description children.
	self assert: self description copy children first = self description children first.
	self assert: self description copy children second = self description children second
]

{ #category : #'tests-copying' }
MAContainerTest >> testCopyEmpty [
	self description add: self child1; add: self child2.
	self assert: self description copyEmpty isEmpty
]

{ #category : #'tests-copying' }
MAContainerTest >> testCopyFromTo [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyFrom: 2 to: 3.

	self assert: copied ~= self description.

	self assert: copied size = 2.
	self assert: copied children first = self child2.
	self assert: copied children second = self child3
]

{ #category : #'tests-copying' }
MAContainerTest >> testCopyWithout [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithout: self child1.

	self assert: copied ~= self description.

	self assert: copied size = 2.
	self assert: copied children first = self child2.
	self assert: copied children second = self child3
]

{ #category : #'tests-copying' }
MAContainerTest >> testCopyWithoutAll [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithoutAll: (Array with: self child1 with: self child3).

	self assert: copied ~= self description.

	self assert: copied size = 1.
	self assert: copied children first = self child2
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testDetect [
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]) = self child1.
	self should: [ self description
		detect: [ :each | self child2 = each ] ] raise: Error
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testDetectIfNone [
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]
		ifNone: [ 123 ]) = self child1.
	self assert: (self description
		detect: [ :each | self child2 = each ]
		ifNone: [ 123 ]) = 123
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testDo [
	| collection children |
	collection := self description class defaultCollection.
	self description add: self child1; add: self child2.
	self description do: [ :each | collection add: each ].
	children := self description children.
	self assert: children size = collection size.
	1 to: collection size do: [ :index |
		self assert: (children at: index) = (collection at: index) ]
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testDoSepratedBy [
	| collection |
	collection := OrderedCollection new.
	self description add: self child1; add: self child2.
	self description
		do: [ :each | collection add: each ]
		separatedBy: [ collection add: nil ].
	self assert: collection size = 3.
	self assert: collection first = self child1.
	self assert: collection second isNil.
	self assert: collection third = self child2
]

{ #category : #'tests-testing' }
MAContainerTest >> testEmpty [
	self assert: self description isEmpty.
	self description add: self child1.
	self deny: self description isEmpty
]

{ #category : #'tests-testing' }
MAContainerTest >> testHasChildren [
	super testHasChildren.
	self description add: self child1.
	self assert: self description hasChildren
]

{ #category : #'tests-testing' }
MAContainerTest >> testIncludes [
	self deny: (self description includes: self child1).
	self description add: self child1.
	self assert: (self description includes: self child1)
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testInjectInto [
	self description add: self child1; add: self child2.
	self assert: (self description
		inject: 'start'
		into: [ :result :each | result , ' ' , each label ]) = 'start child1 child2'
]

{ #category : #'tests-operators' }
MAContainerTest >> testIntersection [
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a intersection: b.

	self assert: (union size) = 1.
	self deny: (union includes: self child1).
	self assert: (union includes: self child2).
	self deny: (union includes: self child3)
]

{ #category : #'tests-testing' }
MAContainerTest >> testIsContainer [
	self assert: self description isContainer
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testKeysAndValuesDo [
	self description
		add: self child1;
		add: self child2.
	self description keysAndValuesDo: 
		[ :index :each | 
		index = 1 
			ifTrue: [ self assert: self child1 = each ]
			ifFalse: 
				[ index = 2 
					ifTrue: [ self assert: self child2 = each ]
					ifFalse: [ self assert: false ] ] ]
]

{ #category : #'tests-moving' }
MAContainerTest >> testMoveDown [
	self description add: self child1; add: self child2.
	self assert: self description children first = self child1.
	self assert: self description children second = self child2.

	self description moveDown: self child1.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1.

	self description moveDown: self child1.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1
]

{ #category : #'tests-moving' }
MAContainerTest >> testMoveUp [
	self description add: self child1; add: self child2.
	self assert: self description children first = self child1.
	self assert: self description children second = self child2.

	self description moveUp: self child2.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1.

	self description moveUp: self child2.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1
]

{ #category : #'tests-validating' }
MAContainerTest >> testNoFailingValidation [
	| example |
	self description
		add: self child1;
		add: self child2.
	example := self exampleInstance.
	self
		shouldnt: [ example validate ]
		raise: MAValidationError
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testNoneSatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description noneSatisfy: [ :each | each isNil ])
]

{ #category : #'tests-testing' }
MAContainerTest >> testNotEmpty [
	self deny: self description notEmpty.
	self description add: self child1.
	self assert: self description notEmpty
]

{ #category : #'tests-validating' }
MAContainerTest >> testOneFailingValidation [
	| example |
	self description
		add: self child1;
		add: (self child2
			addCondition: [ :v | false ];
			beRequired;
			yourself).
	example := self exampleInstance.

	self
		should: [ example validate ]
		raise: MAValidationError.
	[ example validate ]
		on: MAValidationError
		do: [ :err |
			self assert: err class = MAMultipleErrors.
			self assert: err tag = self description.
			self assert: err collection size = 1.
			self assert: err collection first tag = self child2 ]
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testReject [
	| rejected |
	self description add: self child1; add: self child2.

	rejected := self description reject: [ :each | false ].
	self assert: self description = rejected.

	rejected := self description reject: [ :each | true ].
	self assert: rejected isEmpty
]

{ #category : #'tests-removing' }
MAContainerTest >> testRemove [
	self description add: self child1; add: self child2.

	self description remove: self child1.
	self assert: self description size = 1.
	self deny: (self description includes: self child1).
	self assert: (self description includes: self child2).

	self description remove: self child2.
	self assert: self description isEmpty
]

{ #category : #'tests-removing' }
MAContainerTest >> testRemoveAll [
	self description add: self child1; add: self child2.

	self description removeAll.
	self assert: self description isEmpty
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testSelect [
	| selected |
	self description add: self child1; add: self child2.

	selected := self description select: [ :each | true ].
	self assert: self description = selected.

	selected := self description select: [ :each | false ].
	self assert: selected isEmpty
]

{ #category : #'tests-accessing' }
MAContainerTest >> testSize [
	self assert: self description size isZero.
	self description add: self child1.
	self assert: self description size = 1.
	self description add: self child2.
	self assert: self description size = 2.
	self description add: self child3.
	self assert: self description size = 3
]

{ #category : #'tests-validating' }
MAContainerTest >> testTwoFailingValidation [
	| example |
	self description
		add: (self child1
			addCondition: [ :v | false ];
			beRequired;
			yourself);
		add: (self child2
			addCondition: [ :v | false ];
			beRequired;
			yourself).
	example := self exampleInstance.

	self
		should: [ example validate ]
		raise: MAValidationError.
	[ example validate ]
		on: MAValidationError
		do: [ :err |
			self assert: err class = MAMultipleErrors.
			self assert: err tag = self description.
			self assert: err collection size = 2.
			self assert: err collection first tag = self child1.
			self assert: err collection last tag = self child2 ]
]

{ #category : #'tests-operators' }
MAContainerTest >> testUnion [
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a union: b.

	self assert: (union size) = 3.
	self assert: (union includes: self child1).
	self assert: (union includes: self child2).
	self assert: (union includes: self child3)
]

{ #category : #'tests-enumerating' }
MAContainerTest >> testWithDo [
	self description add: self child1; add: self child2.
	self description with: self description children
		do: [ :first :second | self assert: first = second ]
]
