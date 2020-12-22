Trait {
	#name : #MATDescriptionPresenter,
	#instVars : [
		'memento',
		'description',
		'parent'
	],
	#category : #'Magritte-UI'
}

{ #category : #testing }
MATDescriptionPresenter >> isRoot [
	^ self parent isNil
]

{ #category : #accessing }
MATDescriptionPresenter >> magritteDescription [
	^ description
]

{ #category : #accessing }
MATDescriptionPresenter >> memento [
	^ memento
]

{ #category : #'accessing-dynamic' }
MATDescriptionPresenter >> model [
	^ self memento model
]

{ #category : #accessing }
MATDescriptionPresenter >> parent [
	^ parent
]

{ #category : #actions }
MATDescriptionPresenter >> reset [
	self memento reset
]

{ #category : #'accessing-dynamic' }
MATDescriptionPresenter >> root [
	^ self isRoot
		ifTrue: [ self ]
		ifFalse: [ self parent root ]
]

{ #category : #initialization }
MATDescriptionPresenter >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MATDescriptionPresenter >> setMemento: aMemento [
	memento := aMemento
]

{ #category : #initialization }
MATDescriptionPresenter >> setParent: aMorph [
	parent := aMorph
]
