tests-properties
testPropertiesAtIfPresent
	self assert: (self instance propertyAt: #foo ifPresent: [ :value | self assert: false ]) isNil.
	self instance propertyAt: #foo put: 1.
	self assert: (self instance propertyAt: #foo ifPresent: [ :value | self assert: value = 1. 2 ]) = 2