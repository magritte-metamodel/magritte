accessing
column
	^ self report cache collect: [ :each | self valueFor: each ]