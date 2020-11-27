accessing
buttons
	^ self decoratedComponent isReadOnly
		ifTrue: [ Array with: #edit -> 'Edit' ]
		ifFalse: [ Array with: #save -> 'Save' with: #cancel -> 'Cancel' ]