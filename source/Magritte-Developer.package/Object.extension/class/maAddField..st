*Magritte-Developer
maAddField: aSymbol
	| elementTypes aClass |
	elementTypes := MAElementDescription allSubclasses sort: [ :a :b | a name > b name ].
	aClass := UIManager default 
		chooseFrom: (elementTypes collect: #name)
		values: elementTypes.
		
	aClass ifNil: [ ^ self ]. "User cancelled"
	
	aClass new 
		accessor: aSymbol;
		maEditAnswering: [ :desc | desc addTo: self as: aSymbol ]