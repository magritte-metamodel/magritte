Class {
	#name : 'MACompositeConflict',
	#superclass : 'Object',
	#instVars : [
		'kind',
		'string'
	],
	#category : 'Magritte-Model'
}

{ #category : 'comparing' }
MACompositeConflict >> = rhs [
	^ self species = rhs species
]

{ #category : 'accessing' }
MACompositeConflict >> doesNotUnderstand: aMessage [
	^ (self kind canUnderstand: aMessage selector)
		ifTrue: [ self string ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : 'comparing' }
MACompositeConflict >> hash [
	^ self species hash
]

{ #category : 'class membership' }
MACompositeConflict >> isKindOf: aClass [
	"This is to pass #validateKind:"
	^ (super isKindOf: aClass) or: [ self kind = aClass ]
]

{ #category : 'accessing' }
MACompositeConflict >> kind [
	^ kind
]

{ #category : 'accessing' }
MACompositeConflict >> kind: aClass [
	kind := aClass
]

{ #category : 'printing' }
MACompositeConflict >> printOn: aStream [
	aStream nextPutAll: self string
]

{ #category : 'accessing' }
MACompositeConflict >> string [
	^ string ifNil: [ '(Multiple values)' ]
]

{ #category : 'accessing' }
MACompositeConflict >> string: aString [
	string := aString
]
