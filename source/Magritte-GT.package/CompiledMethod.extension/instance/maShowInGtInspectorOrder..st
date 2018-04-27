*Magritte-GT
maShowInGtInspectorOrder: aNumber
	
	| nodes newPragmaNode |	
	nodes := self parseTree.
	newPragmaNode := RBPragmaNode 
		selector: #gtInspectorPresentationOrder: 
		arguments: { RBLiteralValueNode value: aNumber }.
	nodes pragmas add: newPragmaNode.
	self methodClass compile: nodes newSource classified: self protocol