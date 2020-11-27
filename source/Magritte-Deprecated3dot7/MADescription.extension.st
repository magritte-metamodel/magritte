Extension { #name : #MADescription }

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription >> beReadonly [
	self 
		deprecated: 'Use #beReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver beReadonly' 
						-> '`@receiver beReadOnly'.
		^ self beReadOnly
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription class >> defaultReadonly [
	self 
		deprecated: 'Use #defaultReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver defaultReadonly' 
						-> '`@receiver defaultReadOnly'.
	^ self defaultReadOnly
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription >> isReadonly [
	self 
		deprecated: 'Use #isReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver isReadonly' 
						-> '`@receiver isReadOnly'.
	^ self isReadOnly
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription >> readonly [
	self 
		deprecated: 'Use #readOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver readonly' 
						-> '`@receiver readOnly'.
		^ self readOnly
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription >> readonly: aBoolean [
	self 
		deprecated: 'Use #readOnly: instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver readonly:' 
						-> '`@receiver readOnly:'.
		^ self readOnly: aBoolean
]
