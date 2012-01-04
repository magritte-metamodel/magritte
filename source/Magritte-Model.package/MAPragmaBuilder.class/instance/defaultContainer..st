private
defaultContainer: anObject 
	^self class defaultContainerClass new
		label: ((anObject respondsTo: #label)
			ifTrue: [ anObject label ]
			ifFalse: [ anObject name ]);
		yourself