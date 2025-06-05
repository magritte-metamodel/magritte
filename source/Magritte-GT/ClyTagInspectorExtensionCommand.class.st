Class {
	#name : 'ClyTagInspectorExtensionCommand',
	#superclass : 'SycMethodCommand',
	#category : 'Magritte-GT'
}

{ #category : 'testing' }
ClyTagInspectorExtensionCommand class >> canBeExecutedInContext: aToolContext [
	^ aToolContext selectedMethods allSatisfy: [ :e | e maIsDescription ]
]

{ #category : 'accessing' }
ClyTagInspectorExtensionCommand class >> defaultMenuItemName [
	^'Show in GT-Inspector'
]

{ #category : 'accessing' }
ClyTagInspectorExtensionCommand class >> methodContextMenuActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation byItemOf: CmdExtraMenuGroup for: ClyMethod asCalypsoItemContext
]

{ #category : 'execution' }
ClyTagInspectorExtensionCommand >> execute [
	
	methods do: [ :m | m  maShowInGtInspector ]
]
