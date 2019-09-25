converting
asGlmAction
	| result |
	result := GLMGenericAction new
			action: [ :pres :receiver | 
				self performOn: receiver.
				self isMutator ifTrue: [ pres update ] ];
			enabledCondition: self enableBlock;
			help: self comment;
			shortcut: self shortcut;
			title: self label;
			yourself.
	
	"Glamour doesn't like setting a nil icon!"
	self icon ifNotNil: [ :i | result icon: i ].
	^ result
			