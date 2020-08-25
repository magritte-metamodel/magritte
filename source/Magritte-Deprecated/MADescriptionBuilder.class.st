Class {
	#name : #MADescriptionBuilder,
	#superclass : #MABasicObject,
	#instVars : [
		'cache'
	],
	#classVars : [
		'Default'
	],
	#category : 'Magritte-Deprecated'
}

{ #category : #accessing }
MADescriptionBuilder class >> default [
	^ Default ifNil: [ Default := MAPragmaBuilder new ]
]

{ #category : #accessing }
MADescriptionBuilder class >> default: aBuilder [
	Default := aBuilder
]

{ #category : #building }
MADescriptionBuilder class >> for: anObject [
	^ self default for: anObject
]

{ #category : #initialization }
MADescriptionBuilder class >> unload [
	self default finalize.
	self default: nil
]

{ #category : #private }
MADescriptionBuilder >> build: anObject [
	self subclassResponsibility
]

{ #category : #initialization }
MADescriptionBuilder >> finalize [
	super finalize.
	self flush; unregister
]

{ #category : #actions }
MADescriptionBuilder >> flush [
	cache := IdentityDictionary new
]

{ #category : #accessing }
MADescriptionBuilder >> for: anObject [
	^ cache at: anObject ifAbsentPut: [ self build: anObject ]
]

{ #category : #initialization }
MADescriptionBuilder >> initialize [
	super initialize.
	self flush; register
]

{ #category : #events }
MADescriptionBuilder >> modified [
	self flush
]

{ #category : #actions }
MADescriptionBuilder >> register [
	GRPlatform current 
		magritteRegister: self
		forMethodChangeNotificationsUsing: #modified
]

{ #category : #actions }
MADescriptionBuilder >> unregister [
	GRPlatform current 
		magritteUnregister: self
		forMethodChangeNotificationsUsing: #modified
]
