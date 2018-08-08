comparing
= anObject
	^ self species = anObject species
		and: [ self title = anObject title
		and: [ self firstName = anObject firstName
		and: [ self lastName = anObject lastName
		and: [ self picture = anObject picture
		and: [ self birthday = anObject birthday
		and: [ self officeAddress = anObject officeAddress
		and: [ self homeAddress = anObject homeAddress ] ] ] ] ] ] ]