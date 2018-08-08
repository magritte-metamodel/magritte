tests-properties
testPropertiesAt
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo) = 'bar'.
	self should: [ self instance propertyAt: #bar ] raise: MAPropertyError