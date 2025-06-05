Trait {
	#name : 'TMagritteBootstrap',
	#category : 'Magritte-Bootstrap'
}

{ #category : 'reflective operations' }
TMagritteBootstrap >> doesNotUnderstand: aMessage [
	 
	^ self magritteDescription 
			detect: [ :d | d accessor handlesSelector: aMessage selector ]
			ifFound: [ :handler | handler handleMessage: aMessage for: self ]
			ifNone: [ super doesNotUnderstand: aMessage ].
]
