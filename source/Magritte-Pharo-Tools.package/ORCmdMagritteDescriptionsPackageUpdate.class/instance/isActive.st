testing
isActive
	^ super isActive and: [ self currentNode isKindOf: OBClassCategoryNode ]