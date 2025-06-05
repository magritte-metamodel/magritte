Class {
	#name : 'MACollectionExtensionTest',
	#superclass : 'TestCase',
	#category : 'Magritte-Tests-Model-Models'
}

{ #category : 'tests' }
MACollectionExtensionTest >> testAsMultilineString [

	| expectedResult |
	expectedResult := 'a
b
c'.

	self
		assert: #( a b c ) asMultilineString equals: expectedResult;
		assert: 'abc' asMultilineString equals: expectedResult
]
