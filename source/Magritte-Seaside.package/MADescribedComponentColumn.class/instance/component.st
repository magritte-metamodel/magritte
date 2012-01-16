accessing
component
	component isNil ifTrue: [
		component := self description componentClass new
			setDescription: self description;
			yourself ].
	^component