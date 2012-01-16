private
updateScript
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'document.getElementById('; print: self id , 'v';
			nextPutAll: ').innerHTML = document.getElementById('; print: self id;
			nextPutAll: ').value * ('; print: self range;
			nextPutAll: ') / 100 + ('; print: self min;
			nextPutAll: ');' ]