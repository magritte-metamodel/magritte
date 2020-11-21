private
isTrueUsing: aDescription
	^ aDescription trueString = self contents
		or: [ aDescription trueStrings anySatisfy: [ :e | e asLowercase = self contents asLowercase ] ]