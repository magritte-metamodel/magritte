*magritte-model-builder
magritteDescriptionBuilders
	|builderPragmas container|
	builderPragmas := Pragma allNamed: #magritteBuilder from: self class to: Object.
	builderPragmas ifEmpty: [ ^nil ].
	container := QCDescriptionBuilderContainer new.
	builderPragmas do: [ :pragma |
		|bld |
		pragma method numArgs = 0 ifTrue: [ 
			bld := self perform: pragma method selector.
			bld ifNotNil: [ container add: bld ] ] ].
	^container