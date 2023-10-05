Trait {
	#name : #MATPropertyOwner,
	#instVars : [
		'properties'
	],
	#category : #'Magritte-Model-Core'
}

{ #category : #private }
MATPropertyOwner >> errorPropertyNotFound: aSelector [ 
	MAPropertyError signal: 'Property ' , aSelector , ' not found.'
]

{ #category : #accessing }
MATPropertyOwner >> gtViewPropertiesOn: aView [
	<gtView>
	
	self properties ifEmpty: [ ^ aView empty ].
	
	^ aView columnedList
		title: 'Properties' translated;
		priority: 75;
		items: [ self properties associations ];
		column: 'Name' 
			text: [ :a | a key ]
			width: 75;
		column: 'Value' text: [ :a | a value ];
		send: [ :e | e value ];
		actionUpdateButton
]

{ #category : #testing }
MATPropertyOwner >> hasProperty: aKey [
	"Test if the property ==aKey== is defined within the receiver."

	^ self properties includesKey: aKey
]

{ #category : #'*Magritte-Model' }
MATPropertyOwner >> maLazyPropertyUsing: description [
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching property e.g. (readSelector = property = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self propertyAt: description accessor readSelector ifAbsent: [ nil ].
	^ description lazilyInitializeFrom: currentValue for: self.
]

{ #category : #copying }
MATPropertyOwner >> postCopyProperties [
	"Call after super postCopy"
	properties := properties copy
]

{ #category : #accessing }
MATPropertyOwner >> properties [
	"Answer the property dictionary of the receiver."

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #accessing }
MATPropertyOwner >> propertiesSearchOn: aSearch [
	<gtSearch>
	
	^ aSearch list
		title: 'Properties';
		items: [ self properties associations ];
		previewObject: [ :assoc | assoc value ];
		filterBySubstring;
		send: [ :anObject | anObject value ]
]

{ #category : #subscriptions }
MATPropertyOwner >> propertyAnnounceKey: aPropertyKey oldValue: anOldValue newValue: aNewValue [
	"Announce a property change if there are subscriptions."
	
	self propertyAnnouncerDo: [ :anAnnouncer |
		anOldValue = aNewValue ifFalse: [
			anAnnouncer announce: (MAPropertyChangedAnnouncement new
					owner: self;
					key: aPropertyKey;
					value: aNewValue) ] ]
]

{ #category : #subscriptions }
MATPropertyOwner >> propertyAnnouncerDo: aBlock [
	"Announce a property change if there are subscriptions."

	self properties
		at: #propertyAnnouncer
		ifPresent: aBlock
		ifAbsent: [  "ignore" ]
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey [
	"Answer the value of the property ==aKey==, raises an error if the property doesn't exist."

	^ self propertyAt: aKey ifAbsent: [ self errorPropertyNotFound: aKey ]
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the value of the property ==aKey==, or the result of ==aBlock== if the property doesn't exist."

	^ self properties at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the value of the property ==aKey==, or if the property doesn't exist adds and answers the result of evaluating ==aBlock==."

	| aValue shouldAnnounce |
	shouldAnnounce := false.
	
	aValue := self properties 
		at: aKey 
		ifAbsentPut: [
			shouldAnnounce := true.
			aBlock value ].
			
	shouldAnnounce ifTrue: [ 
		self propertyAnnounceKey: aKey oldValue: nil newValue: aValue ].
		
	^ aValue
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey ifPresent: aBlock [
	"Lookup the property ==aKey==, if it is present, answer the value of evaluating ==aBlock== block with the value. Otherwise, answer ==nil==."

	^ self properties at: aKey ifPresent: aBlock
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey ifPresent: oneArgBlock ifAbsent: absentBlock [
	"Lookup ==aKey==, if it is present, answer the value of evaluating the oneArgBlock with the value associated with the key, otherwise answer the value of absentBlock."
	^ self properties at: aKey ifPresent: oneArgBlock ifAbsent: absentBlock
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey ifPresent: oneArgBlock ifAbsentPut: absentBlock [
	"Lookup ==aKey==, if it is present, answer the value of evaluating the oneArgBlock with the value associated with the key, otherwise answer the value of absentBlock."
	| anOldValue aNewValue |
	anOldValue := nil.
	aNewValue := self properties 
		at: aKey 
		ifPresent: [ :aValue | 
			anOldValue := aValue. 
			oneArgBlock value ]
		ifAbsentPut: absentBlock.
			
	self propertyAnnounceKey: aKey oldValue: anOldValue newValue: aNewValue.
	
	^ aNewValue
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aKey put: aValue [
	"Adds or replaces the property ==aKey== with ==aValue==."

	| anOldValue aNewValue |
	anOldValue := self properties at: aKey ifAbsent: [ nil ].
	aNewValue := self properties at: aKey put: aValue.
	
	self propertyAnnounceKey: aKey oldValue: anOldValue newValue: aNewValue.

	^ aNewValue
]

{ #category : #accessing }
MATPropertyOwner >> propertyAt: aSymbol putRemovingNil: aValue [
	
	| anOldValue |
	aValue ifNotNil: [ 
		^ self propertyAt: aSymbol put: aValue ].
	
	anOldValue := (self hasProperty: aSymbol)
		ifTrue: [ self properties removeKey: aSymbol ]
		ifFalse: [ aValue ].
		
	self propertyAnnounceKey: aSymbol oldValue: anOldValue newValue: aValue.
	
	^ anOldValue
]

{ #category : #subscriptions }
MATPropertyOwner >> unsubscribe: aSubscriber [
	self properties
		at: #propertyAnnouncer
		ifPresent: [ :anAnnouncer | 
			anAnnouncer unsubscribe: aSubscriber ]
		ifAbsent: [  "ignore" ]
]

{ #category : #subscriptions }
MATPropertyOwner >> whenPropertyChangedSend: aSelector to: aReceiver [
	| anAnnouncer |
	anAnnouncer := self properties 
		at: #propertyAnnouncer
		ifAbsentPut: [ Announcer new ].
		
	^ anAnnouncer weak 
		when: MAPropertyChangedAnnouncement
		send: aSelector
		to: aReceiver
]
