private-building
buildClassChooser
	| items |
	items := self classes collect: [ :e | e label ].
	^ Smalltalk ui theme builder
		newDropListFor: self
		list: items
		getSelected: #selectedIndex
		setSelected: #selectedIndex:
		help: ''