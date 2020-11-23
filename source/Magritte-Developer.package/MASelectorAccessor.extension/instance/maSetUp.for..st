*Magritte-Developer-private
maSetUp: aClass for: anMAElementDescription
	| variableName needsInstVar defaultArgumentType setterArgumentName |
	variableName := self readSelector.
	needsInstVar := (aClass hasInstVarNamed: variableName) not.
	needsInstVar ifTrue: [ aClass addInstVarNamed: variableName ].
	self 
		maCompile: '<1s><r><t>^ self maLazyInstVarUsing: self <2s>Description'
		asAccessor: self readSelector 
		forinstVarNamed: variableName 
		in: aClass.
	defaultArgumentType := anMAElementDescription class defaultKind.
	setterArgumentName := (defaultArgumentType name first isVowel ifTrue: [ 'an' ] ifFalse: [ 'a' ]), defaultArgumentType name.
	self 
		maCompile: '<1s> ', setterArgumentName, '<r><t><2s> := ', setterArgumentName
		asAccessor: self writeSelector
		forinstVarNamed: variableName 
		in: aClass.