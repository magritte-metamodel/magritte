"
A simple modle of a person.
"
Class {
	#name : 'CMPerson',
	#superclass : 'Object',
	#instVars : [
		'title',
		'firstName',
		'lastName',
		'email',
		'homeAddress',
		'officeAddress',
		'picture',
		'birthday',
		'phones',
		'password'
	],
	#category : 'Magritte-ContactManager'
}

{ #category : 'comparing' }
CMPerson >> = anObject [
	^ self species = anObject species
		and: [ self title = anObject title
		and: [ self firstName = anObject firstName
		and: [ self lastName = anObject lastName
		and: [ self picture = anObject picture
		and: [ self birthday = anObject birthday
		and: [ self officeAddress = anObject officeAddress
		and: [ self homeAddress = anObject homeAddress ] ] ] ] ] ] ]
]

{ #category : 'accessing-calculated' }
CMPerson >> age [
	^ self birthday notNil
		ifTrue: [ Date current year - self birthday year ]
]

{ #category : 'accessing' }
CMPerson >> birthday [
	^ birthday
]

{ #category : 'accessing' }
CMPerson >> birthday: anObject [
	birthday := anObject
]

{ #category : 'descriptions' }
CMPerson >> descriptionAge [
	<magritteDescription>
	 ^ MANumberDescription new
		selectorAccessor: #age;
		label: 'Age';
		priority: 80;
		beReadonly;
		yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionBirthday [
	<magritteDescription>
	^ MADateDescription new
		accessor: #birthday;
		label: 'Birthday';
		priority: 70;
		yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionFirstName [
	<magritteDescription>
	
	^ MAStringDescription new
			accessor: #firstName;
			label: 'First Name';
			priority: 20;
			beRequired;
			yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionHomeAddress [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			componentClass: MAInternalEditorComponent;
			classes: (Array with: CMAddress);
			accessor: #homeAddress;
			label: 'Home Address';
			priority: 40;
			yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionLastName [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #lastName;
		label: 'Last Name';
		priority: 30;
		beRequired;
		yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionOfficeAddress [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			componentClass: MAExternalEditorComponent;
			classes: (Array with: CMAddress);
			accessor: #officeAddress;
			label: 'Office Address';
			priority: 50;
			yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionPassword [
	<magritteDescription>
	
	^ MAPasswordDescription new
			componentClass: MAVerifiedPasswordComponent;
			accessor: #password;
			label: 'Password';
			priority: 100;
			yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionPhoneNumbers [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		classes: (Array with: CMPhone);
		label: 'Phone Numbers';
		default: Array new;
		accessor: #phones;
		priority: 90;
		yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionPicture [
	<magritteDescription>
	
	^ MAFileDescription new
		addCondition: [ :value | value isImage ] labelled: 'Image expected';
		accessor: #picture;
		label: 'Picture';
		priority: 60;
		yourself
]

{ #category : 'descriptions' }
CMPerson >> descriptionTitle [
	<magritteDescription>
	
	^ MASingleOptionDescription new
			options: #( 'Mr.' 'Mrs.' 'Ms.' 'Miss.' );
			accessor: #title;
			label: 'Title';
			priority: 10;
			yourself
]

{ #category : 'accessing' }
CMPerson >> email [
	^ email
]

{ #category : 'accessing' }
CMPerson >> email: anObject [
	email := anObject
]

{ #category : 'accessing' }
CMPerson >> firstName [
	^ firstName
]

{ #category : 'accessing' }
CMPerson >> firstName: anObject [
	firstName := anObject
]

{ #category : 'comparing' }
CMPerson >> hash [
	^ self firstName hash bitXor: self lastName hash
]

{ #category : 'accessing' }
CMPerson >> homeAddress [
	^ homeAddress
]

{ #category : 'accessing' }
CMPerson >> homeAddress: anObject [
	homeAddress := anObject
]

{ #category : 'accessing' }
CMPerson >> lastName [
	^ lastName
]

{ #category : 'accessing' }
CMPerson >> lastName: anObject [
	lastName := anObject
]

{ #category : 'accessing' }
CMPerson >> officeAddress [
	^ officeAddress
]

{ #category : 'accessing' }
CMPerson >> officeAddress: anObject [
	officeAddress := anObject
]

{ #category : 'accessing' }
CMPerson >> password [
	^ password
]

{ #category : 'accessing' }
CMPerson >> password: aString [
	password := aString
]

{ #category : 'accessing' }
CMPerson >> phones [
	^ phones
]

{ #category : 'accessing' }
CMPerson >> phones: anObject [
	phones := anObject
]

{ #category : 'accessing' }
CMPerson >> picture [
	^ picture
]

{ #category : 'accessing' }
CMPerson >> picture: anObject [
	picture := anObject
]

{ #category : 'accessing' }
CMPerson >> title [
	^ title
]

{ #category : 'accessing' }
CMPerson >> title: anObject [
	title := anObject
]
