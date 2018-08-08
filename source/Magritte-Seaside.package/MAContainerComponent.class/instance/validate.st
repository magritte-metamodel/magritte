actions
validate
	errors := OrderedCollection new.
	self withContainersDo: [ :each | each doValidateTo: errors ].
	^ errors isEmpty