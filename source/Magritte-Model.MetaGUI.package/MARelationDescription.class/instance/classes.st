accessing
classes
	^ classes ifNil: [ classes := self class defaultClasses ]