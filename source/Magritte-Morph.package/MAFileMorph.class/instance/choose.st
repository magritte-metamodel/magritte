actions
choose
	| file |
	file := UIManager default
		chooseFile: 'Choose ', self magritteDescription label
		in: self magritteDescription defaultDirectory. "[1]"
	file ifNil: [ ^ self ].
	self value: file.
	self displayCurrentValue.
	
"[1] We're using UIManager apparently for two reasons:
		1. To maintain compatibility between Pharo and Squeak.
		2. If this is a Seaside app, we may be headless
	However, none of the Squeak/Pharo common UIManager API does what's needed e.g. to specify a starting folder. So I'm implementing the #chooseFile:in: for headful Pharo. At such time when someone tries in another scenario i.e. headless/Squeak, we have an entry point to implement support for those"