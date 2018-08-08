tests-string
testLines
	self assert: ('') lines = #().
	self assert: ('foo') lines = #('foo').
	self assert: ('foo' , (String with: Character cr) , 'bar') lines = #('foo' 'bar').
	self assert: ('foo' , (String with: Character cr with: Character lf) , 'bar') lines = #('foo' 'bar')