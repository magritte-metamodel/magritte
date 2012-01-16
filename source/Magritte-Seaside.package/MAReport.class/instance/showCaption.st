accessing-settings
showCaption
	^ properties at: #showCaption ifAbsent: [ self defaultShowCaption ]