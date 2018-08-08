rendering
renderTableOn: html
	self showCaption
		ifTrue: [ self renderTableCaptionOn: html ].
	self showSummary
		ifTrue: [ self renderTableSummaryOn: html ].
	html tableHead: [
		self showHeader
			ifTrue: [ self renderTableHeadOn: html ].
		self showFilter
			ifTrue: [ self renderTableFilterOn: html ] ].

	((self showBatch
		and: [ self hasMoreThanOnePage ])
		or: [ self showFooter ]) ifTrue: [
			"we must not produce an empty tfoot element, this is not valid xhtml"
			html tableFoot: [
				self showFooter
					ifTrue: [ self renderTableFootOn: html ].
				self showBatch
					ifTrue: [ self renderTableBatchOn: html ] ] ].

	html tableBody: [
		self showBody
			ifTrue: [ self renderTableBodyOn: html ] ]