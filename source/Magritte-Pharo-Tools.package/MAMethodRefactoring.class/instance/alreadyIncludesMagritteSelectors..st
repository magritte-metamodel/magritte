private
alreadyIncludesMagritteSelectors: parseTree
	^ (parseTree pragmas detect: [ :each | MAPragmaBuilder magritteSelectors includes: each selector ] ifNone: [ nil ]) notNil