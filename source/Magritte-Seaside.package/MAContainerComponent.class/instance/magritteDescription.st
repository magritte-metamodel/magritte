accessing
magritteDescription
	^magritteDescription ifNil: [
		| model builder |
		builder := description descriptionBuilder.
		builder ifNil: [ ^description]. 
		model := self model.
		magritteDescription := builder buildFrom: description target: model model: self model model.
		self setMemento: (model mementoClass model: model description: magritteDescription).
		magritteDescription ]