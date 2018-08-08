private
buildComponent
	^ self value isNil ifFalse: [ 
		(self magritteDescription reference asComponentOn: self value)
			setParent: self;
			yourself ]