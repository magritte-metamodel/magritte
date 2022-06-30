Extension { #name : #GtPhlowView }

{ #category : #'*Magritte-GToolkit' }
GtPhlowView >> maOn: anObject perform: aMessageSymbol withContext: aContext [
	"Adapted from on:perform:withArguments:"
	<return: #GtPhlowView>
	"<gtCollector>"
	
	| aCollectionOfArguments |
	aCollectionOfArguments := { self. aContext }.
	
	^ [ 
			| aDescription aPhlowView |
			aDescription := thisContext
				object: anObject
				perform: aMessageSymbol
				withArguments: #()
				inClass: anObject class.
			aPhlowView := aDescription gtView cull: self cull: aDescription cull: anObject.
			self 
				assert: [ aPhlowView ~= self ] 
				description: [ 'Phlow view definition cannot return same view that is passed as an argument. Use `aView empty` instead in: ',
					anObject printString, '>>#', aMessageSymbol asString ].
			aPhlowView object: anObject arguments: aCollectionOfArguments.
		] on: Error do: [ :anException |
			NonInteractiveTranscript stdout
				nextPut: $[;
				nextPutAll: self class name;
				nextPut: $];
				space;
				print: anException;
				cr.
			
			self 
				phlowErrorViewWithException: anException 
				forBuildContext: (GtPhlowBuildContext new object: anObject; arguments: aCollectionOfArguments) 
				andSelector: aMessageSymbol ]
]
