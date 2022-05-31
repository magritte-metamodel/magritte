Class {
	#name : #MATokenCollectorElement,
	#superclass : #MATokenSelectorElement,
	#category : #'Magritte-GToolkit-Widgets'
}

{ #category : #accessing }
MATokenCollectorElement >> onTokenRemovedFor: anObject [
	| collection |
	collection := self object readUsing: self relationDescription.
	collection remove: anObject
]

{ #category : #accessing }
MATokenCollectorElement >> onTokenRequestFor: anObject [
	| collection |
	collection := self object readUsing: self relationDescription.
	collection add: anObject.
	self refreshTokens
]

{ #category : #accessing }
MATokenCollectorElement >> refreshTokens [

	| collection |
	self tokenContainer removeChildren.
	collection := self object readUsing: self relationDescription.
	collection isEmptyOrNil ifTrue: [ ^ self ].
	collection do: [ :e | self addTokenFor: e ].
]
