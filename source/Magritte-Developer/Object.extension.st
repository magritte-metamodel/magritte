Extension { #name : #Object }

{ #category : #'*Magritte-Developer' }
Object >> descriptionBrowse [
	<magritteActionDescription>
	^ MAActionDescription new
			label: 'Browse Class';
			action: #browse;
			priority: 1100;
			yourself
]

{ #category : #'*Magritte-Developer' }
Object >> descriptionFuelOut [
	<magritteActionDescription>
	^ MAActionDescription new	
			action: #fuelOut;
			priority: 1200;
			comment: 'Fuel Out';
			icon: #smallSave;
			yourself
]

{ #category : #'*Magritte-Developer' }
Object >> descriptionInspect [
	<magritteActionDescription>
	^ MAActionDescription new
			action: #inspect;
			priority: 1000;
			yourself
]

{ #category : #'*Magritte-Developer' }
Object class >> instVarBoilerplateFromDescriptions [
	self new magritteDescription do: [ :e | 
		| varName refactoring |
		varName := e accessor readSelector.
		(self hasInstVarNamed: varName) 
			ifFalse: [ self addInstVarNamed: varName ].
		refactoring := RBCreateAccessorsForVariableRefactoring
					variable: varName
					class: self
					classVariable: false.
		refactoring execute ]
]

{ #category : #'*Magritte-Developer' }
Object class >> maAddField: aSymbol [
	self maAddField: aSymbol with: [ :desc | ]
]

{ #category : #'*Magritte-Developer' }
Object class >> maAddField: aSymbol with: customizationBlock [
	"If you don't need to customize the field description, you can use the simpler `#maAddField:`
	
	Arguments:
		aSymbol - field name
		customizationBlock - takes description as argument; hook to modify it before it is serialized as a constructor method"

	| elementTypes aClass |
	elementTypes := MAElementDescription allSubclasses sort: [ :a :b | a name < b name ].
	aClass := UIManager default 
		chooseFrom: (elementTypes collect: #name)
		values: elementTypes
		lines: #()
		message: 'Choose a type for the #', aSymbol, ' field'.
		
	aClass ifNil: [ ^ self ]. "User cancelled"
	
	aClass new 
		accessor: aSymbol;
		maEditAnswering: [ :desc | 
			customizationBlock value: desc.
			desc addTo: self as: aSymbol ]
]

{ #category : #'*Magritte-Developer' }
Object >> storeVia: anAccessor inDescriptionOn: aStream [

	aStream
		nextPutAll: anAccessor writeSelector , ' (';
		store: self;
		nextPutAll: ');';
		cr
]
