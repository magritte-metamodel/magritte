private
labelForOption: anObject
	anObject == true
		ifTrue: [ ^ self trueString ].
	anObject == false
		ifTrue: [ ^ self falseString ].
	^ self undefined