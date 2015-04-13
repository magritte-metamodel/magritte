private
readUsing: aDescription
	^ (self model readUsing: aDescription)
		ifNil: [ aDescription default ]