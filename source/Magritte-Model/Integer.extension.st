Extension { #name : #Integer }

{ #category : #'*magritte-model-converting' }
Integer >> asFileSize [
	#( 'B' 'KB' 'MB' 'GB' 'TB' 'PB' 'EB' 'ZB' 'YB' )
		inject: self
		into: [ :value :each |
			value < 1024
				ifFalse: [ value // 1024 ]
				ifTrue: [ ^ value asString , ' ' , each ] ]
]
