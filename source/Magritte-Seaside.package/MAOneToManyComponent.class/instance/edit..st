actions
edit: anObject
	self root 
		call: (self validatedFormOn: anObject forOperation: 'Edit')
		onAnswer: [ :answer | self refresh ]