tests-collection
testReduce
	self should: [ #() reduce: [ :a :b | a ] ] raise: Error.
	self assert: ((1 to: 9) reduce: [ :a :b | a ]) = 1.
	self assert: ((1 to: 9) reduce: [ :a :b | b ]) = 9.
	self assert: ((1 to: 9) reduce: [ :a :b | a + b ]) = 45.
	self assert: ((1 to: 9) reduce: [ :a :b | a * b ]) = 362880.
	self assert: (#('a' 'b' 'c') reduce: [ :a :b | a , ' ' , b ]) = 'a b c'.
	self assert: (#('a' 'b' 'c') reduce: [ :a :b | b , ' ' , a ]) = 'c b a'