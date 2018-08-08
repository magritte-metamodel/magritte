copying
copyFrom: aStartIndex to: anEndIndex
	^ self copy
		setChildren: (self children
			copyFrom: aStartIndex
			to: anEndIndex);
		yourself