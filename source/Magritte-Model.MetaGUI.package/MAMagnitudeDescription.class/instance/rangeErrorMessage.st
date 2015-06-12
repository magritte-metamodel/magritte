accessing-messages
rangeErrorMessage
	| min max |
	^ self propertyAt: #rangeErrorMessage ifAbsent: [
		min := self toString: self min. max := self toString: self max.
		(self min notNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be between ' , min , ' and ' , max ].
		(self min notNil and: [ self max isNil ])
			ifTrue: [ ^ 'Input must be above or equeal to ' , min ].
		(self min isNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be below or equal to ' , max ] ]