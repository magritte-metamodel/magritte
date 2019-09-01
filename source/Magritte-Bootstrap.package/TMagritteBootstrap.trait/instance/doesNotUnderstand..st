reflective operations
doesNotUnderstand: aMessage
	 
	^ self magritteDescription 
			detect: [ :d | d accessor handlesSelector: aMessage selector ]
			ifFound: [ :handler | handler handleMessage: aMessage for: self ]
			ifNone: [ super doesNotUnderstand: aMessage ].