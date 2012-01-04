building
buildTestClassFor: aClass 
	"Utility method to create test cases for each object. Use like:
	
	 self buildTestClassFor: MAObject "
	| thisName thisClass thisCategory parentClass |
	thisName := (aClass name , 'Test') asSymbol.
	(thisName beginsWith: 'MA') ifFalse: [ ^ self ].
	thisClass := GRPlatform current magritteClassNamed: thisName.
	thisCategory := 'Magritte-Tests-Model-' , (aClass category copyAfterLast: $-).
	parentClass := self = thisClass 
		ifTrue: [ self superclass ]
		ifFalse: 
			[ GRPlatform current magritteClassNamed: (aClass superclass name , 'Test') asSymbol ].
	thisClass := parentClass 
		subclass: thisName
		instanceVariableNames: (thisClass isNil 
				ifFalse: [ thisClass instanceVariablesString ]
				ifTrue: [ String new ])
		classVariableNames: ''
		poolDictionaries: ''
		category: thisCategory.
	thisClass 
		compile: 'actualClass
	^ ' , aClass name
		classified: #private.
	thisClass class 
		compile: 'isAbstract
	^ ' , aClass isAbstract greaseString
		classified: #testing.
	aClass subclassesDo: [ :each | self buildTestClassFor: each ]