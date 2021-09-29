Class {
	#name : #MADescriptionBuilderTest,
	#superclass : #TestCase,
	#category : 'Magritte-Tests-Model-Utility'
}

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer label: 'mock'
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainer: aDescription [
	<magritteContainer>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainerFoo: aDescription [
	<magritteContainer>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new 
		label: 'foo';
		accessor: MADictionaryAccessor new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionBar: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionRec: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription reference: self magritteDescription
]

{ #category : #tests }
MADescriptionBuilderTest >> testContainer [
	self assert: self magritteDescription label = 'mock'.
	self assert: (self magritteDescription hasProperty: #foo).
	self assert: (self magritteDescription hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testDescription [
	self assert: self magritteDescription size = 1.
	self assert: self magritteDescription children first label = 'foo'.
	self assert: (self magritteDescription children first hasProperty: #foo).
	self assert: (self magritteDescription children first hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testExtension [
	| description |
	description := MAMockAddress new magritteDescription
		detect: [ :each | each accessor selector = #place ].
	self assert: description isRequired.
	self assert: description isVisible not
]

{ #category : #tests }
MADescriptionBuilderTest >> testNilled [
	| description |
	description := MAMockAddress new magritteDescription.
	self assert: description size = 3
]

{ #category : #tests }
MADescriptionBuilderTest >> testRecursive [
	self assert: self magritteDescription children first reference = self magritteDescription
]
