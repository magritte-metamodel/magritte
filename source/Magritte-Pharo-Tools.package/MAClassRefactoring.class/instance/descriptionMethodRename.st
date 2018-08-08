transforming
descriptionMethodRename
	| class |
	class := self classObjectFor: className asSymbol.
	(class selectors detect: [ :each | each = #description ] ifNone: [ nil ]) notNil ifTrue: [
		self performComponentRefactoring: (MADescriptionRenameRefactoring forClass: class) ]