*Magritte-GT
maNautilusMethodMenu: aBuilder
	<nautilusGlobalMethodMenu>

	| selectedMethod |
	selectedMethod := aBuilder model selectedMethod.
	(selectedMethod isNil or: [ selectedMethod maIsDescription not ]) ifTrue: [ ^ self ].
	
	(aBuilder item: #'Show in GT Inspector')
		action: [ selectedMethod maShowInGtInspector ];
		order: 0;
		enabled: [ :browser | true "Disable if already toggled, but we'll probably make two-way soon i.e. add disable" ];
		help: 'Display in Inspector'.