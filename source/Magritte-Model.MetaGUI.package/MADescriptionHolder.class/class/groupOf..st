groups
groupOf: aClass 
	(self groupText includes: aClass)
		ifTrue: [ ^ 'Text' ].
	(self groupChoice includes: aClass)
		ifTrue: [ ^ 'Choice' ].
	(self groupMagnitude includes: aClass)
		ifTrue: [ ^ 'Magnitude' ].
	(self groupPick includes: aClass)
		ifTrue: [ ^ 'Pick' ].
	(self groupMisc includes: aClass)
		ifTrue: [ ^ 'Miscellaneous' ].
	^ 'Other'