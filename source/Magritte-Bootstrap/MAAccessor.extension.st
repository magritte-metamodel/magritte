Extension { #name : #MAAccessor }

{ #category : #'*Magritte-Bootstrap' }
MAAccessor >> handleMessage: aMessage for: anObject [
	^ aMessage hasArguments
			ifTrue: [ self write: aMessage arguments first to: anObject ]
			ifFalse: [ self read: anObject ]
]
