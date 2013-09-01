versions
version310: spec
	<version: '3.1' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		
		spec description: 'initial enhancement of Morphic implementation to bring on par with the Seaside one.
			Updated configuration to use Seaside3'.
		spec author: 'DiegoLont'.
		spec timestamp: '22 July 2013 8:13 am'.
		
		spec
			project: 'Grease' with: '1.1.2';
			project: 'Seaside3' with: '3.1.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-SeanDeNigris.433';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.29';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'pharo' do: [
		spec 
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.27';
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	
	spec for: #(#'pharo2.x' #'pharo3.x') do: [ 
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33'].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].