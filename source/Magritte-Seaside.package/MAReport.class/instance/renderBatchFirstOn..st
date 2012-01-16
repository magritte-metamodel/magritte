rendering-batch
renderBatchFirstOn: html
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self batchPage: self defaultBatchPage ]; with: '|<' ]
		ifTrue: [ html text: '|<' ].
	html space