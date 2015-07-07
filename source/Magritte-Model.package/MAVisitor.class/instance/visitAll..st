visiting
visitAll: aCollection
	"Visit all elements of ==aCollection== with the receiving visitor."

	aCollection do: [ :each | self visit: each ]