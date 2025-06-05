"
I am an abstract description for descriptions representing a relation. My instance variable ==classes== references a collection of possible classes that I can relate to. If required the reference description will be automatically built from this list of classes.
!Background Info
Lukas describes them as ""proof of concept"", which probably accounts for the haziness and lack of documentation.

> I've personally never used 
the relationships. I rarely found the default behavior useful, and 
another default behavior was not useful in other contexts. - *Lukas>http://forum.world.st/magrite-toOne-relationship-and-component-creation-tp1561754p1562662.html*

And then in more detail:
> The relationships work for simple things. In practice however I have 
always felt the need to customize the descriptions through one or more 
of the extension mechanisms in Magritte, either for usability or to 
satisfy particular customer requests. 
>
>I must say that the current implementation is more at the state of a 
proof of concept. I never used relationships in any project (other 
than the Magritte meta editor in Magritte itself), it is largely 
untested in practice. The only changes relationships have seen since 
my Master in 2006 were fixes that other people have submitted. The 
fact that some of these fixes got reverted again by newer fixes has 
led me to the conclusion that at least in the current form the 
implementation of relationships is fragile and I refrain from 
suggesting its use. 
>
>I found it more flexible and user-friendly to let Magritte create 
simple components only. I would then compose these individual 
components in a master component. This allows one to easily create 
arbitrary complex forms with custom navigation between different 
objects that exactly match the wishes of the customer with relatively 
little glue code. 
>
>I know that other web and meta-frameworks go much further here. I 
would not mind somebody talking over the issue an implement (and 
maintain) better working and well tested relationship descriptions 
that solve the current problems. - *Lukas>http://forum.world.st/magrite-toOne-relationship-and-component-creation-tp1561754p1563032.html*
"
Class {
	#name : 'MARelationDescription',
	#superclass : 'MAReferenceDescription',
	#instVars : [
		'classes'
	],
	#category : 'Magritte-Model-Description'
}

{ #category : 'accessing-defaults' }
MARelationDescription class >> defaultClasses [
	^ Set new
]

{ #category : 'visiting' }
MARelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitRelationDescription: self
]

{ #category : 'accessing-dynamic' }
MARelationDescription >> allClasses [
	^ (Array withAll: self classes)
		sort: [ :a :b | a label caseInsensitiveLessOrEqual: b label ];
		yourself
]

{ #category : 'accessing' }
MARelationDescription >> classes [
	^ classes ifNil: [ classes := self class defaultClasses ]
]

{ #category : 'accessing' }
MARelationDescription >> classes: aCollection [
	classes := aCollection
]

{ #category : 'accessing-dynamic' }
MARelationDescription >> commonClass [
	"Answer a common superclass of the classes of the receiver. The algorithm is implemented to be as efficient as possible. The inner loop will be only executed the first few iterations."

	| current |
	self classes isEmpty
		ifTrue: [ ^ self descriptionContainer ].
	current := self classes anyOne.
	self classes do: [ :each |
		[ each includesBehavior: current ]
			whileFalse: [ current := current superclass ] ].
	^ current
]

{ #category : 'acessing-magritte' }
MARelationDescription >> descriptionClasses [
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #classes;
		label: 'Classes';
		priority: 400;
		options: Smalltalk globals allClasses;
		default: Set new; "To avoid storing unneeded empty set [1]"
		reference: MAClassDescription new;
		yourself
		
"1. There may be a better way. When generating description methods from meta-meta descriptions, without the line above, an unneeded `default: Set new;` was being added to the generated method."
]

{ #category : 'acessing-magritte' }
MARelationDescription >> descriptionReference [
	<magritteDescription>
	^ super descriptionReference
		classes: MAContainer withAllConcreteClasses;
		beOptional;
		yourself
]

{ #category : 'copying' }
MARelationDescription >> postCopy [
	super postCopy.
	classes := classes copy
]

{ #category : 'accessing-dynamic' }
MARelationDescription >> reference [
	"The reference within a ==*MARelationDescription*== is calculated automatically from all the classes of the receiver, if set to ==nil==. By setting the reference to a ==*MAContainer*== instance it is possible to customize the reference description."

	^ super reference ifNil: [ self commonClass magritteTemplate magritteDescription ]
]
