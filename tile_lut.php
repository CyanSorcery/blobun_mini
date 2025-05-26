<?php

//NOTE: each of these is in the order of top left, top right, bottom left, bottom right

//Start by creating an array of 256 entries with blank tiles
//any unrecognized puzzle elements will be replaced with the trans tile later
$lut_tile	= array_fill(0, 256, null);

//void/empty tile
$lut_tile[0]	= [0, 0, 0, 0];

//blank tile
$lut_tile[puzz_ele_to_bitmask(1, 0)] = puzz_get_mirrored_tile(16);
//second blank tile
$lut_tile[255] = puzz_get_mirrored_tile(17);

//player tile
$lut_tile[puzz_ele_to_bitmask(1, 1)] = puzz_get_full_tile(218);

//Heart (on)
$lut_tile[puzz_ele_to_bitmask(3, 0)] = puzz_get_mirrored_tile(19);
//Heart (off)
$lut_tile[puzz_ele_to_bitmask(4, 0)] = puzz_get_mirrored_tile(20);

//Diamond (on)
$lut_tile[puzz_ele_to_bitmask(3, 1)] = puzz_get_mirrored_tile(21);
//Diamond (off)
$lut_tile[puzz_ele_to_bitmask(4, 1)] = puzz_get_mirrored_tile(22);

//Triangle (on)
$lut_tile[puzz_ele_to_bitmask(3, 2)] = puzz_get_mirrored_tile(23);
//Triangle (off)
$lut_tile[puzz_ele_to_bitmask(4, 2)] = puzz_get_mirrored_tile(24);

//Coin (on)
$lut_tile[puzz_ele_to_bitmask(3, 3)] = puzz_get_mirrored_tile(25);
//Coin (off)
$lut_tile[puzz_ele_to_bitmask(4, 3)] = puzz_get_mirrored_tile(26);

//Octoblock (on)
$lut_tile[puzz_ele_to_bitmask(10, 2)] = puzz_get_mirrored_tile(27);
//Octoblock (off)
$lut_tile[puzz_ele_to_bitmask(10, 3)] = puzz_get_mirrored_tile(28);

//Zapper (cyan)
$lut_tile[puzz_ele_to_bitmask(7, 1)] = puzz_get_mirrored_tile(29);
//Zapper (magenta)
$lut_tile[puzz_ele_to_bitmask(7, 0)] = puzz_get_mirrored_tile(30);
//Zapper (yellow)
$lut_tile[puzz_ele_to_bitmask(7, 2)] = puzz_get_mirrored_tile(31);

//Slime trap
$lut_tile[puzz_ele_to_bitmask(9, 4)] = puzz_get_mirrored_tile(48);

//Generic lock block
$lut_tile[puzz_ele_to_bitmask(10, 4)] = puzz_get_mirrored_tile(51);
//Generic key
$lut_tile[puzz_ele_to_bitmask(12, 1)] = puzz_get_mirrored_tile(18);

//Heart key
$lut_tile[puzz_ele_to_bitmask(2, 0)] = puzz_get_mirrored_tile(52);
//Diamond key
$lut_tile[puzz_ele_to_bitmask(2, 1)] = puzz_get_mirrored_tile(53);
//Triangle key
$lut_tile[puzz_ele_to_bitmask(2, 2)] = puzz_get_mirrored_tile(54);
//Coin key
$lut_tile[puzz_ele_to_bitmask(2, 3)] = puzz_get_mirrored_tile(55);

//Octogems
$lut_tile[puzz_ele_to_bitmask(15, 0)] = puzz_get_mirrored_tile(56);
$lut_tile[puzz_ele_to_bitmask(15, 1)] = puzz_get_mirrored_tile(57);
$lut_tile[puzz_ele_to_bitmask(15, 2)] = puzz_get_mirrored_tile(58);
$lut_tile[puzz_ele_to_bitmask(15, 3)] = puzz_get_mirrored_tile(59);
$lut_tile[puzz_ele_to_bitmask(15, 4)] = puzz_get_mirrored_tile(60);
$lut_tile[puzz_ele_to_bitmask(15, 5)] = puzz_get_mirrored_tile(61);
$lut_tile[puzz_ele_to_bitmask(15, 6)] = puzz_get_mirrored_tile(62);
$lut_tile[puzz_ele_to_bitmask(15, 7)] = puzz_get_mirrored_tile(63);

//Normal state
$lut_tile[puzz_ele_to_bitmask(8, 0)] = puzz_get_mirrored_tile(80);
//Fire state
$lut_tile[puzz_ele_to_bitmask(8, 1)] = puzz_get_mirrored_tile(81);
//Ice state
$lut_tile[puzz_ele_to_bitmask(8, 2)] = puzz_get_mirrored_tile(82);

//Red portal
$lut_tile[puzz_ele_to_bitmask(5, 0)] = puzz_get_full_tile(88);
//Green portal
$lut_tile[puzz_ele_to_bitmask(5, 1)] = puzz_get_full_tile(90);
//Blue portal
$lut_tile[puzz_ele_to_bitmask(5, 2)] = puzz_get_full_tile(92);
//Yellow portal
$lut_tile[puzz_ele_to_bitmask(5, 3)] = puzz_get_full_tile(94);

//Conveyer east
$lut_tile[puzz_ele_to_bitmask(6, 0)] = puzz_get_full_tile(112);
//Conveyer north
$lut_tile[puzz_ele_to_bitmask(6, 1)] = puzz_get_full_tile(114);
//Conveyer west
$lut_tile[puzz_ele_to_bitmask(6, 2)] = puzz_get_full_tile(116);
//Conveyer south
$lut_tile[puzz_ele_to_bitmask(6, 3)] = puzz_get_full_tile(118);

//Ice block
$lut_tile[puzz_ele_to_bitmask(10, 0)] = puzz_get_full_tile(120);

//Ice floor
$lut_tile[puzz_ele_to_bitmask(9, 3)] = puzz_get_full_tile(122);

//Cracked floor
$lut_tile[puzz_ele_to_bitmask(9, 0)] = puzz_get_full_tile(124);

//Lava floor
$lut_tile[puzz_ele_to_bitmask(9, 1)] = puzz_get_single_tile(191);
//Water tile
$lut_tile[puzz_ele_to_bitmask(9, 2)] = puzz_get_single_tile(207);

//Slime tile (normal)
$lut_tile[240] = puzz_get_full_tile(218);
//Slime tile (fire)
$lut_tile[241] = puzz_get_full_tile(220);
//Slime tile (ice)
$lut_tile[242] = puzz_get_full_tile(222);

//Cracked floor (alternate)
$lut_tile[254] = puzz_get_full_tile(126);

//Closed slime trap
$lut_tile[253] = puzz_get_mirrored_tile(49);

//pit
$lut_tile[252] = puzz_get_mirrored_tile(50);

/*
//Metatile lookup from Blobun
$lut_metatile = [
	18450, 18450, 18582, 18582, 18450, 18450, 18582, 18582,
	51219, 51219, 51351, 51359, 51219, 51219, 51351, 51359,
	19506, 19506, 19638, 19638, 19506, 19506, 19702, 19702,
	52275, 52275, 52407, 52415, 52275, 52275, 52471, 52479,
	18450, 18450, 18582, 18582, 18450, 18450, 18582, 18582,
	51219, 51219, 51351, 51359, 51219, 51219, 51351, 51359,
	19506, 19506, 19638, 19638, 19506, 19506, 19702, 19702,
	52275, 52275, 52407, 52415, 52275, 52275, 52471, 52479,
	26898, 26898, 27030, 27030, 26898, 26898, 27030, 27030,
	59667, 59667, 59799, 59807, 59667, 59667, 59799, 59807,
	27954, 27954, 28086, 28086, 27954, 27954, 28150, 28150,
	60723, 60723, 60855, 60863, 60723, 60723, 60919, 60927,
	26898, 26898, 27030, 27030, 26898, 26898, 27030, 27030,
	63763, 63763, 63895, 63903, 63763, 63763, 63895, 63903,
	27954, 27954, 28086, 28086, 27954, 27954, 28150, 28150,
	64819, 64819, 64951, 64959, 64819, 64819, 65015, 65023,
	18450, 18450, 18582, 18582, 18450, 18450, 18582, 18582,
	51219, 51219, 51351, 51359, 51219, 51219, 51351, 51359,
	19506, 19506, 19638, 19638, 19506, 19506, 19702, 19702,
	52275, 52275, 52407, 52415, 52275, 52275, 52471, 52479,
	18450, 18450, 18582, 18582, 18450, 18450, 18582, 18582,
	51219, 51219, 51351, 51359, 51219, 51219, 51351, 51359,
	19506, 19506, 19638, 19638, 19506, 19506, 19702, 19702,
	52275, 52275, 52407, 52415, 52275, 52275, 52471, 52479,
	26898, 26898, 27030, 27030, 26898, 26898, 27030, 27030,
	59667, 59667, 59799, 59807, 59667, 59667, 59799, 59807,
	28466, 28466, 28598, 28598, 28466, 28466, 28662, 28662,
	61235, 61235, 61367, 61375, 61235, 61235, 61431, 61439,
	26898, 26898, 27030, 27030, 26898, 26898, 27030, 27030,
	63763, 63763, 63895, 63903, 63763, 63763, 63895, 63903,
	28466, 28466, 28598, 28598, 28466, 28466, 28662, 28662,
	65331, 65331, 65463, 65471, 65331, 65331, 65527, 65535
];

//conversion format for the above table to this game's format
$tmp_indices = [];
$tmp_tile_arr = [];
foreach ($lut_metatile as $metatile)
{
	//If the above doesn't have the index yet, create it, then unpack
	//it into the tile format for this game
	if (array_search($metatile, $tmp_indices) === false)
	{
		array_push($tmp_indices, $metatile);
		$tmp_tile_arr[count($tmp_indices) - 1] = [
			$metatile & 0xF,
			($metatile >> 4) & 0xF,
			($metatile >> 8) & 0xF,
			($metatile >> 12) & 0xF
		];
	}
}
//Now that we have the indices, replace them in the above table
$arrlen	= count($lut_metatile);
for ($i = 0; $i < $arrlen; $i++)
	$lut_metatile[$i]	= array_search($lut_metatile[$i], $tmp_indices);

//Now, we should have a table for all the possible blob wang lookup values
//and the corresponding tile values we can retrieve to put on the map
echo '[';
for ($i = 0; $i < 256; $i++)
	echo "{$lut_metatile[$i]},".($i % 8 == 7 ? "\r\n" : '');
echo "]\r\n[";
$arrlen = count($tmp_tile_arr);
for ($i = 0; $i < $arrlen; $i++)
	echo "[{$tmp_tile_arr[$i][0]}, {$tmp_tile_arr[$i][1]}, {$tmp_tile_arr[$i][3]}, {$tmp_tile_arr[$i][2]}],".($i % 8 == 7 ? "\r\n" : '');
echo "]\r\n";
*/

//Indices for the tile lookup table below
$lut_blob_wang_indices	= [
	0,0,1,1,0,0,1,1,       
	2,2,3,4,2,2,3,4,        
	5,5,6,6,5,5,7,7,        
	8,8,9,10,8,8,11,12,     
	0,0,1,1,0,0,1,1,        
	2,2,3,4,2,2,3,4,        
	5,5,6,6,5,5,7,7,        
	8,8,9,10,8,8,11,12,     
	13,13,14,14,13,13,14,14,
	15,15,16,17,15,15,16,17,
	18,18,19,19,18,18,20,20,
	21,21,22,23,21,21,24,25,
	13,13,14,14,13,13,14,14,
	26,26,27,28,26,26,27,28,
	18,18,19,19,18,18,20,20,
	29,29,30,31,29,29,32,33,
	0,0,1,1,0,0,1,1,
	2,2,3,4,2,2,3,4,
	5,5,6,6,5,5,7,7,
	8,8,9,10,8,8,11,12,
	0,0,1,1,0,0,1,1,
	2,2,3,4,2,2,3,4,
	5,5,6,6,5,5,7,7,
	8,8,9,10,8,8,11,12,
	13,13,14,14,13,13,14,14,
	15,15,16,17,15,15,16,17,
	34,34,35,35,34,34,36,36,
	37,37,38,39,37,37,40,41,
	13,13,14,14,13,13,14,14,
	26,26,27,28,26,26,27,28,
	34,34,35,35,34,34,36,36,
	42,42,43,44,42,42,45,46,
];
//Tile lookups for the table above
$lut_blob_wang_tiles = [[2, 1, 4, 8],[6, 9, 4, 8],[3, 1, 12, 8],[7, 9, 12, 8],[15, 9, 12, 8],[2, 3, 4, 12],[6, 11, 4, 12],[6, 15, 4, 12],
[3, 3, 12, 12],[7, 11, 12, 12],[15, 11, 12, 12],[7, 15, 12, 12],[15, 15, 12, 12],[2, 1, 6, 9],[6, 9, 6, 9],[3, 1, 14, 9],
[7, 9, 14, 9],[15, 9, 14, 9],[2, 3, 6, 13],[6, 11, 6, 13],[6, 15, 6, 13],[3, 3, 14, 13],[7, 11, 14, 13],[15, 11, 14, 13],
[7, 15, 14, 13],[15, 15, 14, 13],[3, 1, 15, 9],[7, 9, 15, 9],[15, 9, 15, 9],[3, 3, 15, 13],[7, 11, 15, 13],[15, 11, 15, 13],
[7, 15, 15, 13],[15, 15, 15, 13],[2, 3, 6, 15],[6, 11, 6, 15],[6, 15, 6, 15],[3, 3, 14, 15],[7, 11, 14, 15],[15, 11, 14, 15],
[7, 15, 14, 15],[15, 15, 14, 15],[3, 3, 15, 15],[7, 11, 15, 15],[15, 11, 15, 15],[7, 15, 15, 15],[15, 15, 15, 15]];

//This takes all the metatiles and maps them into the tile LUT using the given table
//if $clear_15th is set, the 15th tile is replaced with 0
function add_metaremaps_to_tile_lut(&$lut_tile, $metaremap, $lut_bw, $clear_15th, $add_val = 0, $do_water_lava_tile = false)
{
	//first, do any necessary modification to the given values
	$arrlen 	= count($lut_bw);
	for ($i = 0; $i < $arrlen; $i++)
		for ($j = 0; $j < 4; $j++)
		{
			//if we're to clear out the 15th tile, or are applying the lava/water grid, do this
			if ($clear_15th || ($do_water_lava_tile && $j == 3))
				if ($lut_bw[$i][$j] == 15)
					$lut_bw[$i][$j] = 0;
			
			$lut_bw[$i][$j]	+= $add_val;
		}

	$arrlen	= count($metaremap);

	for ($i = 0; $i < $arrlen; $i++)
		$lut_tile[$metaremap[$i]] = $lut_bw[$i];
}

//this remaps the tiles above to generate walls
$lut_metaremap_walls 	=
[11,12,13,14,16,17,18,19,
20,21,22,23,24,25,26,27,
28,29,30,31,32,42,43,45,
46,48,49,50,51,52,53,54,
55,56,57,58,59,60,61,62,
63,64,65,75,76,77,78];

//this remaps to generate lava tiles
$lut_metaremap_lava 	= 
[80,81,82,83,84,85,86,87,
88,89,90,91,92,93,94,95,
96,97,103,104,107,108,109,110,
112,113,114,115,116,117,118,119,
120,121,122,123,124,125,126,127,
128,129,130,131,132,133,134];

//this remaps to generate water tiles
$lut_metaremap_water 	= [135,136,139,140,141,142,144,145,
146,147,148,149,150,151,152,153,
154,155,156,157,158,159,160,161,
162,163,164,165,166,167,168,169,
170,171,172,173,174,176,177,178,
179,180,181,182,183,184,185];

//Add the walls into the lookup table
add_metaremaps_to_tile_lut($lut_tile, $lut_metaremap_walls, $lut_blob_wang_tiles, true);
add_metaremaps_to_tile_lut($lut_tile, $lut_metaremap_lava, $lut_blob_wang_tiles, false, 176, true);
add_metaremaps_to_tile_lut($lut_tile, $lut_metaremap_water, $lut_blob_wang_tiles, false, 192, true);


//Output the first 47 blank tile indices
/*$blank_tiles 	= [];
for ($i = 0; $i < 256; $i++)
	if ($lut_tile[$i] === null)
		if (count($blank_tiles) < 47)
			array_push($blank_tiles, $i);
$arrlen 	= count($blank_tiles);
echo '[';
for ($i = 0; $i < $arrlen; $i++)
	echo "{$blank_tiles[$i]},".($i % 8 == 7 ? "\r\n" : '');
echo "]\r\n";*/

//Fill out any of the remaining tiles with a blank tile set
$dummy_arr 	= puzz_get_single_tile(15);
for ($i = 0; $i < 256; $i++)
	if ($lut_tile[$i] === null)
		$lut_tile[$i] = $dummy_arr;

?>