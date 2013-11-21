*magritte-model-actions
magritteActions

	| descriptionSelectors descriptions |
	descriptionSelectors := self uniqueActionSelectors.
	descriptions := descriptionSelectors collect: [ :e | self perform: e ].
	^ descriptions collect: [ :e | e buttonOn: self ].