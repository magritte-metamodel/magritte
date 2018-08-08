accessing
value: aNumber
	super value: (aNumber isNil ifFalse: [ aNumber * self range / 100 + self min ])