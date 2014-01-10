private
labelForOption: anObject
	self propertyAt: #labels ifPresent: [ :labels |
		labels isClosure ifTrue: [ ^labels cull: anObject ].
		labels isSymbol ifTrue: [ ^anObject perform: labels ].
		labels at: anObject ifPresent: [ :value |
			^ value ] ].
	^ self reference toString: anObject