*Magritte-Developer-private
storeVia: anAccessor inDescriptionOn: aStream 
	| isSymmetrical |
	isSymmetrical := self writeSelector = (self readSelector, ':') asSymbol.
	aStream nextPutAll: 'accessor: '.
	isSymmetrical 
		ifTrue: [ aStream print: self selector ]
		ifFalse: [ aStream nextPut: $(; store: self; nextPut: $) ].
	aStream nextPut: $;; cr.