"
I am an abstract superclass for descriptions holding onto another description.
!What is a ==reference==?
My subclasses describe the ''relationship'' between the containing object and the referenced objects (e.g. tree -> apples), but what if we need a decription of a referenced object ''itself''? This is where my ==reference== comes in.
!!Motivation
Why would we need such a description, you ask? Perhaps you want to convert these objects to strings for display in a GUI (e.g. ${method:MAOptionDescription>>#labelForOption:}$), or validate a user-added option (e.g. ${method:MAOptionDescription>>#validateOptionKind:}$). To get a feel for how references are used in practice, you may want to take a few moments to browse the clients:

[[[language=smalltalk
	#reference gtReferences & 'Magritte' gtPackageMatches
]]]

The next question that comes to mind might be, ""why can't we just use the object's own description?"" That's a great question. Here are some reasons why that may not work:
- You want fine-grained control. The comment of ${method:MARelationDescription>>#reference}$ has this tantalizing hint to get you started: ==By setting the reference to a MAContainer instance it is possible to customize the reference description==. That said, Magritte does not seem to offer any examples of how that would actually work.
- The object doesn't ''have'' a description (although in this case, you could add a description via extension methods). Maybe it is an object from outside your project. In this case when no ==reference== description is provided, Magritte tries to create an appropriate one. See for yourself:

[[[language=smalltalk
	#reference gtImplementors & 'Magritte' gtPackageMatches
]]]
!!Further Research
If this isn't clear enough, here are some other 
Here's a description from the ""Magritte - Web Development"" paper:
	''""""Relationship Descriptions.""""... The referenced objects are described by the referencing description, which is – if not manually defined by the developer – automatically built from the intersection of the element descriptions. (Section 2.3 on page 7)''

And another clue *from ""Dynamic Web Development with Seaside"">http://book.seaside.st/book/advanced/magritte/descriptions*:
	''Option Descriptions... The selected items are described by the referencing description.''

Here's some info pieced together from the ML:

In *this post>http://forum.world.st/MASingleOptionDescription-with-add-button-tp117102p117103.html*, Lukas alludes to the reference's primary role being string conversion:
>> 2) reference: MANazionalityModel description 
>> What's the sense of this declaration? 
>To render the label of the referenced object. 

> We use reference: to replace the normal full Magritte Description by 
a specialized one. When navigating from an order to an orderLine, 
we might not want to use the orderDescription of the orderLine. - *Stephan Eggermont>http://forum.world.st/reference-what-is-it-tp4805794p4813841.html*

From *a 2006 thread>http://forum.world.st/MA-labaled-options-tp116188.html`*, seems to confirm that a reference is a Magritte description that describes the referenced objects.

*Here>http://forum.world.st/MAToOneRelationDescription-dispaly-data-tp117214p117218.html*, Lukas says:
> you want a different string to be displayed? If so, try this 
==
	reference: (MAContainer with: (MAStringDescription new   
		selectorAccessor: #printString; yourself)) 
==
>and implement your own printOn: method in your referenced object as   
you wish. 
"
Class {
	#name : #MAReferenceDescription,
	#superclass : #MAElementDescription,
	#instVars : [
		'reference'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAReferenceDescription class >> defaultReference [
	^ MAStringDescription new
]

{ #category : #visiting }
MAReferenceDescription >> acceptMagritte: aVisitor [
	aVisitor visitReferenceDescription: self
]

{ #category : #'acessing-magritte' }
MAReferenceDescription >> descriptionReference [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #reference;
		classes: MADescription withAllConcreteClasses;
		label: 'Description';
		priority: 400;
		beRequired;
		yourself
]

{ #category : #accessing }
MAReferenceDescription >> initializer [
	^ self propertyAt: #initializer ifAbsent: [ #yourself ]
]

{ #category : #accessing }
MAReferenceDescription >> initializer: valuable [
	self propertyAt: #initializer put: valuable
]

{ #category : #copying }
MAReferenceDescription >> postCopy [
	super postCopy.
	reference := reference copy
]

{ #category : #accessing }
MAReferenceDescription >> reference [
	^ reference ifNil: [ reference := self class defaultReference ]
]

{ #category : #accessing }
MAReferenceDescription >> reference: aDescription [
	reference := aDescription
]
