Extension { #name : #MAElementDescription }

{ #category : #'*magritte-model' }
MAElementDescription >> printFor: anObject on: aWriteStream [ 
	(self read: anObject) ifNotNil: [ :value | aWriteStream nextPutAll: (self toString: value) ]
]
