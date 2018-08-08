private
testFromString
	"We do some special tests here because #visitNumberDescription: in
	MAStringReader works around problems with Number>>readFrom."
	self shouldSkipStringTests
		ifTrue: [^ self].
	super testFromString.
	self
		should: [self description fromString: 'xyz']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '12-234']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '1.4.2007']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self assert: (self description fromString: '') isNil description: 'Empty string should be parsed to nil'.
	self assert: (self description fromString: '-20')
			= -20 description: 'Negative numbers should be accepted'