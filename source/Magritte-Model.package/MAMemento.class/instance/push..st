private
push: aDictionary
	"Utility method to push a dictionary mapping descriptions to values into the model."

	aDictionary keysAndValuesDo: [ :key :value |
		(key isVisible and: [ key isReadonly not ]) 
			ifTrue: [ self model write: value using: key ] ]