"
I am a description of an one-to-one relationship.
"
Class {
	#name : #MAToOneRelationDescription,
	#superclass : #MARelationDescription,
	#category : 'Magritte-Model-Description'
}

{ #category : #testing }
MAToOneRelationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAToOneRelationDescription class >> label [
	^ '1:1 Relation'
]

{ #category : #visiting }
MAToOneRelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitToOneRelationDescription: self
]

{ #category : #validating }
MAToOneRelationDescription >> validateKind: anObject [
	super validateKind: anObject.
	(self classes anySatisfy: [ :class | anObject species includesBehavior: class ])
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]
]
