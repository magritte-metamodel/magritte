Extension { #name : 'GLMPresentation' }

{ #category : '*Magritte-Glamour' }
GLMPresentation >> glmAddActions [
	self dynamicActions: [ :pres | pres entity magritteActionDescriptions collect: #asGlmAction ]
]

{ #category : '*Magritte-Glamour' }
GLMPresentation >> glmAddSelectionActions [
	self dynamicActionsOnSelection: [ :pres | 
			pres selection magritteActionDescriptions collect: #asGlmAction ]
]
