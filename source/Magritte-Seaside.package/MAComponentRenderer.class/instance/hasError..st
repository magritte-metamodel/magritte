testing
hasError: aDescription
	| current |
	errors isNil
		ifFalse: [ ^ errors includes: aDescription ].
	errors := IdentitySet new.
	current := component.
	[ current notNil ] whileTrue: [
		current isMagritteContainer ifTrue: [
			current errors do: [ :each |
				errors add: (each tag isDescription
					ifTrue: [ each tag ]
					ifFalse: [ current description ]) ] ].
		current := current parent ].
	^ self hasError: aDescription