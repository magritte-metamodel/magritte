instance creation
new
	| random uuid |
	random := GRPlatform current newRandom.
	uuid := Array new: 16.
	1 to: 16 do: [ :i | uuid at: i put: (random nextInt: 256) -1 ].
	^ self uuid: uuid