testing
isObfuscated: anObject
	^ anObject notNil
		and: [ anObject isString
		and: [ anObject isEmpty not
		and: [ anObject allSatisfy: [ :each | each = $* ] ] ] ]