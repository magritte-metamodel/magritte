*Magritte-Glamour
glmAddSelectionActions
	self dynamicActionsOnSelection: [ :pres | 
			pres selection magritteActionDescriptions collect: #asGlmAction ]