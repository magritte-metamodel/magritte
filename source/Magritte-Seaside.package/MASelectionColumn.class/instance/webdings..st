private
webdings: aString
	^ [ :html | html span style: 'font-family: Webdings'; with: [ html html: aString ] ]