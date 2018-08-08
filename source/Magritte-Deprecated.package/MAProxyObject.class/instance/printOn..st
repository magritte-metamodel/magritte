printing
printOn: aStream
	"Print the receiver on ==aStream== but within square-brackets to show that it is a proxied instance."

	aStream nextPut: $[; print: self realSubject; nextPut: $]