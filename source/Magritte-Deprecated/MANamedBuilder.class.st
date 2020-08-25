"
I dynamically build container descriptions from class-side methods using a simple naming convention for the selector names:

# The method ==#defaultContainer== is called to retrieve the container instance.
# All the unary methods starting with the selector ==#description== are called and should return a valid description to be added to the container.
# All the keyword messages with one argument having a prefix of a method selected in step 2 will be called with the original description to further refine its definition.
"
Class {
	#name : #MANamedBuilder,
	#superclass : #MADescriptionBuilder,
	#category : 'Magritte-Deprecated'
}

{ #category : #private }
MANamedBuilder >> build: anObject [
	| selectors container |
	selectors := SortedCollection withAll: (anObject class allSelectors select: [ :each | each isDescriptionSelector ]).
	container := self build: anObject for: self containerSelector in: selectors.
	^ (selectors select: [ :each | each isDescriptionDefinition ])
		inject: (cache at: anObject put: container)
		into: [ :result :each |
			self containerSelector = each ifFalse: [
				| description |
				description := self build: anObject for: each in: selectors.
				description isDescription
					ifTrue: [ result add: description ] ].
			result ]
]

{ #category : #private }
MANamedBuilder >> build: anObject for: aSelector in: aCollection [
	^ (aCollection select: [ :each | each isDescriptionExtension: aSelector ])
		inject: (anObject perform: aSelector)
		into: [ :result :each | 
			result isNil 
				ifFalse: [ anObject perform: each with: result ] ]
]

{ #category : #configuration }
MANamedBuilder >> containerSelector [
	^ #descriptionContainer
]
