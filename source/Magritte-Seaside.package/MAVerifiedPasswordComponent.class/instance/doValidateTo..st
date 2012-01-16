private
doValidateTo: aCollectionOfErrors
	self value = verificationValue
		ifTrue: [ super doValidateTo: aCollectionOfErrors ]
		ifFalse: [ aCollectionOfErrors add: (MAConditionError description: self description signal: 'Your passwords do not match') ]