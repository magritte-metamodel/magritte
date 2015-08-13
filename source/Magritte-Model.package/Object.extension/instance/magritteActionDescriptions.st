*magritte-model-actions
magritteActionDescriptions

	^ self uniqueActionSelectors collect: [ :each | self perform: each ]