tests-actions
testVisible
	self description beHidden.
	self deny: self description visible.
	self deny: self description isVisible.

	self description beVisible.
	self assert: self description visible.
	self assert: self description isVisible