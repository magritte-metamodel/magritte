testing
hasError: aDescription
	| current |
	errors isNil
		ifFalse: [ ^ errors includes: aDescription ].
	errors := IdentitySet new.
	current := component.
	[ current notNil ] whileTrue: [
		current isMagritteContainer ifTrue: [
			errors addAll: (current errors collect: [ :each |
				each tag isDescription
					ifTrue: [ each tag ]
					ifFalse: [ current magritteDescription ] ]) ].
		current := current parent ].
	^ self hasError: aDescription