accessing
diffStrings
	| lhs rhs |
	lhs := String streamContents: [ :lstr |
		rhs := String streamContents: [ :rstr | 
			self operations 
				do: [ :op |
					| opDiff |
					opDiff := op diffStrings.
					lstr nextPutAll: opDiff first.
					rstr nextPutAll: opDiff second ]
				separatedBy: [ lstr lf. rstr lf ] ] ].
	^ { lhs. rhs }