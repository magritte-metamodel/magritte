"
I turn the owning component read-only and add an edit button. Clicking that button allows one to toggle between view and edit-mode.
"
Class {
	#name : 'MASwitchDecoration',
	#superclass : 'MAContainerDecoration',
	#category : 'Magritte-Seaside-Decorations'
}

{ #category : 'accessing' }
MASwitchDecoration >> buttons [
	^ self decoratedComponent isReadOnly
		ifTrue: [ Array with: #edit -> 'Edit' ]
		ifFalse: [ Array with: #save -> 'Save' with: #cancel -> 'Cancel' ]
]

{ #category : 'processing' }
MASwitchDecoration >> handleAnswer: anObject continueWith: aBlock [
	self decoratedComponent readOnly: true.
	super handleAnswer: anObject continueWith: aBlock
]
