private
doValidateTo: aCollectionOfErrors
	self value = verificationValue
		ifTrue: [ super doValidateTo: aCollectionOfErrors ]
		ifFalse: [ aCollectionOfErrors add: (MAConditionError description: self magritteDescription signal: 'Your passwords do not match') ]