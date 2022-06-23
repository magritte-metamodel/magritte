Class {
	#name : #MAGtDelegatedSearch,
	#superclass : #Object,
	#instVars : [
		'delegate',
		'message'
	],
	#category : #'Magritte-GToolkit'
}

{ #category : #'magritte-descriptions' }
MAGtDelegatedSearch class >> to: aValuable message: aSymbol [ 

	^ self new
		delegate: aValuable;
		message: aSymbol;
		yourself
]

{ #category : #accessing }
MAGtDelegatedSearch >> delegate [

	^ delegate
]

{ #category : #accessing }
MAGtDelegatedSearch >> delegate: aValuable [

	delegate := aValuable
]

{ #category : #accessing }
MAGtDelegatedSearch >> gtSpotterOn: aStep [
	<gtSearch>
	
	^ self delegate value perform: self message with: aStep
]

{ #category : #accessing }
MAGtDelegatedSearch >> message [

	^ message
]

{ #category : #accessing }
MAGtDelegatedSearch >> message: anObject [

	message := anObject
]
