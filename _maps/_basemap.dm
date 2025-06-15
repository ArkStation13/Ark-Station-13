//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "ark_map_files\ark_maps\birdshot.dmm" // ARK STATION EDIT | #include "map_files\Birdshot\birdshot.dmm"
		#include "map_files\debug\multiz.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "ark_map_files\ark_maps\DeltaStation2.dmm" // ARK STATION EDIT | #include "map_files\Deltastation\DeltaStation2.dmm"
		#include "ark_map_files\ark_maps\IceBoxStation.dmm" // ARK STATION EDIT | #include "map_files\IceBoxStation\IceBoxStation.dmm"
		#include "ark_map_files\ark_maps\MetaStation.dmm" // ARK STATION EDIT | #include "map_files\MetaStation\MetaStation.dmm"
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\tramstation\tramstation.dmm"
		#include "map_files\CatwalkStation\CatwalkStation_2023.dmm"
		#include "map_files\NebulaStation\NebulaStation.dmm"
		#include "map_files\wawastation\wawastation.dmm"
		// NOVA EDIT ADDITION START - Compiling our modular maps too!
		#include "map_files\VoidRaptor\VoidRaptor.dmm"
		#include "map_files\NSVBlueshift\Blueshift.dmm"
		#include "map_files\Ouroboros\Ouroboros.dmm"
		#include "map_files\SerenityStation\SerenityStation.dmm"
		#include "map_files\Snowglobe\snowglobe.dmm"
		// NOVA EDIT ADDITION END
		// ARK STATION ADDITION START
		#include "ark_map_files\ark_maps\KiloStation2.dmm"
		#include "ark_map_files\ark_maps\PubbyStation.dmm"
		#include "ark_map_files\ark_maps\NSSJourney.dmm"
		//#include "ark_map_files\ark_maps\OmegaStation.dmm" // Временно, на доработке. НЕ ВКЛЮЧАТЬ.
		// ARK STATION ADDITION END
	#endif
	#ifdef ALL_TEMPLATES
		#include "templates.dm"
	#endif
#endif
