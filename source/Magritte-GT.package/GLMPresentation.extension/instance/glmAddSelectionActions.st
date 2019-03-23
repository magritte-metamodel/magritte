*Magritte-GT
glmAddSelectionActions
	self dynamicActionsOnSelection: [ :pres |
		pres selection magritteActionDescriptions 
			collect: [ :desc |
				GLMGenericAction new
					action: [ desc action value: pres selection ];
					title: desc label;
					shortcut: (desc shortcut ifNil: [ desc label first lowercase ]);
					yourself ]
				as: OrderedCollection ].