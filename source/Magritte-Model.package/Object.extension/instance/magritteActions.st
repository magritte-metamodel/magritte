*magritte-model-actions
magritteActions

	| descriptionSelectors |
	descriptionSelectors := self uniqueDescriptionSelectors.
	^ descriptionSelectors collect: [ :selector | | helpText |
		helpText := (self class>>selector) comment
			ifNil: [ '' ]
			ifNotNil: [ :comment | comment trimBoth ].
		UITheme current builder newButtonFor: self action: selector label: selector capitalized normalizeCamelCase help: helpText ].