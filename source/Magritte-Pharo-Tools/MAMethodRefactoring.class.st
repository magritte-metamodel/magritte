Class {
	#name : #MAMethodRefactoring,
	#superclass : #ORSwapMethodRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #private }
MAMethodRefactoring >> alreadyIncludesMagritteSelectors: parseTree [
	^ (parseTree pragmas detect: [ :each | MAPragmaBuilder magritteSelectors includes: each selector ] ifNone: [ nil ]) notNil
]

{ #category : #private }
MAMethodRefactoring >> createPragma [
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

]

{ #category : #preconditions }
MAMethodRefactoring >> preconditions [
	^ RBCondition withBlock: [ selector isDescriptionSelector ]
]

{ #category : #transforming }
MAMethodRefactoring >> transform [
	| parseTree methodBody category |

	parseTree := class parseTreeFor: selector.
	
	(self alreadyIncludesMagritteSelectors: parseTree) ifFalse: [
		| pragma |
		pragma := self createPragma.
		pragma notNil ifTrue: [
			parseTree pragmas: (parseTree pragmas, (Array with: pragma)) ] ].
	
	category := class realClass organization categoryOfElement: selector.
	
	methodBody := class methodFor: selector.
	target compile: (parseTree formattedCode) classified: category.
	class removeMethod: selector
]
