private
isFalseUsing: aDescription
	^ aDescription falseString = self contents
		or: [ aDescription falseStrings anySatisfy: [ :e | e asLowercase = self contents asLowercase ] ]