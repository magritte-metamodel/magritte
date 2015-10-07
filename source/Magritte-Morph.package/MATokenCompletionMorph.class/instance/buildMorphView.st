private-building
buildMorphView

	^ TokenCollectorMorph new
			hResizing: #spaceFill;
			borderColor: #inset;
			borderWidth: 1;
			options: self options;
			objects: self value copy;
			whenObjectsChanged: [ :e | self value: e ];
			factory: self magritteDescription initializer;
			yourself