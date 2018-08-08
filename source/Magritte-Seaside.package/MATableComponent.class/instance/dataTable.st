accessing
dataTable
	self value isNil
		ifTrue: [ self value: self buildDataTable ]
		ifFalse: [
			(self value rowCount = self magritteDescription rowCount
				and: [ self value columnCount = self magritteDescription columnCount ]) ifFalse: [
					self value: (self value
						copyRows: self magritteDescription rowCount
						columns: self magritteDescription columnCount) ] ].
	^ self value