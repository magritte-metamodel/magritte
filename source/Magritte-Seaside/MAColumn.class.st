Class {
	#name : #MAColumn,
	#superclass : #MAObject,
	#instVars : [
		'report',
		'accessor'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #testing }
MAColumn class >> isAbstract [
	^ false
]

{ #category : #'accessing-settings' }
MAColumn >> accessor [
	^ accessor
]

{ #category : #'accessing-settings' }
MAColumn >> accessor: anAccessor [
	"Set the accessor used to get the column value for a given row object."

	accessor := anAccessor asAccessor
]

{ #category : #deprecated }
MAColumn >> cascade: anArray [ 
	self 
		greaseDeprecatedApi: 'MAColumn>>#cascade:'
		details: 'Use MAColumn>>#accessor: instead.'.
	self accessor: anArray
]

{ #category : #accessing }
MAColumn >> column [
	^ self report cache collect: [ :each | self valueFor: each ]
]

{ #category : #'accessing-settings' }
MAColumn >> comment [
	^ self propertyAt: #comment ifAbsent: [ self defaultComment ]
]

{ #category : #'accessing-settings' }
MAColumn >> comment: aString [
	"A descriptive comment of this column."

	self propertyAt: #comment put: aString
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultComment [
	^ nil
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultFilter [
	^ false
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultFooter [
	^ nil
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultFormatter [
	^ MessageSend receiver: self selector: #stringFor:
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultLabel [
	^ self accessor selector asCapitalizedPhrase
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultRenderer [
	^ MessageSend receiver: self selector: #renderCellContent:on:
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultSorter [
	^ [ :a :b | self sort: a and: b ]
]

{ #category : #'accessing-defaults' }
MAColumn >> defaultVisible [
	^ true
]

{ #category : #'acessing-magritte' }
MAColumn >> descriptionComment [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #comment;
		label: 'Comment';
		priority: 200;
		yourself
]

{ #category : #'acessing-magritte' }
MAColumn >> descriptionTitle [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #title;
		label: 'Title';
		priority: 100;
		yourself
]

{ #category : #exporting }
MAColumn >> exportContent: anObject index: aNumber on: aStream [
	| string |
	string := (self formatter value: anObject) collect: [ :char | 
		char isSeparator
			ifTrue: [ Character space ]
			ifFalse: [ char ] ].
	aStream nextPutAll: string
]

{ #category : #exporting }
MAColumn >> exportHeadOn: aStream [
	self label isNil
		ifFalse: [ aStream nextPutAll: self label ]
]

{ #category : #'accessing-settings' }
MAColumn >> filter [
	^ self propertyAt: #filter ifAbsent: [ self defaultFilter ]
]

{ #category : #'accessing-settings' }
MAColumn >> filter: aBoolean [
	"Enable or disable filtering of this column."

	self propertyAt: #filter put: aBoolean
]

{ #category : #private }
MAColumn >> filterBlock [
	^ self 
		propertyAt: #filterValue
		ifPresent: [ :value | [ :row | (self valueFor: row) = value ] ]
]

{ #category : #'accessing-settings' }
MAColumn >> footer [
	^ self propertyAt: #footer ifAbsent: [ self defaultFooter ]
]

{ #category : #'accessing-settings' }
MAColumn >> footer: aBlock [
	"A block that renders the footer of this column."
	
	self propertyAt: #footer put: aBlock
]

{ #category : #deprecated }
MAColumn >> format [
	self 
		greaseDeprecatedApi: 'MAColumn>>#format'
		details: 'Use MAColumn>>#renderer instead.'.
	^ self renderer
]

{ #category : #deprecated }
MAColumn >> format: aBlock [ 
	self 
		greaseDeprecatedApi: 'MAColumn>>#format:'
		details: 'Use MAColumn>>#renderer: instead.'.
	self renderer: aBlock
]

{ #category : #'accessing-settings' }
MAColumn >> formatter [
	^ self propertyAt: #formatter ifAbsent: [ self defaultFormatter ]
]

{ #category : #'accessing-settings' }
MAColumn >> formatter: aBlock [
	"A block that converts the row value to a string."
	
	self propertyAt: #formatter put: aBlock
]

{ #category : #accessing }
MAColumn >> index [
	^ self report columns indexOf: self
]

{ #category : #initialization }
MAColumn >> initialize [
	super initialize.
	self accessor: #yourself
]

{ #category : #testing }
MAColumn >> isFiltered [
	^ self filter
]

{ #category : #testing }
MAColumn >> isReversed [
	^ self report sortReversed
]

{ #category : #testing }
MAColumn >> isSortable [
	^ self report sortEnabled and: [ self sorter notNil ]
]

{ #category : #testing }
MAColumn >> isSorted [
	^ self report sortColumn == self
]

{ #category : #testing }
MAColumn >> isVisible [
	^ self visible
]

{ #category : #'accessing-settings' }
MAColumn >> label [
	^ self propertyAt: #label ifAbsent: [ self defaultLabel ]
]

{ #category : #'accessing-settings' }
MAColumn >> label: aString [
	"The label of this column, also used to toggle the sort order of this column."
	
	self propertyAt: #label put: aString
]

{ #category : #actions }
MAColumn >> refresh [
	self properties removeKey: #uniqueValues ifAbsent: [ ]
]

{ #category : #rendering }
MAColumn >> renderCell: anObject index: anInteger on: html [
	html tableData
		class: self tableDataClass;
		with: [ self renderer valueWithEnoughArguments: (Array with: anObject with: html with: anInteger) ]
]

{ #category : #rendering }
MAColumn >> renderCellContent: anObject on: html [
	html render: (self formatter value: (self valueFor: anObject))
]

{ #category : #rendering }
MAColumn >> renderFilterCellOn: html [
	html tableHeading: [ self renderFilterContentOn: html ]
]

{ #category : #rendering }
MAColumn >> renderFilterContentOn: html [
	self isFiltered 
		ifFalse: [ ^ self ].
	html form style: 'margin: 0; border: 0; padding: 0;'; with: [
		html select
			beOptional;
			onChange: 'submit()';	" this is an deprecated way of doing this ... "
			optionalLabel: '(all)';
			labels: self formatter;
			list: self uniqueValues;
			selected: (self propertyAt: #filterValue ifAbsent: [ nil ]);
			callback: [ :value |
				value isNil
					ifTrue: [ self properties removeKey: #filterValue ifAbsent: [ ] ]
					ifFalse: [ self propertyAt: #filterValue put: value ].
				self report refresh ] ]
]

{ #category : #rendering }
MAColumn >> renderFootCellOn: html [
	html tableData: [ self renderFootContentOn: html ]
]

{ #category : #rendering }
MAColumn >> renderFootContentOn: html [
	html render: self footer
]

{ #category : #rendering }
MAColumn >> renderHeadCellOn: html [
	html tableHeading
		title: self comment;
		class: self sorterStyle;
		class: self tableHeadingClass;
		with: [
			self isSortable
				ifFalse: [ self renderHeadContentOn: html ]
				ifTrue: [
					html anchor
	 					callback: [ self report sort: self ];
						with: [ self renderHeadContentOn: html ] ] ]
]

{ #category : #rendering }
MAColumn >> renderHeadContentOn: html [
	html render: self label
]

{ #category : #'accessing-settings' }
MAColumn >> renderer [
	^ self propertyAt: #renderer ifAbsent: [ self defaultRenderer ]
]

{ #category : #'accessing-settings' }
MAColumn >> renderer: aBlock [
	"A block that renders the row value to HTML."

	self propertyAt: #renderer put: aBlock
]

{ #category : #accessing }
MAColumn >> report [
	^ report
]

{ #category : #deprecated }
MAColumn >> selector: aSymbol [ 
	self 
		greaseDeprecatedApi: 'MAColumn>>#selector:'
		details: 'Use MAColumn>>#accessor: instead.'.
	self accessor: aSymbol
]

{ #category : #initialization }
MAColumn >> setReport: aReport [
	report := aReport
]

{ #category : #private }
MAColumn >> sort: aFirstObject and: aSecondObject [
	| one two |
	one := self valueFor: aFirstObject.
	two := self valueFor: aSecondObject.
	(one respondsTo: #<=) ifFalse: [
		one := self formatter value: one.
		two := self formatter value: two ].
	^ one <= two
]

{ #category : #private }
MAColumn >> sortRows: aCollection [
	| result |
	result := SortedCollection new: aCollection size.
	result
		sortBlock: self sorter;
		addAll: aCollection.
	^ self isReversed
		ifFalse: [ result ]
		ifTrue: [ result reverse ]
]

{ #category : #'accessing-settings' }
MAColumn >> sorter [
	^ self propertyAt: #sorter ifAbsent: [ self defaultSorter ]
]

{ #category : #'accessing-settings' }
MAColumn >> sorter: aBlock [
	"A sort block for this column."

	self propertyAt: #sorter put: aBlock
]

{ #category : #accessing }
MAColumn >> sorterStyle [
	^ self isSorted
		ifTrue: [
			self isReversed
				ifTrue: [ self report sorterStyles second ]
				ifFalse: [ self report sorterStyles first ] ]
		ifFalse: [ String new ]
]

{ #category : #private }
MAColumn >> stringFor: anObject [ 
	"Answer a string representation of the row value."
	^ anObject greaseString
]

{ #category : #accessing }
MAColumn >> tableDataClass [
	^ nil
]

{ #category : #accessing }
MAColumn >> tableHeadingClass [
	^ nil
]

{ #category : #deprecated }
MAColumn >> title [
	self 
		greaseDeprecatedApi: 'MAColumn>>#title'
		details: 'Use MAColumn>>#label instead.'.
	^ self label
]

{ #category : #deprecated }
MAColumn >> title: aString [ 
	self 
		greaseDeprecatedApi: 'MAColumn>>#title:'
		details: 'Use MAColumn>>#label: instead.'.
	self label: aString
]

{ #category : #private }
MAColumn >> uniqueValues [
	"Answer the unique rows with the unique values, used for filtering."

	^ self propertyAt: #uniqueValues ifAbsentPut: [
		| uniqueValues |
		uniqueValues := Dictionary new.
		self report rows
			do: [ :row | uniqueValues at: (self valueFor: row) put: row ].
		uniqueValues := uniqueValues values asArray.
		self sorter isNil
			ifFalse: [ uniqueValues sort: self sorter ].
		uniqueValues
			collect: [ :row | self valueFor: row ] ]
]

{ #category : #actions }
MAColumn >> valueFor: aRow [
	"Answer the column value for aRow."

	^ accessor read: aRow
]

{ #category : #'accessing-settings' }
MAColumn >> visible [
	^ self propertyAt: #visible ifAbsent: [ self defaultVisible ]
]

{ #category : #'accessing-settings' }
MAColumn >> visible: aBoolean [
	"Make this column visible or invisible."
	
	self propertyAt: #visible put: aBoolean
]
