accessing
dataTable
	self value isNil
		ifTrue: [ self value: self buildDataTable ]
		ifFalse: [
			(self value rowCount = self description rowCount
				and: [ self value columnCount = self description columnCount ]) ifFalse: [
					self value: (self value
						copyRows: self description rowCount
						columns: self description columnCount) ] ].
	^ self value