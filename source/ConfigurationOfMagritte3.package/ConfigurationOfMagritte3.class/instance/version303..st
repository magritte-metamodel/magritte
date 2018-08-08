versions
version303: spec
	<version: '3.0.3' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0.3:
- updated version 3.0.1:
	More possibilities for labels.'.
		spec author: 'DiegoLont'.
		spec timestamp: '16 January 2014'.
		spec 
			project: 'Grease' with: '1.0.8';
			project: 'Seaside3' with: '3.0.10'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33' ].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].