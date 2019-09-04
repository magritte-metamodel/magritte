*Magritte-Developer
maAddField: aSymbol with: customizationBlock
	"If you don't need to customize the field description, you can use the simpler `#maAddField:`
	
	Arguments:
		aSymbol - field name
		customizationBlock - takes description as argument; hook to modify it before it is serialized as a constructor method"

	| elementTypes aClass |
	elementTypes := MAElementDescription allSubclasses sort: [ :a :b | a name > b name ].
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