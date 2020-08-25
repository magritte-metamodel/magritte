Extension { #name : #UndefinedObject }

{ #category : #'*magritte-model-converting' }
UndefinedObject >> asAccessor [
	^ MANullAccessor new
]

{ #category : #'*magritte-model-accessing' }
UndefinedObject >> label [
	^ 'n/a'
]

{ #category : #'*magritte-model-accessing' }
UndefinedObject >> magritteDescription [
	^ MAContainer new
]
