accessing-dynamic
classes

	^ self magritteDescription classes asSortedCollection: [ :a :b | a name < b name ].