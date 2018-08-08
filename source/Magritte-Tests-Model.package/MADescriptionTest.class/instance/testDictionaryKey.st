tests-identity
testDictionaryKey
	| dictionary |
	dictionary := Dictionary new.

	dictionary at: self instance put: 1.
	self assert: (dictionary at: self instance) = 1.

	dictionary at: self instance put: 2.
	self assert: (dictionary at: self instance) = 2