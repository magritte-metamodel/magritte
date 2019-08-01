*Magritte-Developer-private
maSetUp: aClass 
	| variableName needsInstVar |
	variableName := self readSelector.
	needsInstVar := (aClass hasInstVarNamed: variableName) not.
	needsInstVar ifTrue: [ aClass addInstVarNamed: variableName ].
	self 
		maCompile: '<1s><r><t>^ self maLazyFromDescriptionOf: #<2s>'
		asAccessor: self readSelector 
		forinstVarNamed: variableName 
		in: aClass.
	self 
		maCompile: '<1s> anObject<r><t><2s> := anObject'
		asAccessor: self writeSelector
		forinstVarNamed: variableName 
		in: aClass.