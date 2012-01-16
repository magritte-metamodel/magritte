rendering-batch
renderBatchLastOn: html
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self batchPage: self batchMaxPages ]; with: '>|' ]
		ifTrue: [ html text: '>|' ]