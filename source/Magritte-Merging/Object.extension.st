Extension { #name : 'Object' }

{ #category : '*Magritte-Merging' }
Object >> is: newValue anInterestingReplacementFor: oldValue [
	newValue isNil ifTrue: [ ^ false ].
	oldValue = newValue ifTrue: [ ^ false ].
	^ true
]

{ #category : '*Magritte-Merging' }
Object >> patchRelativeToBase: baseName [ 

	| operations relevantFields relevantOperations |
	relevantFields := self magritteDescription children select: #shouldMerge.
	operations := relevantFields collect: [ :desc | desc patch: self relativeTo: baseName ].
	relevantOperations := operations reject: #isEmptyOrNil.
	^ MAPatchMacro new
		operations: relevantOperations;
		yourself
]

{ #category : '*Magritte-Merging' }
Object >> patchRelativeToBase: oldValue as: description of: receiver [ 

		^ (receiver is: self anInterestingReplacementFor: oldValue)
				ifTrue: [ 
					MAPatchOperation new 
						receiver: receiver;
						field: description;
						oldValue: oldValue;
						newValue: self ]
				ifFalse: [ nil ].
]
