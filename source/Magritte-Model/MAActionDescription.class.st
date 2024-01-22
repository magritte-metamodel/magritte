Class {
	#name : #MAActionDescription,
	#superclass : #MAObject,
	#instVars : [
		'enableBlock',
		'model',
		'comment',
		'priority',
		'label',
		'action',
		'icon',
		'isMutator',
		'shortcut'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #testing }
MAActionDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAActionDescription class >> maPragma [
	"Annotate constructor methods with this pragma to get picked up by Magritte; similar to #magritteDescription"
	^ #magritteActionDescription
]

{ #category : #comparing }
MAActionDescription >> <= anObject [

	^ self priority <= anObject priority
]

{ #category : #comparing }
MAActionDescription >> = anObject [
	^ self == anObject
]

{ #category : #accessing }
MAActionDescription >> action [

	^ action
]

{ #category : #accessing }
MAActionDescription >> action: aValuable [

	| anOldAction |
	anOldAction := action.
	action := aValuable.
	
	self propertyAnnounceKey: #action oldValue: anOldAction newValue: aValuable
]

{ #category : #accessing }
MAActionDescription >> comment [

	^ comment ifNil: [ '' ]
]

{ #category : #accessing }
MAActionDescription >> comment: aString [

	comment := aString.
]

{ #category : #accessing }
MAActionDescription >> definingContext [
	
	^ self propertyAt: #definingContext ifAbsent: [ nil ]
]

{ #category : #accessing }
MAActionDescription >> definingContext: anMADefiningContext [
	
	^ self propertyAt: #definingContext  put: anMADefiningContext
]

{ #category : #accessing }
MAActionDescription >> enableBlock [
	^ enableBlock ifNil: [ true ]
]

{ #category : #accessing }
MAActionDescription >> enableBlock: aBlock [
	"aBlock
		- one argument (optional); the model object
		- returns a boolean indicating whether the button should be enabled"
	
	enableBlock := aBlock.
]

{ #category : #comparing }
MAActionDescription >> hash [
	^ super hash bitXor: self action hash
]

{ #category : #accessing }
MAActionDescription >> icon [
	^ icon ifNotNil: [ self iconNamed: icon ]
]

{ #category : #accessing }
MAActionDescription >> icon: aSymbol [
	"Browse available via `Smalltalk ui icons`"
	icon := aSymbol
]

{ #category : #'initialize-release' }
MAActionDescription >> initialize [

	super initialize.
	enableBlock := [ true ].
]

{ #category : #testing }
MAActionDescription >> isEnabled [

	^ enableBlock cull: model.
]

{ #category : #accessing }
MAActionDescription >> isLabelVisible [
	"Experiment: Are label and icon 'either-or', or might a user want both?"
	^ self propertyAt: #isLabelVisible ifAbsent: [ true ].
]

{ #category : #accessing }
MAActionDescription >> isLabelVisible: aBoolean [
	self propertyAt: #isLabelVisible put: aBoolean
]

{ #category : #accessing }
MAActionDescription >> isMutator [
	^ isMutator ifNil: [ true ]
]

{ #category : #accessing }
MAActionDescription >> isMutator: anObject [
	"Does the action I describe potentially change the object it acts on?"
	isMutator := anObject
]

{ #category : #accessing }
MAActionDescription >> label [

	^ label ifNil: [ action asString capitalized normalizeCamelCase ].
]

{ #category : #accessing }
MAActionDescription >> label: aString [

	| anOldLabel |
	anOldLabel := label.
	label := aString.
	
	self propertyAnnounceKey: #label oldValue: anOldLabel newValue: aString
]

{ #category : #private }
MAActionDescription >> performOn: aModel [

	action cull: aModel.
]

{ #category : #accessing }
MAActionDescription >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' label: '; print: self label.
	aStream nextPutAll: ' comment: '; print: self comment
]

{ #category : #accessing }
MAActionDescription >> priority [

	^ priority ifNil: [ 0 ]
]

{ #category : #accessing }
MAActionDescription >> priority: anInteger [ 

	priority := anInteger.
]

{ #category : #accessing }
MAActionDescription >> selector [
	self 
		deprecated: 'Renamed to #action because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector' 
						-> '`@receiver action'.
	^ self action
]

{ #category : #accessing }
MAActionDescription >> selector: aValuable [
		self 
		deprecated: 'Renamed to #action: because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector: `@arg' 
						-> '`@receiver action: `@arg'.

	self action: aValuable.
]

{ #category : #accessing }
MAActionDescription >> shortcut [
	^ shortcut
]

{ #category : #accessing }
MAActionDescription >> shortcut: anObject [
	shortcut := anObject
]
