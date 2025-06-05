Extension { #name : 'MASelectorAccessor' }

{ #category : '*Magritte-Developer-private' }
MASelectorAccessor >> maCompile: templateString asAccessor: aSymbol forinstVarNamed: variableName in: aClass [ 
	(aClass canUnderstand: aSymbol) ifTrue: [ ^ self ].
	aClass
		compile: (templateString expandMacrosWith: aSymbol with: variableName)
		classified: #accessing
]

{ #category : '*Magritte-Developer-private' }
MASelectorAccessor >> maSetUp: aClass for: anMAElementDescription [
	"Ensure inst var, setter and getter exist"

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
]

{ #category : '*Magritte-Developer-private' }
MASelectorAccessor >> store: anObject inDescriptionOn: aStream [ 
	anObject storeVia: self inDescriptionOn: aStream.
]

{ #category : '*Magritte-Developer-private' }
MASelectorAccessor >> storeVia: anAccessor inDescriptionOn: aStream [ 
	| isSymmetrical |
	isSymmetrical := self writeSelector = (self readSelector, ':') asSymbol.
	aStream nextPutAll: 'accessor: '.
	isSymmetrical 
		ifTrue: [ aStream print: self selector ]
		ifFalse: [ aStream nextPut: $(; store: self; nextPut: $) ].
	aStream nextPut: $;; cr.
]
