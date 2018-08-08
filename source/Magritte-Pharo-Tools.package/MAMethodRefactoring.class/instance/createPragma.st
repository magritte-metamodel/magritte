private
createPragma
	((selector = #descriptionContainer) or: [ selector isDescriptionExtension: #descriptionContainer ]) ifTrue: [
		^ RBPragmaNode selectorParts: (Array with: MAPragmaBuilder containerPragma) arguments: #() ].
	
	(selector isDescriptionDefinition) ifTrue: [
		^ RBPragmaNode selectorParts: (Array with: MAPragmaBuilder magritteDescriptionPragma) arguments: #() ].
	
	((selector isDescriptionSelector) and: [ selector numArgs = 1 ]) ifTrue: [
		| descriptionDefinitionSelector |
		
		descriptionDefinitionSelector := class allSelectors detect: [ :each | 
			each isDescriptionDefinition and: [ selector isDescriptionExtension: each ] ] ifNone: [ nil ].
		
		descriptionDefinitionSelector isNil ifTrue: [
			descriptionDefinitionSelector := class soleInstance allSelectors detect: [ :each | 
				each isDescriptionDefinition and: [ selector isDescriptionExtension: each ] ] ifNone: [ nil ] ].
		
		descriptionDefinitionSelector notNil ifTrue: [
			^ RBPragmaNode selectorParts: (Array with: MAPragmaBuilder magritteDescriptionExtensionPragma) arguments: (Array with: (RBLiteralValueNode literalToken: descriptionDefinitionSelector))] ].
	^ nil
