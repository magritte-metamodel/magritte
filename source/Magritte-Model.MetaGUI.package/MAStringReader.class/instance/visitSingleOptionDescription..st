visiting-description
visitSingleOptionDescription: aDescription
	aDescription propertyAt: #labels ifPresent: [ :labels |
		labels keysAndValuesDo: [ :key :value |
			(self nextMatchAll: value on: self stream)
				ifTrue: [ ^ self object: key ] ] ].
	self visit: aDescription reference