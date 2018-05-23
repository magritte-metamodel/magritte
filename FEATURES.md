# Merging

## Installation
Load `Margitte-Merging` on top of Magritte default

## Usage

### Automatic Merging
To describe scenarios when a field should be merged automatically, set the `#shouldAutoMergeBlock` property to a condition block. For example, let's say you have a `Name` class with a `#firstName` field, and you want to merge whenever you're changing from an initial to a full first name starting with that letter:
```smalltalk
Name>>#descriptionFirstName
	<magritteDescription>
	^ MAStringDescription new
			accessor: #firstName;
			propertyAt: #shouldAutoMergeBlock put: [ :old :new |
				| oldNoPeriod |
				oldNoPeriod := old trimRight: [ :e | e = $. ].
				oldNoPeriod size = 1 and: [ new beginsWith: oldNoPeriod ] ];
			yourself
```
