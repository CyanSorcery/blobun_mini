<?php

require 'functions.php';
require 'tile_lut.php';

//Get the contents of the given worldpak and convert it to an object
$worldpak 	= json_decode(file_get_contents($argv[1])) or die("Was not able to load file as worldpak: {$argv[1]}");

echo "Preparing to convert worldpak {$argv[1]}...\r\n";

//go through each of the worlds and stages and convert them to the expected format
$minipak 	= [];
$stage_count	= 0;
$world_count	= 0;

//Set up all the save slots so we can validate if any of them are reused or not
$save_slots	= array_fill(0, 60, false);

if (count($worldpak->pak_worlds) > 5) die('The given worldpak has too many worlds! The limit is 5.');

foreach ($worldpak->pak_worlds as $world)
{
	$miniworld	= [];

	foreach ($world->world_stages as $stage)
	{
		if ($stage_count >= 60) die('Too many stages in the given worldpak! The limit is 60.');
		if ($stage->stage_width > 16 || $stage->stage_height > 14) die("Stage {$stage->stage_name} is too large! Must be 16x14 or less.");

		//Figure out the save ID and if this save is already in use or not
		$save_id 	= clamp($stage->stage_id, 0, 59);
		if ($save_slots[$save_id] == true) die("Stage {$stage->stage_name} uses save slot {$save_id} which is already in use!");
		$save_slots[$save_id]	= true;

		$ministage = '';
		//Stage name
		$ministage .= pico_label($stage->stage_name);
		//Stage author
		$ministage .= pico_label($stage->stage_author);
		//Stage width (minus 1)
		$ministage .= dechex(clamp($stage->stage_width - 1, 0, 15));
		//Stage save slot
		$ministage .= str_pad($save_id, 2, "0", STR_PAD_LEFT);
		//The stage target time
		$ministage .= pico_time_format($stage->stage_target_time);
		//The stage dev time
		$ministage .= pico_time_format($stage->stage_dev_time);
		//The hint arrow data
		$ministage .= pico_hint_arrows($stage->stage_replay_data);

		//Get the packed tilemap for this stage
		$packed_tilemap 	= pico_puzzle_data($stage);

		array_push($miniworld, ['s_info' => $ministage, 's_tilemap' => $packed_tilemap]);

		if ($stage->stage_name == 'TEST STAGE!')
			file_put_contents('map.txt', $packed_tilemap);

		//print("$ministage\r\n");
		$stage_count++;
	}
	array_push($minipak, $ministage);
	$world_count++;
}
echo "Converted {$stage_count} stage(s) across {$world_count} world(s).\r\n";

?>