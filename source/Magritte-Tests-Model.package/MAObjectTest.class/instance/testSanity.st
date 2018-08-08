tests
testSanity
	"If this test case fails, there is something wrong with the setup of the test-case."

	self
		assert: self actualClass isAbstract not
		description: 'Unable to test abstract class.'.
	self
		assert: self instance class = self actualClass
		description: 'Invalid test instance.'