private
buildVisitorHierarchyForClass: aClass selector: aBlock classified: aSelector
	" self buildVisitorHierarchyForClass: MADescription selector: [ :class | 'visit' , (class name allButFirst: 2) , ':' ] classified: #'visiting-description' "

	| visitSourceCode acceptSourceCode classesOwnedByMagritte |
	classesOwnedByMagritte := aClass withAllSubclasses select: [ :class | class category beginsWith: 'Magritte' ].
	classesOwnedByMagritte do: [ :class | | visitSelector |
			visitSelector := aBlock value: class.
			visitSourceCode := String streamContents: [ :stream |
					stream nextPutAll: visitSelector; nextPutAll: ' anObject'; cr.
					class = aClass ifFalse: [
						stream tab; nextPutAll: 'self '; nextPutAll: (aBlock value: class superclass); nextPutAll: ' anObject' ] ].
			self compile: visitSourceCode classified: aSelector.
				
			acceptSourceCode := String streamContents: [ :stream |
					stream nextPutAll: 'acceptMagritte: aVisitor'; cr.
					stream tab; nextPutAll: 'aVisitor '; nextPutAll: visitSelector; nextPutAll: ' self' ].
			class compile: acceptSourceCode classified: #visiting ]