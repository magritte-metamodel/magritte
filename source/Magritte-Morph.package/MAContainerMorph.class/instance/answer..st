answering
answer: anObject

	| didUserCancel |
	self morph delete.
	
	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.