accessing-settings
showBody
	^ properties at: #showBody ifAbsent: [ self defaultShowBody ]