private
buildDescriptions: anObject
	^((Pragma 
		allNamed: self class descriptionPragma 
		from: anObject theMetaClass
		to: Object theMetaClass) 
		collect: [ :each | each method valueWithReceiver: anObject arguments: #() ])
		select: #notNil.