Class {
	#name : #MAPropertyChangedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'key',
		'value',
		'owner'
	],
	#category : #'Magritte-Model-Core'
}

{ #category : #accessing }
MAPropertyChangedAnnouncement >> key [
	^ key
]

{ #category : #accessing }
MAPropertyChangedAnnouncement >> key: anObject [
	key := anObject
]

{ #category : #accessing }
MAPropertyChangedAnnouncement >> owner [
	^ owner
]

{ #category : #accessing }
MAPropertyChangedAnnouncement >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
MAPropertyChangedAnnouncement >> value [
	^ value
]

{ #category : #accessing }
MAPropertyChangedAnnouncement >> value: anObject [
	value := anObject
]
