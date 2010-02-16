*magritte-pharo-seaside-accessing
url
	^ self baseUrl isNil
		ifTrue: [ super url ]
		ifFalse: [ self baseUrl , '/' , (self location reduce: [ :a :b | a , '/' , b ]) , '/' , self filename ]