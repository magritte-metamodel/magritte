private
pullRaw
	| result |
	result := Dictionary new.
	self description do: [ :each |
		result at: each put: (self model
			readUsing: each) ].
	^ result