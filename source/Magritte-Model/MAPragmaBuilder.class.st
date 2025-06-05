"
I dynamically build container descriptions from instance-side methods decorated pragmas. The pragmas used are:
# ==#magritteContainer== to identify the method generating the container instance.
# ==#magritteDescription== for unary methods returning valid Magritte descriptions which are added to the container.
# ==#magritteDescription:== for single parameter methods returning Magritte description extensions, where the pragma parameter defines the related Magritte description method. The extension method will be called after the related method to refine the description definition.
"
Class {
	#name : 'MAPragmaBuilder',
	#superclass : 'MABasicObject',
	#category : 'Magritte-Model-Utility'
}

{ #category : 'constants' }
MAPragmaBuilder class >> containerPragma [ 
	^ #magritteContainer
]

{ #category : 'instance creation' }
MAPragmaBuilder class >> for: anObject [
	^ self new for: anObject
]

{ #category : 'constants' }
MAPragmaBuilder class >> magritteDescriptionExtensionPragma [ 
	^ #magritteDescription:
]

{ #category : 'constants' }
MAPragmaBuilder class >> magritteDescriptionPragma [ 
	^ #magritteDescription
]

{ #category : 'constants' }
MAPragmaBuilder class >> magritteSelectors [
	^ Array with: self containerPragma with: self magritteDescriptionExtensionPragma with: self magritteDescriptionPragma
]

{ #category : 'private' }
MAPragmaBuilder >> applyExtensions: descriptionExtensions for: each of: anObject to: description [
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: description) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].
]

{ #category : 'private' }
MAPragmaBuilder >> build: anObject cache: cache [
	| container |
	container := cache at: anObject put: (self buildContainer: anObject).
	
	^ container
		addAll: (self buildDescriptions: anObject);
		yourself.

]

{ #category : 'private' }
MAPragmaBuilder >> buildContainer: anObject [
	| containerPragmas containerPragma containerSelector extensionSelectors container |
	
	containerPragmas := Pragma 
		allNamed: self class containerPragma 
		from: anObject class to: Object.
		
	containerPragma := containerPragmas detect: [ :each | each method numArgs = 0 ].
	containerSelector := containerPragma method selector.

	extensionSelectors := (containerPragmas 
		select: [ :each | each method numArgs = 1 ]) 
		collect: [ :each | each method selector ]. 

	MADynamicDescribedObject use: anObject during: [	
		container := anObject perform: containerSelector.
		extensionSelectors do: [ :each | 
			anObject perform: each with: container ] ].

	^ container
]

{ #category : 'private' }
MAPragmaBuilder >> buildDescriptions: anObject [
	| descriptionExtensions descriptionSelectors extendedDescriptions |
	
	descriptionSelectors := self uniqueDescriptionSelectors: anObject.
	descriptionExtensions := self descriptionExtensions: anObject.
	
	extendedDescriptions := descriptionSelectors 
		collect:  [ :descSel |
			| initialDescription |
			initialDescription := anObject perform: descSel.
			
			self setDefiningContextOf: initialDescription to: descSel in: anObject class.
			
			self description: initialDescription extendedBy: descriptionExtensions for: descSel of: anObject ].

	^ extendedDescriptions select: #notNil.
]

{ #category : 'private' }
MAPragmaBuilder >> description: description extendedBy: descriptionExtensions for: descriptionSelector of: anObject [
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: descriptionSelector) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].
]

{ #category : 'private' }
MAPragmaBuilder >> descriptionExtensions: anObject [
	| extensionPragmas |
	
	extensionPragmas := Pragma
		allNamed: self class magritteDescriptionExtensionPragma
		from: anObject class to: Object.
	
	^ extensionPragmas inject: Dictionary new into: [ :extensionSelectors :each | 
		| extensionSelectorTarget |
		extensionSelectorTarget := each arguments first.
		(extensionSelectors at: extensionSelectorTarget ifAbsentPut: [ SortedCollection new ]) add: each method selector.
		extensionSelectors ].

]

{ #category : 'private' }
MAPragmaBuilder >> extensionsFrom: aDictionary matching: aSymbol [
	"
	aDictionary - a cache mapping extensionSelectors to the description they extend
	aSymbol - the getter of the extended description e.g. #fuelOutDescription"
	^ aDictionary at: aSymbol ifAbsent: [ #() ].
]

{ #category : 'description building' }
MAPragmaBuilder >> for: anObject [
	| cache |
	cache := MADynamicDescriptionCache value.
	
	MADynamicDescriptionCache use: cache during: [
		^ cache at: anObject ifAbsentPut: [ self build: anObject cache: cache ] ]
]

{ #category : 'private' }
MAPragmaBuilder >> setDefiningContextOf: aDescription to: aSelector in: aClass [
	| aSource |
	aDescription ifNil: [ ^ nil ].
	
	aSource := MADescriptionContext new
		modelClass: aClass;
		methodSelector: aSelector.
	
	aDescription definingContext: aSource.
]

{ #category : 'private' }
MAPragmaBuilder >> uniqueDescriptionSelectors: anObject [
	| descriptionPragmas selectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class magritteDescriptionPragma 
		from: anObject class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]
