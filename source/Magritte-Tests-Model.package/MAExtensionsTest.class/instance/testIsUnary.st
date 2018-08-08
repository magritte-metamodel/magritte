tests-string
testIsUnary
	self assert: #testIsUnary isUnary.
	self deny: #+ isUnary.
	self deny: #with:with: isUnary.	