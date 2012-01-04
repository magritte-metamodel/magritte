tests-properties
testPropertiesAtIfAbsentPut
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsentPut: [ 'baz' ]) = 'bar'.
	self assert: (self instance propertyAt: #foo) = 'bar'.

	self assert: (self instance propertyAt: #bar ifAbsentPut: [ 'baz' ]) = 'baz'.
	self assert: (self instance propertyAt: #bar) = 'baz'