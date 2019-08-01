*Magritte-Developer-private
maCompile: templateString asAccessor: aSymbol forinstVarNamed: variableName in: aClass 
	(aClass canUnderstand: aSymbol) ifTrue: [ ^ self ].
	aClass
		compile: (templateString expandMacrosWith: aSymbol with: variableName)
		classified: #accessing