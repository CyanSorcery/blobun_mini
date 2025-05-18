<?php

//open up the worldpak and parse it
$worldpak = json_decode(file_get_contents('C:/Users/spark/AppData/Local/Blobun/worldpak/usermade/pak_cyansorcery_pico8wp.json'), true);

//$worldpak = json_decode(file_get_contents('C:/Users/spark/AppData/Local/Blobun/worldpak/official2/cyansorcery_base.json'), true);

$worlds 	= [];

function pico_time_format($t) {
	//to correct for precision issues, add a little bit of time
	$t += 0.0011;
	return str_pad(strval(floor($t)), 3, '0',STR_PAD_LEFT).'.'.str_pad(strval(floor(fmod($t,1) * 10000) % 10000),4,'0',STR_PAD_RIGHT);
}

//go through each of the stages in the worldpak and add them to our array
foreach ($worldpak['pak_worlds'] as $world)
{
	$levels = [];
	foreach ($world['world_stages'] as $stage)
	{
		array_push($levels, [
			'w' => $stage['stage_width'],
			'd' => $stage['stage_data'],
			'n' => $stage['stage_name'],
			'a' => $stage['stage_author'],
			'r' => $stage['stage_replay_data'],
			'h' => $stage['stage_hint_count'],
			't' => $stage['stage_target_time'],
			'j' => $stage['stage_dev_time'],
			's' => $stage['stage_id']
		]);
	}
	array_push($worlds, $levels);
}

//Go through each world/stage and add them to the final output
$finstr = "g_cart_name = \"cyansorcery_blobun_wp_pico8\"\r\n";
$finstr .= "g_levels = {\r\n";

$worldcount = count($worlds);

for ($world = 0; $world < $worldcount; $world++)
{
	$finstr .= " {\r\n";

	$stages = $worlds[$world];

	$stagecount = count($stages);

	for ($stage = 0; $stage < $stagecount; $stage++)
	{
		$output_str 	= "";
		$currstage 		= $stages[$stage];

		//The stage name (16 chars max)
		$s_name 		= $currstage['n'];
		$output_str 	.= dechex(strlen($s_name));
		$output_str 	.= strtolower($s_name);
		//The stage author (16 chars max)
		$s_author 		= $currstage['a'];
		$output_str 	.= dechex(strlen($s_author));
		$output_str 	.= strtolower($s_author);
		//The stage save slot (60 max, but could be up to 99 (impossible to track though))
		$output_str 	.= str_pad($currstage['s'], 2, '0',STR_PAD_LEFT);
		//The target time
		$output_str 	.= pico_time_format($currstage['t']);
		//The dev time
		$output_str 	.= pico_time_format($currstage['j']);
		//The stage width (16 tiles max)
		$output_str 	.= dechex($currstage['w']);
		//The hint arrows
		$hint_arrows 	= [];
		$hint_count 	= 0;
		if ($currstage['r'] != "")
		{
			$decode_bin		= base64_decode($currstage['r']);
			$uncompressed	= zlib_decode($decode_bin);
			$strhex 		= bin2hex($uncompressed);
			//How many moves are in this?

			//For whatever reason, Gamemaker stores 16bit values with bits flipped
			//so we have to flip them back
			$move_count 	= hexdec(substr($strhex, 2, 2).substr($strhex, 0, 2));
			$hint_count 	= min($move_count, $currstage['h'], 16);

			//parse the hint arrows. This way we can put *exactly* the hint arrows we need
			$hintstr 	= substr($strhex, 4, strlen($strhex) - 4);
			for ($i = 0; $i < $hint_count; $i++)
			{
				$int	= hexdec(substr($hintstr, $i >> 1, 1));
				$sub 	= ($int >> ($i % 2 == 0 ? 2 : 0)) & 0x3;
				array_push($hint_arrows, $sub);
			}
		}
		//Create a string for the hints
		$hintstr 		= "";
		for ($i = 0; $i < $hint_count; $i += 2)
		{
			$int	= $hint_arrows[$i] << 2;
			if ($i + 1 < $hint_count) $int |= $hint_arrows[$i + 1];
			$hintstr .= dechex($int);
		}
		//How many hints there are (limit 16)
		$output_str 	.= dechex($hint_count);
		//the hint string
		$output_str		.= $hintstr;

		//The actual stage data
		$decode_bin 	= base64_decode($currstage['d']);
		$uncompressed 	= zlib_decode($decode_bin);
		$strhex 		= bin2hex($uncompressed);
		//The amount of tiles (256 max)
		//$output_str 	.= str_pad(dechex(strlen($strhex)), 2, "0", STR_PAD_LEFT);
		//The actual puzzle data
		$output_str		.= $strhex;

		$finstr 	.= "  \"{$output_str}\"";

		if ($stage + 1 < $stagecount)
			$finstr .= ",";

		$finstr .= "\r\n";
	}

	//how do we terminate this?
	if ($world + 1 < $worldcount)
	 $finstr .= " },\r\n";
	else
	 $finstr .= " }\r\n}";
}


file_put_contents('res/r_levels.lua', $finstr);

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
file_put_contents('res/r_tile_lut.lua', $finstr);

?>