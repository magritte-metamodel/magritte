private-validating
validateChildren: anObject 
	anObject do: [ :row :value :each | self reference validate: each ].