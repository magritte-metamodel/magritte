private
maxItemsDisplayed
	^ self magritteDescription propertyAt: #maxItemsDisplayed ifAbsent: [ 10 ]
	