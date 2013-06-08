private-building
buildClassChooser

	| items |
	items := self classes" collect: [ :e | DropListItem named: e name do: [ ] ]".
	^ UITheme current builder newDropListFor: self list: items getSelected: #selectedIndex setSelected: #selectedIndex: help: ''.