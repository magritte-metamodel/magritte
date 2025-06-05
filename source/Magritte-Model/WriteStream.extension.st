Extension { #name : 'WriteStream' }

{ #category : '*magritte-model' }
WriteStream >> maPrint: anMADescription for: anObject [
	anMADescription printFor: anObject on: self
	
	"# Motivation: Printing Convenience

Typically, `#printOn:` and friends have a lot of nil checks sprinkled around. Modern Pharo's tools are typically robust to printString errors, but you still get a not-very-helpful ""error printing"" message. Here comes Magritte to the rescue with `WriteStream >> #maPrint:for:`. 

Here's an example:
```smalltalk
printOn: aStream
	aStream 
		maPrint: self descriptionDescription for: self;
		nextPutAll: 'whatever'.
```
This reads the value and behaves gracefully if it is unset (by doing nothing). Notice that it also fits into the typical cascade without breaking it into multiple statements.

Without this the options are not as nice...

## Old (Typical) Pattern
Nil checks everywhere...
```smalltalk
printOn: aStream
	description ifNotNil: [ :desc | aStream nextPutAll: desc ]
	""repeated for each relevant field""
```
## Naive Magritte Fix
You might just supply a reasonable default value for each description, like:
```smalltalk
descriptionDescription
	<magritteDescription>
	^ MAStringDescription new
		accessor: #description;
		default: '';
		yourself
```
which allows you to simplify to:
```smalltalk
printOn: aStream
	aStream nextPutAll: self description.
```
However, that requires cluttering descriptions with default values which may not fit the domain."
]
