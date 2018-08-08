accessing
component
	component isNil ifTrue: [
		component := self magritteDescription componentClass new
			setDescription: self magritteDescription;
			yourself ].
	^component