Extension { #name : 'MAElementDescription' }

{ #category : '*Magritte-Merging' }
MAElementDescription >> mergeInPlace: aBoolean [
	self flag: 'Hook for GH Issue #4. NB Not currently used'.
	self propertyAt: #mergeInPlace put: aBoolean
]

{ #category : '*Magritte-Merging' }
MAElementDescription >> patch: target relativeTo: base [ 
	| oldValue newValue |
	oldValue := self read: base.
	newValue := self read: target.
	^ newValue patchRelativeToBase: oldValue as: self of: base.
]

{ #category : '*Magritte-Merging' }
MAElementDescription >> shouldMerge [
	^ self propertyAt: #shouldMerge ifAbsent: [ true ]
]

{ #category : '*Magritte-Merging' }
MAElementDescription >> shouldMerge: aBoolean [
	self propertyAt: #shouldMerge put: aBoolean
]
