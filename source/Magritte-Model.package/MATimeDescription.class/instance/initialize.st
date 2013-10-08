initialization
initialize

	super initialize.
	displayBlock := [ :time | 
		time hour greaseString,
		':',
		time minute greaseString,
		':',
		time second greaseString ].