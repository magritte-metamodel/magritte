descriptions
descriptionCanton
	<magritteDescription>
	
	^ MASingleOptionDescription new
		options: #( 'Zurich' 'Bern' 'Luzern' 'Uri' 'Schwyz' 'Unterwalden' 'Glarus' 'Zug' 'Freiburg' 'Solothurn' 'Basel' 'Schaffhausen' 'Appenzell' 'St. Gallen' 'Graubunden' 'Aargau' 'Thurgau' 'Ticino' 'Vaud' 'Valais' 'Neuchatel' 'Geneve' 'Jura' );
		reference: MAStringDescription new;
		accessor: #canton;
		label: 'Canton';
		priority: 40;
		beSorted;
		yourself