rendering
renderViewerOn: html 
	html table
		id: self labelId;
		with: 
			[ html tableRow: 
				[ html tableHeading: nil.
				self magritteDescription columnLabels do: [ :each | html tableHeading: each ] ].
			self magritteDescription rowLabels keysAndValuesDo: 
				[ :rindex :row | 
				html tableRow: 
					[ html tableHeading: row.
					self magritteDescription columnLabels keysAndValuesDo: 
						[ :cindex :col | 
						html tableData: (self componentTable 
								uncheckedAt: rindex
								at: cindex) ] ] ] ]