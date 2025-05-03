Class {
	#name : #ORCmdMagritteDescriptionsPackageUpdateWrapper,
	#superclass : #ORCmdOpen,
	#category : 'Magritte-OmniBrowser-Tools'
}

{ #category : #'instance creation' }
ORCmdMagritteDescriptionsPackageUpdateWrapper class >> on: target for: requestor [
	^ ORCmdMagritteDescriptionsPackageUpdate new setTarget: target requestor: requestor
]
