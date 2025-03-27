Class {
	#name : #ORCmdMagritteDescriptionsPackageUpdate,
	#superclass : #ORCmdRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #accessing }
ORCmdMagritteDescriptionsPackageUpdate >> cluster [
	^ #Refactor
]

{ #category : #accessing }
ORCmdMagritteDescriptionsPackageUpdate >> group [
	^ #open
]

{ #category : #testing }
ORCmdMagritteDescriptionsPackageUpdate >> isActive [
	^ super isActive and: [ self currentNode isKindOf: OBClassCategoryNode ]
]

{ #category : #accessing }
ORCmdMagritteDescriptionsPackageUpdate >> label [
	^ 'Update Magritte descriptions'
]

{ #category : #accessing }
ORCmdMagritteDescriptionsPackageUpdate >> longDescription [
	^ 'Move Magritte descriptions to instance side and convert to use pragmas.'
]

{ #category : #accessing }
ORCmdMagritteDescriptionsPackageUpdate >> refactoring [
	^ MAPackageRefactoring model: self model classes: (self currentNode classes collect: [ :each | each theClass name ])
]
