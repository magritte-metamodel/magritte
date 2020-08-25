Class {
	#name : #ORCmdMagritteDescriptionsClassUpdate,
	#superclass : #ORCmdClassRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #accessing }
ORCmdMagritteDescriptionsClassUpdate >> label [
	^ 'Update Magritte descriptions'
]

{ #category : #accessing }
ORCmdMagritteDescriptionsClassUpdate >> longDescription [
	^ 'Move Magritte descriptions to instance side and convert to use pragmas.'
]

{ #category : #accessing }
ORCmdMagritteDescriptionsClassUpdate >> refactoring [
	^ MAClassRefactoring model: self model className: self currentNode theClass name
]
