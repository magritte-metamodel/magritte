tests
testComparing
	| other |
	other := self actualClass new.
	other 
		filename: 'something.dat';
		contents: (ByteArray with: 1 with: 2 with: 3).

	self assert: model = model.
	
	self deny: model = other.
	self deny: other = model.
	other finalize.	"should be in tearDown;  for now, at least let's discard when we pass"