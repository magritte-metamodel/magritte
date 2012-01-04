private
buildContainer: anObject
	| pragmas extensionPragmas container |
	
	pragmas := Pragma 
		allNamed: self class containerPragma 
		in: anObject class theMetaClass.
	extensionPragmas := Pragma 
		allNamed: self class containerExtensionPragma 
		in: anObject class theMetaClass.

	pragmas size > 1 
		ifTrue: [ self error: 'More than one container definition!' ].
	container := pragmas 
		ifNotEmpty: [ pragmas anyOne method valueWithReceiver: anObject arguments: #(). ]
		ifEmpty: [ self defaultContainer: anObject ].
		
	extensionPragmas do: [ :each | 
		each method valueWithReceiver: anObject arguments: {container} ].

	^container