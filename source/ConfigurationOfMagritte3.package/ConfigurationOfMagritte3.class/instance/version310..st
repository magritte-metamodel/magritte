versions
version310: spec
	<version: '3.1' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		
		spec description: 'initial enhancement of Morphic implementation to bring on par with the Seaside one'.
		spec author: 'SeanDeNigris'.
		spec timestamp: '11 June 2013 8:13 am'.
		
		spec 
			project: 'Grease' with: #'stable';
			project: 'Seaside30' with: #'stable'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-SeanDeNigris.432';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-NickAger.26';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'pharo' do: [
		spec 
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26';
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.68';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].