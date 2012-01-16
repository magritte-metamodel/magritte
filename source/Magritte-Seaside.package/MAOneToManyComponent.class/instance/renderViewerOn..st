rendering
renderViewerOn: html
	| columns |
	columns := self report columns
		copyWithout: self commands.
	self report columns: (self isReadonly
		ifFalse: [ columns copyWith: self commands ]
		ifTrue: [ columns ]).
	html render: self report