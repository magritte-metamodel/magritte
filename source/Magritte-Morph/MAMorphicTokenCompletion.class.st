Class {
	#name : #MAMorphicTokenCompletion,
	#superclass : #MAMorphicList,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicTokenCompletion >> buildMorphView [

	self flag: 'Obviously, the inline conditionals are horrifying. I think the nil check will go away if we set a default value'.
	^ TokenCollectorMorph new
			hResizing: #spaceFill;
			vResizing: #rigid;
			borderColor: #inset;
			borderWidth: 1;
			options: self options;
			objects: (self magritteDescription isMultiple
				ifTrue: [ self value copy ]
				ifFalse: [ self value copy ifNotNil: [ :v | { v } ] ifNil: [ OrderedCollection new ] ]);
			whenObjectsChanged: [ :e | 
				self magritteDescription isMultiple
					ifTrue: [ self value: e ]
					ifFalse: [ self value: e first ] ];
			factory: self magritteDescription initializer;
			height: 150;
			yourself
]
