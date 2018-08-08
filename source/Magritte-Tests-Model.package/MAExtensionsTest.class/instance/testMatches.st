tests-string
testMatches
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