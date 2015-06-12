private
pullRaw
	| result |
	result := Dictionary new.
	self magritteDescription do: [ :each |
		result at: each put: (self model
			readUsing: each) ].
	^ result