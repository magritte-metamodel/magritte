Class {
	#name : #MAFileModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : 'Magritte-Tests-Model-Models'
}

{ #category : #testing }
MAFileModelTest class >> isAbstract [
	^ self name = #MAFileModelTest
]

{ #category : #private }
MAFileModelTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #running }
MAFileModelTest >> setUp [
	super setUp.
	model := self actualClass new
]

{ #category : #running }
MAFileModelTest >> tearDown [
	model finalize
]

{ #category : #tests }
MAFileModelTest >> testComparing [
	| other |
	other := self actualClass new.
	other 
		filename: 'something.dat';
		contents: (ByteArray with: 1 with: 2 with: 3).

	self assert: model = model.
	
	self deny: model = other.
	self deny: other = model.
	other finalize.	"should be in tearDown;  for now, at least let's discard when we pass"
]

{ #category : #tests }
MAFileModelTest >> testContents [
	self assert: model contents isEmpty.

	model contents: (ByteArray with: 1 with: 2 with: 3).
	self assert: model contents = (ByteArray with: 1 with: 2 with: 3).
	self assert: model filesize = 3
]

{ #category : #tests }
MAFileModelTest >> testFilename [
	self assert: model filename = 'unknown'.
	self assert: model extension isEmpty.

	model filename: 'test.txt'.
	self assert: model filename = 'test.txt'.
	self assert: model extension = 'txt'
]

{ #category : #tests }
MAFileModelTest >> testIsEmpty [
	self assert: model isEmpty.

	model filename: 'foo.txt'.
	self assert: model isEmpty.

	model mimetype: 'text/plain'.
	self assert: model isEmpty.

	model contents: 'hello'.
	self deny: model isEmpty
]

{ #category : #tests }
MAFileModelTest >> testMimetype [
	self assert: model mimetype = 'application/octet-stream'.
	self assert: model maintype = 'application'.
	self assert: model subtype = 'octet-stream'.

	model mimetype: 'text/html'.
	self assert: model mimetype = 'text/html'.
	self assert: model maintype = 'text'.
	self assert: model subtype = 'html'
]

{ #category : #tests }
MAFileModelTest >> testMimetypeApplication [
	model mimetype: 'application/pdf'.

	self assert: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self deny: model isVideo
]

{ #category : #tests }
MAFileModelTest >> testMimetypeAudio [
	model mimetype: 'audio/mpeg'.

	self deny: model isApplication.
	self assert: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self deny: model isVideo
]

{ #category : #tests }
MAFileModelTest >> testMimetypeDefault [
	self assert: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self deny: model isVideo
]

{ #category : #tests }
MAFileModelTest >> testMimetypeImage [
	model mimetype: 'image/png'.

	self deny: model isApplication.
	self deny: model isAudio.
	self assert: model isImage.
	self deny: model isText.
	self deny: model isVideo
]

{ #category : #tests }
MAFileModelTest >> testMimetypeText [
	model mimetype: 'text/xml'.

	self deny: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self assert: model isText.
	self deny: model isVideo
]

{ #category : #tests }
MAFileModelTest >> testMimetypeVideo [
	model mimetype: 'video/mpeg'.
	
	self deny: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self assert: model isVideo
]
