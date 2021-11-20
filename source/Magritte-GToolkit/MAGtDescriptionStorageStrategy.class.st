Class {
	#name : #MAGtDescriptionStorageStrategy,
	#superclass : #GtStorageStrategy,
	#instVars : [
		'description',
		'object'
	],
	#category : 'Magritte-GToolkit-Support'
}

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> description [
	^ description
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> description: anObject [
	description := anObject
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> object [
	^ object
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> object: anObject [
	object := anObject
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> read: aGtDocument [
	^ aGtDocument text: (self description read: self object)
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> rootDirectory [
	<return: #FileReference>
	^ FileSystem workingDirectory
]

{ #category : #accessing }
MAGtDescriptionStorageStrategy >> save: aGtDocument [ 
	self description write: aGtDocument text asString to: self object
]
