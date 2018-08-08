accessing-defaults
defaultDisplayProperty

	^ [ :time | 
		time hour greaseString, ':',
		time minute greaseString, ':',
		time second greaseString ].