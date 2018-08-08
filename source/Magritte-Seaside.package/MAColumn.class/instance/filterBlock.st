private
filterBlock
	^ self 
		propertyAt: #filterValue
		ifPresent: [ :value | [ :row | (self valueFor: row) = value ] ]