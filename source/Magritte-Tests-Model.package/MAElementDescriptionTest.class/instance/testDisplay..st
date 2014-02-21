private
testDisplay: aBlockOrSymbol
	"All MAElementDescription classes should respect #display:, but rather than have a bunch of failing tests, we'll implement as needed"

	self description display: aBlockOrSymbol. 	
	self 
		assert: (description toString: self includedInstance) 
		equals: (aBlockOrSymbol value: self includedInstance).