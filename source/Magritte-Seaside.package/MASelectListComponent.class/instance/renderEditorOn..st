rendering
renderEditorOn: html
	(self magritteDescription isGrouped and: [ self magritteDescription groupBy canRead: self value ])
		ifTrue: [ self renderEditorForGroupedOn: html ]
		ifFalse: [ self renderEditorForUngroupedOn: html ]
