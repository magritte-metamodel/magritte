Class {
	#name : #MAMethodRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'selector',
		'target'
	],
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #private }
MAMethodRefactoring >> alreadyIncludesMagritteSelectors: parseTree [
	^ parseTree pragmas anySatisfy: [ :each | MAPragmaBuilder magritteSelectors includes: each selector ]
]

{ #category : #private }
MAMethodRefactoring >> createPragma [
	((selector = #descriptionContainer) or: [ selector isDescriptionExtension: #descriptionContainer ]) ifTrue: [
		^ RBPragmaNode selector: (Array with: MAPragmaBuilder containerPragma) arguments: #() ].
	
	(selector isDescriptionDefinition) ifTrue: [
		^ RBPragmaNode selector: (Array with: MAPragmaBuilder magritteDescriptionPragma) arguments: #() ].
	
	((selector isDescriptionSelector) and: [ selector numArgs = 1 ]) ifTrue: [
		| descriptionDefinitionSelector |
		
		descriptionDefinitionSelector := class allSelectors detect: [ :each | 
			each isDescriptionDefinition and: [ selector isDescriptionExtension: each ] ] ifNone: [ nil ].
		
		descriptionDefinitionSelector ifNil: [
			descriptionDefinitionSelector := class soleInstance allSelectors detect: [ :each | 
				each isDescriptionDefinition and: [ selector isDescriptionExtension: each ] ] ifNone: [ nil ] ] 
			ifNotNil: [ ^ RBPragmaNode selector: (Array with: MAPragmaBuilder magritteDescriptionExtensionPragma) arguments: (Array with: (RBLiteralValueNode value: descriptionDefinitionSelector)) ] ].		
	^ nil

]

{ #category : #preconditions }
MAMethodRefactoring >> preconditions [
	^ RBCondition withBlock: [ selector isDescriptionSelector ]
]

{ #category : #transforming }
MAMethodRefactoring >> transform [
	self privateTransform
]
{ #category : #transforming }
MAMethodRefactoring >> privateTransform [
	| parseTree methodBody category |

	parseTree := class parseTreeFor: selector.
	
	(self alreadyIncludesMagritteSelectors: parseTree) ifFalse: [
		| pragma |
		pragma := self createPragma.
		pragma ifNotNil: [
			parseTree pragmas: (parseTree pragmas, (Array with: pragma)) ] ].
	
	category := class realClass organization categoryOfElement: selector.
	
	methodBody := class methodFor: selector.
	target compile: (parseTree formattedCode) classified: category.
	class removeMethod: selector
]
{ #category : #'instance creation' }
MAMethodRefactoring class >> swapMethod: aSelector in: aClass [
	^ self new swapMethod: aSelector in: aClass
]

{ #category : #'instance creation' }
MAMethodRefactoring class >> model: aRBSmalltalk swapMethod: aSelector in: aClass [
	^ self new 
		model: aRBSmalltalk;
		swapMethod: aSelector in: aClass;
		yourself
]