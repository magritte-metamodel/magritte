Extension { #name : 'CompiledMethod' }

{ #category : '*Magritte-GT' }
CompiledMethod >> maIsDescription [
	^ self hasPragmaNamed: #magritteDescription
]

{ #category : '*Magritte-GT' }
CompiledMethod class >> maNautilusMethodMenu: aBuilder [
	<nautilusGlobalMethodMenu>

	| selectedMethod |
	selectedMethod := aBuilder model selectedMethod.
	(selectedMethod isNil or: [ selectedMethod maIsDescription not ]) ifTrue: [ ^ self ].
	
	(aBuilder item: #'Show in GT Inspector')
		action: [ selectedMethod maShowInGtInspector ];
		order: 0;
		enabled: [ :browser | true "Disable if already toggled, but we'll probably make two-way soon i.e. add disable" ];
		help: 'Display in Inspector'.
]

{ #category : '*Magritte-GT' }
CompiledMethod >> maShowInGtInspector [
	
	| order |
	order := UIManager default request: 'Presentation Order' initialAnswer: 1 asString.
	order 
		ifNotNil: [ order := order asNumber ]
		ifNil: [ ^ self ].
		
	self maShowInGtInspectorOrder: order

]

{ #category : '*Magritte-GT' }
CompiledMethod >> maShowInGtInspectorOrder: aNumber [
	
	| nodes newPragmaNode |	
	nodes := self parseTree.
	newPragmaNode := RBPragmaNode 
		selector: #gtInspectorPresentationOrder: 
		arguments: { RBLiteralValueNode value: aNumber }.
	nodes pragmas add: newPragmaNode.
	self methodClass compile: nodes newSource classified: self protocol
]
