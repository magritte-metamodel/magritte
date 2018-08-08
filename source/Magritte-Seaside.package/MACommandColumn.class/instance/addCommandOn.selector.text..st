actions
addCommandOn: anObject selector: aSelector text: aString
	self addCommand: (MessageSend receiver: anObject selector: aSelector) text: aString