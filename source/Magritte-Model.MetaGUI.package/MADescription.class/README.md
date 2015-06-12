I am the root of the description hierarchy in Magritte and I provide most of the basic properties available to all descriptions. If you would like to annotate your model with a description have a look at the different subclasses of myself.

!Example
If your model has an instance variable called ==title== that should be used to store the title of the object, you could add the following description to your class:

=Document class>>descriptionTitle
=	^ MAStringDescription new
=		autoAccessor: #title;
=		label: 'Title';
=		priority: 20;
=		beRequired;
=		yourself.

The selector ==#title== is the name of the accessor method used by Magritte to retrieve the value from the model. In the above case Magritte creates the accessor method and the instance variable automatically, if necessary. The label is used to give the field a name and will be printed next to the input box if a visual GUI is created from this description.

The write-accessor is automatically deduced by adding a colon to the read-selector, in this example ==#title:==. You can specify your own accessor strategy using one of the subclasses of ==*MAAccessor*==. If you have multiple description within the same object, the ==#priority:== field is used to order them. Assign a low priority to have descriptions traversed first.