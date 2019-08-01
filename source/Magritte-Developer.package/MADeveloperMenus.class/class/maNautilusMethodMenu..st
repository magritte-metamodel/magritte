nautilus menus
maNautilusMethodMenu: aBuilder
	<nautilusGlobalClassMenu>

	| selection |
	selection := aBuilder model selectedClass.
	selection ifNil: [ ^ self ].
	
	(aBuilder item: #'MA Add Field')
		action: [ selection maAddField ];
		order: 0;
		help: 'Add Magritte Field'.