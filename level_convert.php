<?php

//open up the worldpak and parse it
$worldpak = json_decode(file_get_contents('C:/Users/spark/AppData/Local/Blobun/worldpak/usermade/pak_cyansorcery_pico8wp.json'), true);

$levels 	= [];

//go through each of the stages in the worldpak and add them to our array
foreach ($worldpak['pak_worlds'][0]['world_stages'] as $stage)
{
	array_push($levels, [
		'w' => $stage['stage_width'],
		'd' => $stage['stage_data'],
		'n' => $stage['stage_name']
	]);
}


$arrlen 	= count($levels);

$finstr 	= " g_levels = {\r\n";

for ($i = 0; $i < $arrlen; $i++)
{
	
	$output_str 	= "";

	//The stage name (16 chars max)
	$s_name 		= $levels[$i]['n'];
	$output_str 	.= dechex(strlen($s_name));
	$output_str 	.= strtolower($s_name);
	//The stage width (16 tiles max)
	$output_str 	.= dechex($levels[$i]['w']);

	//The actual stage data
	$decode_bin 	= base64_decode($levels[$i]['d']);
	$uncompressed 	= zlib_decode($decode_bin);
	$strhex 		= bin2hex($uncompressed);
	//The amount of tiles (256 max)
	$output_str 	.= str_pad(dechex(strlen($strhex)), 2, "0", STR_PAD_LEFT);
	//The actual puzzle data
	$output_str		.= $strhex;

	$offset 	= $i + 1;

	$finstr 	.= "  \"{$output_str}\"";

	if ($i + 1 < $arrlen)
		$finstr .= ",";

	$finstr .= "\r\n";
}

$finstr .= " }";

file_put_contents('blobun_mini/blobun_mini_levels.lua', $finstr);

//create lookup table for tile IDs
$max_id = 256;
$lut = array_fill(0, $max_id, 0);
//puzzle blocks
$lut[3] = 19; //hearts
$lut[(1<<5)|3] = 21; //diamonds
$lut[(2<<5)|3] = 23; //triangles
$lut[(3<<5)|3] = 25; //coins
//lowered blocks
$lut[4] = 20; //hearts
$lut[(1<<5)|4] = 22; //diamonds
$lut[(2<<5)|4] = 24; //triangles
$lut[(3<<5)|4] = 26; //coins
//puzzle keys (floor)
$lut[2] = 52; //hearts
$lut[(1<<5)|2] = 53; //diamonds
$lut[(2<<5)|2] = 54; //triangles
$lut[(3<<5)|2] = 55; //coins
//floor portals
$lut[5] = 56; //red
$lut[(1<<5)|5] = 58; //green
$lut[(2<<5)|5] = 60; //blue
$lut[(3<<5)|5] = 62; //yellow
//conveyer belts
$lut[6] = 112; //east
$lut[(1<<5)|6] = 114; //north
$lut[(2<<5)|6] = 116; //east
$lut[(3<<5)|6] = 118; //south
//states/floor
$lut[8] = 80; //normal
$lut[(1<<5)|8] = 81; //fire
$lut[(2<<5)|8] = 82; //ice
//misc
$lut[41] = 191; //lava
$lut[73] = 207; //water
$lut[105] = 122; //ice
//ice block
$lut[10] = 120;
//octogems
$lut[15] = 56;
$lut[(1<<5)|15] = 57;
$lut[(2<<5)|15] = 58;
$lut[(3<<5)|15] = 59;
$lut[(4<<5)|15] = 60;
$lut[(5<<5)|15] = 61;
$lut[(6<<5)|15] = 62;
$lut[(7<<5)|15] = 63;
//cracked floors
$lut[9] = 124;
//octogem block (raised, lowered)
$lut[(2<<5)|10] = 27;
$lut[(3<<5)|10] = 28;
//generic key
$lut[(1<<5)|12] = 18;
//generic lock
$lut[(4<<5)|10] = 51;
//floor zappers
$lut[(1<<5)|7] = 29; //cyan
$lut[7] = 30; //magenta
$lut[(2<<5)|7] = 31; //yellow
//slime trap
$lut[(4<<5)|9] = 48;
//unused in blobun, but needed for this game
$lut[(5<<5)] = 49;
$lut[(6<<5)] = 50;

//remove the first entry to make them line up with lua tables
array_shift($lut);
$max_id--;

$finstr = " g_tile_lut = \"";
for ($i = 0; $i < $max_id; $i++)
{
	$finstr .= str_pad(dechex($lut[$i]), 2, "0", STR_PAD_LEFT);
}
$finstr .= "\"";
file_put_contents('blobun_mini/blobun_mini_tile_lut.lua', $finstr);

?>