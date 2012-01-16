accessing
buttons
	^ self decoratedComponent isReadonly
		ifTrue: [ Array with: #edit -> 'Edit' ]
		ifFalse: [ Array with: #save -> 'Save' with: #cancel -> 'Cancel' ]