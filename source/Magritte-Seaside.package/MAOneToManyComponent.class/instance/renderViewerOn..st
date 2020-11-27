rendering
renderViewerOn: html
	| columns |
	columns := self report columns
		copyWithout: self commandColumn.
	self report columns: (self isReadOnly
		ifFalse: [ columns copyWith: self commandColumn ]
		ifTrue: [ columns ]).
	html render: self report