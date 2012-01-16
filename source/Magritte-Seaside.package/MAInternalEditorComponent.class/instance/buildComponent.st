private
buildComponent
	^ self value isNil ifFalse: [ 
		(self description reference asComponentOn: self value)
			setParent: self;
			yourself ]