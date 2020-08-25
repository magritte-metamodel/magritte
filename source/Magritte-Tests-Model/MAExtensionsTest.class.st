Class {
	#name : #MAExtensionsTest,
	#superclass : #TestCase,
	#category : 'Magritte-Tests-Model-Utility'
}

{ #category : #helpers }
MAExtensionsTest >> does: aCollection haveEqualElementsTo: anotherCollection [
	aCollection size = anotherCollection size ifFalse: [ ^ false ].
	1 to: aCollection size do: [ :index |
		(aCollection at: index) = (anotherCollection at: index)
			ifFalse: [ ^ false ] ].
	
	^ true
]

{ #category : #'tests-string' }
MAExtensionsTest >> testAsString [
	self assert: Object new greaseString = Object new printString.
	self assert: 'Hello World' greaseString = 'Hello World'.
	self assert: 123 greaseString = '123'
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testCopyWithAll [
	| col res |
	col := #( a b ).
	res := col copyWithAll: #( c d ).
	self assert: res = #( a b c d ).
	self deny: col == res.

	col := Set with: #a with: #b.
	res := col copyWithAll: #( c d ).
	self assert: (res size = 4).
	self assert: (res includes: #a).
	self assert: (res includes: #b).
	self assert: (res includes: #c).
	self assert: (res includes: #d).
	self deny: col == res.

	col := OrderedCollection with: #a with: #b.
	res := col copyWithAll: #( c d ).
	self assert: res = (OrderedCollection with: #a with: #b with: #c with: #d).
	self deny: col == res
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testCopyWithoutFirst [
	| col res |
	col := #( a b a c ).
	res := col copyWithoutFirstOccurrenceOf: #a.
	self assert: res = #( b a c ).
	self deny: col == res.

	col := Set with: #a with: #b with: #c.
	res := col copyWithoutFirstOccurrenceOf: #a.
	self assert: res size = 2.
	self assert: (res includes: #b).
	self assert: (res includes: #c).
	self deny: col == res
]

{ #category : #'tests-integer' }
MAExtensionsTest >> testFileSize [
	self assert: (1000) asFileSize = '1000 B'.
	self assert: (1024) asFileSize = '1 KB'.

	self assert: (1000 * 1000) asFileSize = '976 KB'.
	self assert: (1024 * 1024) asFileSize = '1 MB'.

	self assert: (1000 * 1000 * 1000) asFileSize = '953 MB'.
	self assert: (1024 * 1024 * 1024) asFileSize = '1 GB'.

	self assert: (1000 * 1000 * 1000 * 1000) asFileSize = '931 GB'.
	self assert: (1024 * 1024 * 1024 * 1024) asFileSize = '1 TB'.

	" etc "
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testHasEqualElements [
	| one two |
	one := #( 1 2 3 ).

	two := #( 1 2 3 ) asOrderedCollection.
	self assert: (self does: one haveEqualElementsTo: two).
	self assert: (self does: two haveEqualElementsTo: one).
	
	two := #( 1 2 4 ).
	self deny: (self does: one haveEqualElementsTo: two).
	self deny: (self does: two haveEqualElementsTo: one).
	
	two := #( 1 2 3 4 ).
	self deny: (self does: one haveEqualElementsTo: two).
	self deny: (self does: two haveEqualElementsTo: one).
	
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testIntersection [
	| group |
	group := #( 1 2 3 ).
	
	self assert: (self does: (group intersection: group) haveEqualElementsTo: group).
	self assert: (self does: (group intersection: #( )) haveEqualElementsTo: #( )).
	self assert: (self does: (group intersection: #( 4 5 )) haveEqualElementsTo: #( )).
	self assert: (self does: (group intersection: #( 1 3 4 5 )) haveEqualElementsTo: #( 1 3 )).
	self assert: (self does: (group intersection: #( 2 )) haveEqualElementsTo: #( 2 ))
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testIsCollection [
	self deny: Object new isCollection.
	self deny: nil isCollection.
	self deny: 123 isCollection.
	self assert: 'abc' isCollection.
	self assert: #(a b c) isCollection
]

{ #category : #'tests-string' }
MAExtensionsTest >> testIsUnary [
	self assert: #testIsUnary isUnary.
	self deny: #+ isUnary.
	self deny: #with:with: isUnary.	
]

{ #category : #'tests-string' }
MAExtensionsTest >> testLines [
	self assert: ('') lines = #().
	self assert: ('foo') lines = #('foo').
	self assert: ('foo' , (String with: Character cr) , 'bar') lines = #('foo' 'bar').
	self assert: ('foo' , (String with: Character cr with: Character lf) , 'bar') lines = #('foo' 'bar')
]

{ #category : #'tests-string' }
MAExtensionsTest >> testMatches [
	self assert: ('' matches: '').
	self assert: ('zort' matches: '').
	self assert: ('zort' matches: 'o').
	self assert: ('zort' matches: 'O').
	self assert: ('zort' matches: '*').
	self assert: ('mobaz' matches: '*baz').
	self deny: ('mobazo' matches: '*baz').
	self assert: ('mobazo' matches: '*baz*').
	self deny: ('mozo' matches: '*baz*').
	self assert: ('foozo' matches: 'foo*').
	self deny: ('bozo' matches: 'foo*').
	self assert: ('foo23baz' matches: 'foo*baz').
	self assert: ('foobaz' matches: 'foo*baz').
	self deny: ('foo23bazo' matches: 'foo*baz').
	self assert: ('Foo' matches: 'foo').
	self deny: ('foobazort' matches: 'foo*baz*zort').
	self assert: ('foobazzort' matches: 'foo*baz*zort').
	self assert: ('afoo3zortthenfoo3zort' matches: '*foo#zort').
	self assert: ('afoodezortorfoo3zort' matches: '*foo*zort')
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testMoveDown [
	| col |
	col := Array with: 1 with: 2 with: 3.

	self assert: (col moveDown: 1) = 2.
	self assert: col = #( 2 1 3 ).

	self assert: (col moveDown: 1) = 3.
	self assert: col = #( 2 3 1 ).

	self assert: (col moveDown: 1) = 3.
	self assert: col = #( 2 3 1 ).

	self assert: (col moveDown: 0) = 0.
	self assert: col = #( 2 3 1 )
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testMoveUp [
	| col |
	col := Array with: 1 with: 2 with: 3.

	self assert: (col moveUp: 3) = 2.
	self assert: col = #( 1 3 2 ).

	self assert: (col moveUp: 3) = 1.
	self assert: col = #( 3 1 2 ).

	self assert: (col moveUp: 3) = 1.
	self assert: col = #( 3 1 2 ).

	self assert: (col moveUp: 0) = 0.
	self assert: col = #( 3 1 2 )
]

{ #category : #'tests-string' }
MAExtensionsTest >> testPrintingConvenience [

	| result table |
	table := {
		{ MAStringDescription new
				accessor: #asString;
				yourself.
			self asString }.
		{ MAElementDescription new
				accessor: (MAPluggableAccessor new readBlock: [ :obj | nil ]);
				yourself.
			'' } }.
	
	table do: [ :data | 
		| description expected |
		description := data first.
		expected := data second.
		result := String streamContents: [ :str | str maPrint: description for: self ].

		self assert: result equals: expected ].
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testReduce [
	self should: [ #() reduce: [ :a :b | a ] ] raise: Error.
	self assert: ((1 to: 9) reduce: [ :a :b | a ]) = 1.
	self assert: ((1 to: 9) reduce: [ :a :b | b ]) = 9.
	self assert: ((1 to: 9) reduce: [ :a :b | a + b ]) = 45.
	self assert: ((1 to: 9) reduce: [ :a :b | a * b ]) = 362880.
	self assert: (#('a' 'b' 'c') reduce: [ :a :b | a , ' ' , b ]) = 'a b c'.
	self assert: (#('a' 'b' 'c') reduce: [ :a :b | b , ' ' , a ]) = 'c b a'
]

{ #category : #'tests-collection' }
MAExtensionsTest >> testSort [
	| array |
	array := Array with: 2 with: 3 with: 1.

	array sort: [ :a :b | a < b ].
	self assert: (self does: array haveEqualElementsTo: #( 1 2 3 )).

	array sort: [ :a :b | a > b ].
	self assert: (self does: array haveEqualElementsTo: #( 3 2 1 )).
]

{ #category : #'tests-string' }
MAExtensionsTest >> testSubstringCaseSensitive [
	self deny: ('' includesSubstring: '' caseSensitive: true).
	self deny: ('' includesSubstring: '' caseSensitive: false).

	self deny: ('abc' includesSubstring: '' caseSensitive: true).
	self deny: ('abc' includesSubstring: '' caseSensitive: false).

	self deny: ('' includesSubstring: 'abc' caseSensitive: true).
	self deny: ('' includesSubstring: 'abc' caseSensitive: false).

	self deny: ('abc' includesSubstring: 'aa' caseSensitive: true).
	self deny: ('abc' includesSubstring: 'cc' caseSensitive: false).
	self deny: ('abc' includesSubstring: 'aB' caseSensitive: true).

	self assert: ('abc' includesSubstring: 'a' caseSensitive: true).
	self assert: ('abc' includesSubstring: 'c' caseSensitive: false).
	self assert: ('abc' includesSubstring: 'aB' caseSensitive: false).

	self assert: ('abc' includesSubstring: 'AbC' caseSensitive: false).
	self assert: ('abc' includesSubstring: 'ABC' caseSensitive: false).
	self assert: ('abc' includesSubstring: 'aBc' caseSensitive: false)

]

{ #category : #'tests-errors' }
MAExtensionsTest >> testValidationError [
	| result |
	result := [ MARequiredError signal: 'some message' ]
		on: MARequiredError
		do: [ :err | err return: err greaseString ].
	self assert: result = 'some message'.
	result := [
		MARequiredError 
			description: (MAStringDescription new 
				label: 'label';
				yourself) 
			signal: 'some message' ] 
		on: MARequiredError
		do: [ :err | err return: err greaseString ].
	self assert: result = 'label: some message'
]
