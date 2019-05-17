*Magritte-GT
maAddSelectionActionsFor: aClass 
	
	aClass magritteActionDescriptions do: [ :desc |
		| glmAction actionBlock |
		actionBlock := [ :list |
			desc performOn: list selection.
			desc isMutator ifTrue: [ list update ] ].
		glmAction := GLMGenericAction new
			action: actionBlock;
			icon: desc icon;
			title: desc label;
			yourself.
		desc shortcut ifNotNil: [ :sc | glmAction shortcut: sc key "assumes single key" ].
		self addSelectionAction: glmAction ].