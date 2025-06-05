Class {
	#name : 'MAClyAddFieldCommand',
	#superclass : 'SycSingleClassCommand',
	#instVars : [
		'fieldName'
	],
	#category : 'Magritte-Developer'
}

{ #category : 'activation' }
MAClyAddFieldCommand class >> contextMenuActivation [
		<classAnnotation>
		^ CmdContextMenuActivation byRootGroupItemFor: ClyClassContextOfFullBrowser
]

{ #category : 'accessing' }
MAClyAddFieldCommand class >> defaultMenuItemName [
	^'Add Field (Magritte)'
]

{ #category : 'execution' }
MAClyAddFieldCommand >> execute [
	targetClass maAddField: fieldName asSymbol
]

{ #category : 'execution' }
MAClyAddFieldCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	fieldName := UIManager default request: 'Field name'.		
	fieldName isEmptyOrNil ifTrue: [ CmdCommandAborted signal ]
]
