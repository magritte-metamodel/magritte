Class {
	#name : #ORCmdMagritteDescriptionUpdate,
	#superclass : #ORCmdMethodRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #accessing }
ORCmdMagritteDescriptionUpdate >> label [
	^ 'Update Magritte description'
]

{ #category : #accessing }
ORCmdMagritteDescriptionUpdate >> longDescription [
	^ 'Move Magritte description to instance side and convert to use pragmas.'
]

{ #category : #accessing }
ORCmdMagritteDescriptionUpdate >> refactoring [
	^ MAMethodRefactoring
		model: self model
		swapMethod: self currentNode selector
		in: self currentNode theClass
]
