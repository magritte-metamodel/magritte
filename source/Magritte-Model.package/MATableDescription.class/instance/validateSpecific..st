validation-private
validateSpecific: anObject
	self
		tryValidation: [ super validateSpecific: anObject ]
		ifPass: [ 
			self validateCounts: anObject.
			self validateChildren: anObject ]