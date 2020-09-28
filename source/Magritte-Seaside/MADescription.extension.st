Extension { #name : #MADescription }

{ #category : #'*magritte-seaside-accessing' }
MADescription >> componentClass [
	^ self propertyAt: #componentClass ifAbsent: [ self class defaultComponentClass ]
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> componentClass: aClass [
	self propertyAt: #componentClass put: aClass
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> cssClass: aString [
	(self propertyAt: #cssClasses ifAbsentPut: [ self class defaultCssClasses ])
		add: aString
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> cssClasses [
	^ self propertyAt: #cssClasses ifAbsent: [ self class defaultCssClasses ]
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> cssClasses: aCollection [
	self propertyAt: #cssClasses put: aCollection
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> currentCssClasses [
	| classes |
	classes := OrderedCollection withAll: self cssClasses.
	self isReadonly
		ifTrue: [ classes add: 'readonly' ].
	self isRequired
		ifTrue: [ classes add: 'required' ].
	^classes
]

{ #category : #'*magritte-seaside-defaults' }
MADescription class >> defaultComponentClass [
	^ self defaultComponentClasses isEmpty
		ifTrue: [ MAUndefinedComponent ]
		ifFalse: [ self defaultComponentClasses first ]
]

{ #category : #'*magritte-seaside-defaults' }
MADescription class >> defaultComponentClasses [
	^ Array with: MAUndefinedComponent
]

{ #category : #'*magritte-seaside-defaults' }
MADescription class >> defaultCssClasses [
	^ OrderedCollection new
]

{ #category : #'*magritte-seaside-defaults' }
MADescription class >> defaultReportColumnClass [
	^ self defaultReportColumnClasses notEmpty
		ifTrue: [ self defaultReportColumnClasses first ]
]

{ #category : #'*magritte-seaside-defaults' }
MADescription class >> defaultReportColumnClasses [
	^ Array with: MADescribedColumn
]

{ #category : #'*magritte-seaside-description' }
MADescription >> descriptionComponentClass [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #componentClass;
		label: 'Component Class';
		reference: MAClassDescription new;
		options: self class defaultComponentClasses;
		default: self class defaultComponentClass;
		priority: 1000;
		yourself
]

{ #category : #'*magritte-seaside-description' }
MADescription >> descriptionReportColumnClass [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #reportColumnClass;
		label: 'Report Column Class';
		priority: 1010;
		reference: MAClassDescription new;
		options: self class defaultReportColumnClasses;
		default: self class defaultReportColumnClass;
		yourself
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> reportColumnClass [
	^ self propertyAt: #reportColumnClass ifAbsent: [ self class defaultReportColumnClass ]
]

{ #category : #'*magritte-seaside-accessing' }
MADescription >> reportColumnClass: aClass [
	self propertyAt: #reportColumnClass put: aClass
]
