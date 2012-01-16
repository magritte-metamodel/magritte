rendering
renderEditorOn: html
	(self description isGrouped and: [ self description groupBy canRead: self value ])
		ifTrue: [ self renderEditorForGroupedOn: html ]
		ifFalse: [ self renderEditorForUngroupedOn: html ]
