*Magritte-GT
glmAddSelectionActions
	self dynamicActionsOnSelection: [ :pres |
		| newActions |
		newActions := OrderedCollection new.
		pres selection magritteActionDescriptions do: [ :desc |
			| action |
			action := GLMGenericAction new
				action: [ pres selection perform: desc selector ];
				title: desc label;
				shortcut: (desc shortcut ifNil: [ desc label first lowercase ]);
				yourself.
			newActions add: action ].
		newActions ].