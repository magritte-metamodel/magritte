"
Besides caching values like my superclass, I also remember the original values of the model at the time the cache is built. With this information I am able to detect edit conflicts and can prevent accidental loss of data by merging the changes.
"
Class {
	#name : 'MACheckedMemento',
	#superclass : 'MACachedMemento',
	#instVars : [
		'original'
	],
	#category : 'Magritte-Model-Memento'
}

{ #category : 'testing' }
MACheckedMemento >> hasConflict [
	"Answer ==true==, if there is an edit conflict."

	^ self hasChanges and: [ self hasModelChangedElsewhere ]
]

{ #category : 'testing' }
MACheckedMemento >> hasModelChangedElsewhere [
	^ self has: self original changedFrom: self pullRaw
]

{ #category : 'accessing' }
MACheckedMemento >> original [
	^ original
]

{ #category : 'actions' }
MACheckedMemento >> reset [

	| dict |
	super reset.
	
	dict := self pullRawTransforming: [ :value :desc |
		| isCollectionOfRelations |
		isCollectionOfRelations := value isCollection and: [ (desc isKindOf: MAReferenceDescription) and: [ desc isMultiple ] ].
		isCollectionOfRelations 
			ifTrue: [ value copy ]
			ifFalse: [ value ] ].
	
	self setOriginal: dict.
	
	"Implementation note: We copy some field values because checked mementos compare them to the current object to see if it has changed elsewhere. If a field references a collection, and we hold onto that actual collection, and the elements in the collection are changed from the outside, our 'original' will also change and validation will never fail and so offers no protection. We limit the copying to just this case because copying can cause other unforeseen problems.
	
	One example is illustrated in MAMementoTest>>testSingletonValue.
	
	Another is that we had at one time done the copying in MACachedMemento>>#cookPullRaw:, but it proved too dangerous because the *cache* also contained copies, not just the *original* as here. For example (ignoring the question of whether this is good design), what if the model required that a field point to a *particular* collection? We might replace that particular collection with a copy, which then goes out of sync with the 'real' collection. Now, outside changes also 'bleed' into caches, but it seems not to matter. If a user was worried about outside changes, they would use an MACheckedMemento which would flag the problem during validation, not an MACachedMemento. Choosing a cached memento means we are specifically *not* checking for whether the model has changed elsewhere. Since the cache is changing with the model, there will be nothing to commit unless we explicitly change the field in the memento, which seems like the expected behavior."
]

{ #category : 'initialization' }
MACheckedMemento >> setOriginal: aDictionary [
	original := aDictionary
]

{ #category : 'private-testing' }
MACheckedMemento >> shouldPush: anObject using: aDescription [

	| originalValue cachedValue didChangeHere |
	originalValue := self original at: aDescription.
	cachedValue := self cache at: aDescription.
	
	didChangeHere := aDescription shouldWrite: cachedValue over: originalValue.
	
	^ didChangeHere and: [ super shouldPush: anObject using: aDescription ]
]

{ #category : 'actions' }
MACheckedMemento >> validate [
	self hasConflict
		ifFalse: [ ^ super validate ].
	self reset.
	MAConflictError
		description: self magritteDescription
		signal: self magritteDescription conflictErrorMessage
]
