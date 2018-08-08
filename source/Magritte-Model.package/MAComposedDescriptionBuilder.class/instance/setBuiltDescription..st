visiting
setBuiltDescription: aDescription 
	| builders |
	builders := self target magritteDescription descriptionBuilders.
	builtDescription := aDescription.
	builders do: [ :each | builtDescription := each buildFrom: builtDescription target: target model: model ]