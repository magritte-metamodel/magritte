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
MADescription class >> defaultMorphClass [
	self deprecated: 'Send message defaultMorphicClass' transformWith: '`@receiver defaultMorphClass' -> '`@receiver defaultMorphicClass'.
	^ self defaultMorphicClass
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription class >> defaultMorphClasses [
	self deprecated: 'Send message defaultMorphicClasses' transformWith: '`@receiver defaultMorphClasses' -> '`@receiver defaultMorphicClasses'.
	^ self defaultMorphicClasses
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
MADescription >> descriptionMorphClass [
	self deprecated: 'Send message descriptionMorphicClass' transformWith: '`@receiver descriptionMorphClass' -> '`@receiver descriptionMorphicClass'.
	^ self descriptionMorphicClass
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
MADescription >> morphClass [
		self deprecated: 'Send message morphicClass' transformWith: '`@receiver morphClass' -> '`@receiver morphicClass'.
	^ self morphicClass
]

{ #category : #'*Magritte-Deprecated3dot7' }
MADescription >> morphClass: aClass [
			self deprecated: 'Send message morphicClass:' transformWith: '`@receiver morphClass: `@argument' -> '`@receiver morphicClass: `@argument'.
	^ self morphicClass: aClass
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
