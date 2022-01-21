"
""I am a dynamic reference to an object with a UUID, similar to what aFileLocator is for a file"".

#Responsibilities
- I maintain a UID representing an object
- I am able to produce the object on demand
- I am easily serializable because my state is only value objects which can be materialized independent of any particular object graph
- Subclasses must implement #object in a way that preserves the previous point e.g. don't store a block or an object that will be serialized elsewhere

#Collaborators
My client.
"
Class {
	#name : #MAObjectUIDReference,
	#superclass : #Object,
	#instVars : [
		'uid'
	],
	#category : #'Magritte-Model-Core'
}

{ #category : #accessing }
MAObjectUIDReference >> object [
	self subclassResponsibility
]

{ #category : #accessing }
MAObjectUIDReference >> uid [

	^ uid
]

{ #category : #accessing }
MAObjectUIDReference >> uid: anObject [

	uid := anObject
]
