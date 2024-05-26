//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom_arkstation_rework.dmm" // ARK STATION EDIT

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Birdshot\birdshot.dmm"
		#include "map_files\debug\multiz.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "ark_map_files\ark_maps\DeltaStation2.dmm"
		#include "ark_map_files\ark_maps\IceBoxStation.dmm"
		#include "ark_map_files\ark_maps\MetaStation.dmm"
		#include "map_files\Mining\Lavaland.dmm"
		#include "ark_map_files\ark_maps\north_star.dmm"
		#include "ark_map_files\ark_maps\tramstation.dmm"
		// NOVA EDIT ADDITON START - Compiling our modular maps too!
		#include "ark_map_files\ark_maps\VoidRaptor.dmm"
		#include "ark_map_files\ark_maps\Blueshift.dmm"
		#include "ark_map_files\ark_maps\Ouroboros.dmm"
		// NOVA EDIT END
		// ARK STATION ADDITION START
		#include "ark_map_files\ark_maps\KiloStation2.dmm"
		#include "ark_map_files\ark_maps\PubbyStation.dmm"
		//#include "ark_map_files\ark_maps\OmegaStation.dmm"
		// ARK STATION ADDITION END
		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
