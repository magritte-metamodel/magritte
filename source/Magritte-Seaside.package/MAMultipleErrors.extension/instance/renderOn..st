*magritte-seaside-rendering
renderOn: html
	html unorderedList: [
		self collection
			do: [ :each | html listItem: each ] ]