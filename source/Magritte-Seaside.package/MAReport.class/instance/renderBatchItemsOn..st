rendering-batch
renderBatchItemsOn: html
	self batchPageRangeStart > self defaultBatchPage
		ifTrue: [ html text: '...'; space ].
	self batchPageRange do: [ :index |
		self batchPage = index
			ifFalse: [ html anchor callback: [ self batchPage: index ]; with: index ]
			ifTrue: [ html span class: 'current'; with: index ].
		html space ].
	self batchPageRangeEnd < (self batchMaxPages - 1)
		ifTrue: [ html text: '...'; space ].
	self batchPageRangeEnd = self batchMaxPages
		ifFalse: [
			html anchor
				callback: [ self batchPage: self batchMaxPages ];
				with: self batchMaxPages ]