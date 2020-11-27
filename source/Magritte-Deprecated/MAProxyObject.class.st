"
I represent an abstract proxy object, to be refined by my subclasses.
"
Class {
	#name : #MAProxyObject,
	#superclass : #ProtoObject,
	#instVars : [
		'realSubject'
	],
	#category : 'Magritte-Deprecated'
}

{ #category : #'instance creation' }
MAProxyObject class >> new [
	MAError signal: 'Objects of this class require a delegate. Use #on:.'
]

{ #category : #'instance creation' }
MAProxyObject class >> on: anObject [
	^ self basicNew realSubject: anObject
]

{ #category : #copying }
MAProxyObject >> copy [
	"It doesn't make sense to copy proxies in most cases, the real-subject needs to be looked up and will probably return a new instance on every call anyway."

	^ self
]

{ #category : #private }
MAProxyObject >> doesNotUnderstand: aMessage [
	^ self realSubject
		perform: aMessage selector
		withArguments: aMessage arguments
]

{ #category : #'magritte-pharo-model' }
MAProxyObject >> isMorph [
	"Answer ==false==, since I am no morph. Squeak is calling this method after image-startup and might lock if I do not answer to this message."

	^ false
]

{ #category : #testing }
MAProxyObject >> isNil [
	"This method is required to properly return ==true== if the ==realSubject== is ==nil==."

	^ self realSubject isNil
]

{ #category : #printing }
MAProxyObject >> printOn: aStream [
	"Print the receiver on ==aStream== but within square-brackets to show that it is a proxied instance."

	aStream nextPut: $[; print: self realSubject; nextPut: $]
]

{ #category : #printing }
MAProxyObject >> printString [
	^ String streamContents: [ :stream | self printOn: stream ]
]

{ #category : #accessing }
MAProxyObject >> realSubject [
	^ realSubject
]

{ #category : #accessing }
MAProxyObject >> realSubject: anObject [
	realSubject := anObject
]
