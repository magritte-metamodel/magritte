Class {
	#name : #MAPriorityContainerTest,
	#superclass : #MAContainerTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAPriorityContainerTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAPriorityContainerTest >> actualClass [
	^ MAPriorityContainer
]

{ #category : #'tests-moving' }
MAPriorityContainerTest >> testMoveDown [
	self should: [ super testMoveDown ] raise: Error
]

{ #category : #'tests-moving' }
MAPriorityContainerTest >> testMoveUp [
	self should: [ super testMoveUp ] raise: Error
]
