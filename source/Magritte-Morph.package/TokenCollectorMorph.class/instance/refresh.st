private
refresh
	self textInput model model text: ''.
	self tokenViewer removeAllMorphs.
	self objects do: [ :object |
		self tokenViewer addMorphBack: (TokenMorph on: object) ]
					