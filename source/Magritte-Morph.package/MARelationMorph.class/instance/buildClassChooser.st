private-building
buildClassChooser

	| items |
	items := self classes collect: [ :e | e label ].
	^ UITheme current builder newDropListFor: self list: items getSelected: #selectedIndex setSelected: #selectedIndex: help: ''.