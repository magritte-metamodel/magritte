tests-actions
testReadonly
	self description beReadonly.
	self assert: self description readonly.
	self assert: self description isReadonly.

	self description beWriteable.
	self deny: self description readonly.
	self deny: self description isReadonly