Class {
	#name : #MAPasswordDescriptionTest,
	#superclass : #MAStringDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAPasswordDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAPasswordDescriptionTest >> actualClass [
	^ MAPasswordDescription
]

{ #category : #tests }
MAPasswordDescriptionTest >> testIsObfuscated [
	self deny: (self description isObfuscated: '').
	self deny: (self description isObfuscated: nil).
	self deny: (self description isObfuscated: 123).
	self deny: (self description isObfuscated: '**1').
	self assert: (self description isObfuscated:  '******')
]

{ #category : #tests }
MAPasswordDescriptionTest >> testObfuscated [
	self assert: (self description obfuscated: nil) = ''.
	self assert: (self description obfuscated: 'zork') = '****'.
	self assert: (self description obfuscated: 'foobar') = '******'
]
