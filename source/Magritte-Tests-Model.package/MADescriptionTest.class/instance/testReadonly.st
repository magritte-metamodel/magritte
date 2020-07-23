tests-actions
testReadOnly
	self description beReadOnly.
	self assert: self description readOnly.
	self assert: self description isReadOnly.

	self description beWriteable.
	self deny: self description readOnly.
	self deny: self description isReadOnly