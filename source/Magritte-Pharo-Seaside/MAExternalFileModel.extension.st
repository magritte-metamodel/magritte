Extension { #name : #MAExternalFileModel }

{ #category : #'*magritte-pharo-seaside-accessing' }
MAExternalFileModel >> url [
	^ self baseUrl isNil
		ifTrue: [ super url ]
		ifFalse: [ self baseUrl , '/' , (self location reduce: [ :a :b | a , '/' , b ]) , '/' , self filename ]
]
