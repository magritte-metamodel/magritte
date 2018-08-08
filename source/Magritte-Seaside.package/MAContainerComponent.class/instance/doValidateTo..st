private
doValidateTo: aCollectionOfErrors
	self 
		onValidationError: [ self memento validate ] 
		addTo: aCollectionOfErrors.
	self children do: [ :each | 
		self 
			onValidationError: [ each doValidateTo: aCollectionOfErrors ]
			addTo: aCollectionOfErrors ]