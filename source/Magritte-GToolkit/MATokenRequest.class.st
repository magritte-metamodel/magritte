Class {
	#name : 'MATokenRequest',
	#superclass : 'BlEvent',
	#instVars : [
		'action'
	],
	#category : 'Magritte-GToolkit-Support'
}

{ #category : 'api - stream' }
MATokenRequest class >> action: aBlock [
	
	^ self new
		action: aBlock;
		yourself
]

{ #category : 'accessing' }
MATokenRequest >> action [

	^ action
]

{ #category : 'accessing' }
MATokenRequest >> action: anObject [

	action := anObject
]

{ #category : 'accessing' }
MATokenRequest >> answer: player [
	^ self action value: player
]
