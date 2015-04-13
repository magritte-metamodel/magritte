private
buildVisitorHierarchyForClass: aClass selector: aBlock classified: aSelector
	" self buildVisitorHierarchyForClass: MADescription selector: [ :class | 'visit' , (class name allButFirst: 2) , ':' ] classified: #'visiting-description' "

	aClass withAllSubclassesDo: [ :class |
		(class category beginsWith: 'Magritte') ifTrue: [
			self
				compile: (String streamContents: [ :stream |
					stream nextPutAll: (aBlock value: class); nextPutAll: ' anObject'; cr.
					class = aClass ifFalse: [
						stream tab; nextPutAll: 'self '; nextPutAll: (aBlock value: class superclass); nextPutAll: ' anObject.' ] ])
				classified: aSelector.
			class
				compile: (String streamContents: [ :stream |
					stream nextPutAll: 'acceptMagritte: aVisitor'; cr.
					stream tab; nextPutAll: 'aVisitor '; nextPutAll: (aBlock value: class); nextPutAll: ' self.' ])
				classified: #visiting ] ]