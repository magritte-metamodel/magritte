copying
copyWithoutAll: aCollection
	^self reject: [:each | aCollection includes: each]