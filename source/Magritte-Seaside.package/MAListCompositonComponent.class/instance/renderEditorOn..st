rendering
renderEditorOn: html 
	html table id: self labelId; with: [
		html tableRow: [
			html tableData: [ self renderEditorAvailableOn: html ].
			html tableData 
				style: 'vertical-align: center';
				with: [ self renderEditorButtonAddOn: html ].
			html tableData: [ self renderEditorSelectedOn: html ].
			self isOrdered ifTrue: [
				html tableData 
					style: 'vertical-align: center';
					with: [ self renderEditorButtonOrderOn: html ] ] ] ]