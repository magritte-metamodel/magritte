private
uniqueValues
	"Answer the unique rows with the unique values, used for filtering."

	^ self propertyAt: #uniqueValues ifAbsentPut: [
		| uniqueValues |
		uniqueValues := Dictionary new.
		self report rows
			do: [ :row | uniqueValues at: (self valueFor: row) put: row ].
		uniqueValues := uniqueValues values asArray.
		self sorter isNil
			ifFalse: [ uniqueValues sort: self sorter ].
		uniqueValues
			collect: [ :row | self valueFor: row ] ]