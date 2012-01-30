transforming
transform
	| parseTree methodBody category |

	parseTree := class parseTreeFor: selector.
	
	(self alreadyIncludesMagritteSelectors: parseTree) ifFalse: [
		| pragma |
		pragma := self createPragma.
		pragma notNil ifTrue: [
			parseTree pragmas: (parseTree pragmas, (Array with: pragma)) ] ].
	
	category := class realClass organization categoryOfElement: selector.
	
	methodBody := class methodFor: selector.
	target compile: (parseTree formattedCode) classified: category.
	class removeMethod: selector