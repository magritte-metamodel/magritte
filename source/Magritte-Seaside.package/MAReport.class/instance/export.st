exporting
export
	^ String streamContents: [ :stream |
		self exportOn: stream ]