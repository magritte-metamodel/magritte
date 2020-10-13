private
extensionsFrom: aDictionary matching: aSymbol
	"
	aDictionary - a cache mapping extensionSelectors to the description they extend
	aSymbol - the getter of the extended description e.g. #fuelOutDescription"
	^ aDictionary at: aSymbol ifAbsent: [ #() ].