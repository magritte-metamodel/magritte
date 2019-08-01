*Magritte-Glamour
glmAddSelectionActions
	self dynamicActionsOnSelection: [ :pres |
		pres selection magritteActionDescriptions 
			collect: [ :desc |
				GLMGenericAction new
					action: [ pres selection perform: desc selector ];
					title: desc label;
					shortcut: (desc shortcut ifNil: [ desc label first lowercase ]);
					yourself ] 
				as: OrderedCollection ].