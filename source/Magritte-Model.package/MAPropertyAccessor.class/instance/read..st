model
read: aModel
	^ aModel propertyAt: self key ifAbsent: [ nil ]