private
itemsDisplayed
	^ (self options size min: self maxItemsDisplayed) max: 5
	