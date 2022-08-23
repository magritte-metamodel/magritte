Extension { #name : #SpDatePresenter }

{ #category : #'*Magritte-Morph' }
SpDatePresenter >> whenDateChanged: aBlock [

	self flag:
		'Hotfix for broken Spec2 method. Remove this method and let it be replaced by original Spec2 one once it is fixed in Spec2 and the fix is properly applied in all relevant versions of Pharo. See https://github.com/pharo-spec/Spec/issues/1302'.

	dateModel whenTextChangedDo: [ :newText :oldText | 
		| oldDate |
		oldDate := date.
		date := newText
			        ifNotEmpty: [ Date readFrom: newText readStream ]
			        ifEmpty: [ nil ].
		aBlock cull: date cull: oldDate ]
]
