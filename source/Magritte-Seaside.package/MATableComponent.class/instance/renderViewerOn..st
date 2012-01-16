rendering
renderViewerOn: html 
	html table
		id: self labelId;
		with: 
			[ html tableRow: 
				[ html tableHeading: nil.
				self description columnLabels do: [ :each | html tableHeading: each ] ].
			self description rowLabels keysAndValuesDo: 
				[ :rindex :row | 
				html tableRow: 
					[ html tableHeading: row.
					self description columnLabels keysAndValuesDo: 
						[ :cindex :col | 
						html tableData: (self componentTable 
								uncheckedAt: rindex
								at: cindex) ] ] ] ]