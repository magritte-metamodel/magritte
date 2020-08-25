Extension { #name : #MAMultipleErrors }

{ #category : #'*magritte-seaside-rendering' }
MAMultipleErrors >> renderOn: html [
	html unorderedList: [
		self collection
			do: [ :each | html listItem: each ] ]
]
