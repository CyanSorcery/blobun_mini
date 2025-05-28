<?php

//pico 8 conversion functions

function pico_time_format($t) {
	//to correct for precision issues, add a little bit of time
	$t += 0.0011;
	return str_pad(strval(floor($t)), 3, '0',STR_PAD_LEFT).'.'.str_pad(strval(floor(fmod($t,1) * 10000) % 10000),4,'0',STR_PAD_RIGHT);
}

function pico_label($str)
{
	//NOTE: This doesn't currently convert out of bounds characters to ascii
	//first, limit this to 16 characters
	$str = substr(strtolower($str), 0, min(16, strlen($str)));
	//If the string is empty, put something here
	if (empty($str)) $str = 'unset';

	//Return how many bytes this is (minus 1, as it should always have at least one byte)
	//and then the appended string
	return dechex(strlen($str) - 1).$str;
}

function pico_hint_arrows($stage, $start_x, $start_y)
{
	//if there's no hints, just return 0
	if ($stage->stage_replay_data == '') return '0';

	$decode_bin		= base64_decode($stage->stage_replay_data);
	$uncompressed	= zlib_decode($decode_bin);
	$strhex 		= bin2hex($uncompressed);

	//For whatever reason, Gamemaker stores 16bit values with bits flipped
	//so we have to flip them back
	$move_count 	= hexdec(substr($strhex, 2, 2).substr($strhex, 0, 2));
	$hint_count 	= min($move_count, $stage->stage_hint_count, 15);
	
	//flip this so that the replay moves can be in the right order
	//ashe note: this code is scuffed but it's not my job to figure this out fancy like. it works
	$flipprep = unpack('C*', pack('h*', $strhex));
	$strhex		= '';
	foreach ($flipprep as $int) $strhex .= str_pad(dechex($int), 2, "0", STR_PAD_LEFT);

	//parse the hint arrows. This way we can put *exactly* the hint arrows we need
	$hintstr 	= substr($strhex, 4, strlen($strhex) - 4);
	$hint_arrows 	= [];
	for ($i = 0; $i < $hint_count; $i++)
	{
		$int	= hexdec(substr($hintstr, $i >> 1, 1));
		$sub 	= ($int >> ($i % 2 == 0 ? 2 : 0)) & 0x3;
		array_push($hint_arrows, $sub);
	}

	//Now that we have our hints, go ahead and make a string of them
	$finstr 	= dechex(count($hint_arrows));
	foreach ($hint_arrows as $dir)
	{
		//Format is DXY - Direction, X, Y
		$finstr 	.= $dir.dechex($start_x).dechex($start_y);
		$start_x 	+= round(cos(deg2rad($dir * 90)));
		$start_y 	-= round(sin(deg2rad($dir * 90)));
	}

	return $finstr;

}

function pico_puzzle_data($stage)
{
	global $lut_metaremap_walls, $lut_blob_wang_indices;
	global $lut_metaremap_lava, $lut_metaremap_water;

	//First, unpack the stage data
	$stage_data 	= bin2hex(zlib_decode(base64_decode($stage->stage_data)));

	$puzz_w 	= $stage->stage_width;
	$puzz_h 	= $stage->stage_height;

	//Create an array to hold object data
	//This creates a default Stephanie that is overwritten later
	$obj_arr 	= ['00000'];
	//Player start coordinates
	$player_start_x 	= 0;
	$player_start_y 	= 0;
	//This array holds floor portals we found previously (or null if not found)
	//Order is RGBY
	$floor_portals = [null, null, null, null];

	//Create a grid to hold the puzzle elements, with padding to hold the borders
	$ele_grid 	= grid_create($puzz_w + 2, $puzz_h + 2, 0);
	//Fill the element grid with values from the stage data
	$len 	= strlen($stage_data);
	//How many tiles the player has to touch
	$tile_count 	= 0;
	for ($i = 0; $i < $len; $i += 2)
	{
		$fin_i 	= $i / 2;

		$tile_id	= hexdec(substr($stage_data, $i, 2));
		$dst_x		= ($fin_i % $puzz_w);
		$dst_y 		= floor($fin_i / $puzz_w);
		$poskey 	= dechex($dst_x).dechex($dst_y);
		$ele_id 	= $tile_id & 0x1F;
		$sub_id 	= ($tile_id >> 5) & 0x7;
		//Stephanie (overwrite the first entry if so)
		if ($tile_id == puzz_ele_to_bitmask(1, 1))
		{
			$obj_arr[0] = "0{$poskey}00";
			$player_start_x	= $dst_x;
			$player_start_y = $dst_y;
		}
		//Heart
		if ($tile_id == puzz_ele_to_bitmask(2, 0)) $obj_arr[] = "1{$poskey}53";
		//Diamond
		if ($tile_id == puzz_ele_to_bitmask(2, 1)) $obj_arr[] = "2{$poskey}54";
		//Triangle
		if ($tile_id == puzz_ele_to_bitmask(2, 2)) $obj_arr[] = "3{$poskey}55";
		//Coin
		if ($tile_id == puzz_ele_to_bitmask(2, 3)) $obj_arr[] = "4{$poskey}56";
		//Octogem (encode index in sprite)
		if ($ele_id == 15) $obj_arr[] = "5{$poskey}0".dechex($sub_id);
		//Normal state
		if ($tile_id == puzz_ele_to_bitmask(8, 0)) $obj_arr[] = "6{$poskey}e6";
		//Fire state
		if ($tile_id == puzz_ele_to_bitmask(8, 1)) $obj_arr[] = "7{$poskey}e7";
		//Ice state
		if ($tile_id == puzz_ele_to_bitmask(8, 2)) $obj_arr[] = "8{$poskey}e8";
		//Generic key
		if ($tile_id == puzz_ele_to_bitmask(12, 1)) $obj_arr[] = "9{$poskey}9f";
		//Floor portal?
		if ($ele_id == 5)
		{
			//Do we have a matching floor portal? If not, store it for later
			//if so, create a pair of objects
			if ($floor_portals[$sub_id] == null)
				$floor_portals[$sub_id] = $poskey;
			else
			{
				$dstkey 	= $floor_portals[$sub_id];
				$floor_portals[$sub_id] = null;
				$obj_arr[]	= "a{$poskey}{$dstkey}";
				$obj_arr[]	= "a{$dstkey}{$poskey}";
			}
		}
		//Arrows
		if ($ele_id == 17)
		{
			$obj_arr[]	= "b{$poskey}0{$sub_id}";
			//Clear the arrow tile
			$tile_id = 1;
		}

		//Offset the destination
		$dst_x	+= 1;
		$dst_y 	+= 1;
		//Apply the checkerboard?
		if ($tile_id == 1 && ($dst_x + $dst_y) % 2 == 1) $tile_id = 255;
		//Apply checkerboard to cracked floor?
		if ($tile_id == 9 && ($dst_x + $dst_y) % 2 == 0) $tile_id = 254;
		if ($tile_id > 0) $tile_count++;

		$ele_grid[$dst_x][$dst_y] = $tile_id;
	}

	$puzz_w += 2;
	$puzz_h += 2;
	
	//Prepare an autotile reference grid to look up for wall generation
	$wall_ele_grid 	= grid_create($puzz_w, $puzz_h, 0);
	grid_copy_to_grid($ele_grid, 0, 0, $puzz_w, $puzz_h, $wall_ele_grid, 0, 0);
	//For each element of the grid, prep it for autotiling
	for ($x = 0; $x < $puzz_w; $x++)
		for ($y = 0; $y < $puzz_h; $y++)
			$wall_ele_grid[$x][$y] = $wall_ele_grid[$x][$y] >= 1 ? 0 : 1;

	//Now, perform the blob wang autotile on this
	//Ashe and Roxy note: this is a fair bit slower than what's in the game,
	//but since this isn't meant to run in real time, we don't have to be as efficient
	for ($x = 0; $x < $puzz_w; $x++)
	{
		$xl 	= max($x - 1, 0);
		$xr 	= min($x + 1, $puzz_w  - 1);

		for ($y = 0; $y < $puzz_h; $y++)
		{
			$yt 	= max($y - 1, 0);
			$yb 	= min($y + 1, $puzz_h - 1);

			//If the center tile is 0, skip
			if ($wall_ele_grid[$x][$y] != 0)
			{
				$tile_id 	= $lut_blob_wang_indices[
					$wall_ele_grid[$xl][$yt] |
					($wall_ele_grid[$x][$yt] << 1) |
					($wall_ele_grid[$xr][$yt] << 2) |
					($wall_ele_grid[$xl][$y] << 3) |
					($wall_ele_grid[$xr][$y] << 4) |
					($wall_ele_grid[$xl][$yb] << 5) |
					($wall_ele_grid[$x][$yb] << 6) |
					($wall_ele_grid[$xr][$yb] << 7)
				];

				//if it's an autotile set, go ahead and put it in
				if ($tile_id < 255)
					$ele_grid[$x][$y]	= $lut_metaremap_walls[$tile_id];
			}
		}
	}

	//now do the autotiling for lava and water tiles
	$metaremap 	= [41 => $lut_metaremap_lava, 73 => $lut_metaremap_water];
	foreach ($metaremap as $tile_id => $remap)
	{
		$wall_ele_grid 	= grid_create($puzz_w, $puzz_h, 0);
		grid_copy_to_grid($ele_grid, 0, 0, $puzz_w, $puzz_h, $wall_ele_grid, 0, 0);
		//For each element of the grid, prep it for autotiling
		for ($x = 0; $x < $puzz_w; $x++)
			for ($y = 0; $y < $puzz_h; $y++)
				$wall_ele_grid[$x][$y] = $wall_ele_grid[$x][$y] == $tile_id ? 1 : 0;

		for ($x = 0; $x < $puzz_w; $x++)
		{
			$xl 	= max($x - 1, 0);
			$xr 	= min($x + 1, $puzz_w  - 1);

			for ($y = 0; $y < $puzz_h; $y++)
			{
				$yt 	= max($y - 1, 0);
				$yb 	= min($y + 1, $puzz_h - 1);

				//If the center tile is 0, skip
				if ($wall_ele_grid[$x][$y] != 0)
				{
					$tile_id 	= $lut_blob_wang_indices[
						$wall_ele_grid[$xl][$yt] |
						($wall_ele_grid[$x][$yt] << 1) |
						($wall_ele_grid[$xr][$yt] << 2) |
						($wall_ele_grid[$xl][$y] << 3) |
						($wall_ele_grid[$xr][$y] << 4) |
						($wall_ele_grid[$xl][$yb] << 5) |
						($wall_ele_grid[$x][$yb] << 6) |
						($wall_ele_grid[$xr][$yb] << 7)
					];

					//if it's an autotile set, go anead and put it in
					if ($tile_id > 0)
						$ele_grid[$x][$y]	= $remap[$tile_id];
				}
			}
		}
	}

	//Create the object list by first encoding the amount of objects
	$obj_str 	= str_pad(dechex(count($obj_arr)), 2, '0', STR_PAD_LEFT);
	//Now, add all the objects to the end of the string
	foreach ($obj_arr as $str)
		$obj_str .= $str;

	//Return the object list, number of tiles, and the stage data
	return pico_hint_arrows($stage, $player_start_x, $player_start_y).$obj_str.str_pad(dechex($tile_count), 2, '0', STR_PAD_LEFT).grid_pack($ele_grid);

	//ASHE NOTE: This was the prototyping script that made a tilemap to
	//manually shove into pico 8. It's no longer necessary but we're saving it just in case
	/*
	//Create a grid to hold the puzzle elements
	$ele_grid 	= grid_create($puzz_w, $puzz_h, 0);
	//Fill the element grid with values from the stage data
	$len 	= strlen($stage_data);
	for ($i = 0; $i < $len; $i += 2)
	{
		$fin_i 	= $i / 2;
		$ele_grid[$fin_i % $puzz_w][floor($fin_i / $puzz_w)] = hexdec(substr($stage_data, $i, 2));
	}

	//Now, fill in the grid that'll represent the puzzle tiles themselves
	//This had padding around it so that we can autotile it later
	$puzz_grid 	= grid_create(($puzz_w * 2) + 4, ($puzz_h * 2) + 4, 0);

	//For each tile space, get the element tile array and place it into the puzzle tile grid
	for ($x = 0; $x < $puzz_w; $x++)
		for ($y = 0; $y < $puzz_h; $y++)
			puzz_copy_to_stage($x + 1, $y + 1, $lut_tile[$ele_grid[$x][$y]], $puzz_grid);
	
	//Create a grid that'll represent the entirety of this puzzle's playfield
	//TMP: Make it as big as pico 8 (should be 36 when done)
	$fin_grid 	= grid_create(128, 32, 0);

	//Copy the element grid into a bigger grid so we can do wall autotiles
	$fin_w	= $puzz_w + 2;
	$fin_h 	= $puzz_h + 2;
	$wall_ele_grid 	= grid_create($fin_w, $fin_h, 0);
	grid_copy_to_grid($ele_grid, 0, 0, $puzz_w, $puzz_h, $wall_ele_grid, 1, 1);
	//For each element of the grid, prep it for autotiling
	for ($x = 0; $x < $fin_w; $x++)
		for ($y = 0; $y < $fin_h; $y++)
			$wall_ele_grid[$x][$y] = $wall_ele_grid[$x][$y] >= 1 ? 0 : 1;
	
	//Now, perform the blob wang autotile on this
	//Ashe and Roxy note: this is a fair bit slower than what's in the game,
	//but since this isn't meant to run in real time, we don't have to be as efficient
	for ($x = 0; $x < $fin_w; $x++)
	{
		$xl 	= max($x - 1, 0);
		$xr 	= min($x + 1, $fin_w  - 1);

		for ($y = 0; $y < $fin_h; $y++)
		{
			$yt 	= max($y - 1, 0);
			$yb 	= min($y + 1, $fin_h - 1);

			//If the center tile is 0, skip
			if ($wall_ele_grid[$x][$y] != 0)
			{
				$tile_id 	= $lut_blob_wang_indices[
					$wall_ele_grid[$xl][$yt] |
					($wall_ele_grid[$x][$yt] << 1) |
					($wall_ele_grid[$xr][$yt] << 2) |
					($wall_ele_grid[$xl][$y] << 3) |
					($wall_ele_grid[$xr][$y] << 4) |
					($wall_ele_grid[$xl][$yb] << 5) |
					($wall_ele_grid[$x][$yb] << 6) |
					($wall_ele_grid[$xr][$yb] << 7)
				];

				//if it's an autotile set, go anead and put it in
				if ($tile_id > 0)
					puzz_copy_to_stage($x, $y, $lut_tile[$lut_metaremap_walls[$tile_id]], $puzz_grid);
			}
		}
	}

	//now do the autotiling for lava and water tiles
	$metaremap 	= [41 => $lut_metaremap_lava, 73 => $lut_metaremap_water];
	foreach ($metaremap as $tile_id => $remap)
	{
		
		$wall_ele_grid 	= grid_create($fin_w, $fin_h, 0);
		grid_copy_to_grid($ele_grid, 0, 0, $puzz_w, $puzz_h, $wall_ele_grid, 1, 1);
		//For each element of the grid, prep it for autotiling
		for ($x = 0; $x < $fin_w; $x++)
			for ($y = 0; $y < $fin_h; $y++)
				$wall_ele_grid[$x][$y] = $wall_ele_grid[$x][$y] == $tile_id ? 1 : 0;

		for ($x = 0; $x < $fin_w; $x++)
		{
			$xl 	= max($x - 1, 0);
			$xr 	= min($x + 1, $fin_w  - 1);

			for ($y = 0; $y < $fin_h; $y++)
			{
				$yt 	= max($y - 1, 0);
				$yb 	= min($y + 1, $fin_h - 1);

				//If the center tile is 0, skip
				if ($wall_ele_grid[$x][$y] != 0)
				{
					$tile_id 	= $lut_blob_wang_indices[
						$wall_ele_grid[$xl][$yt] |
						($wall_ele_grid[$x][$yt] << 1) |
						($wall_ele_grid[$xr][$yt] << 2) |
						($wall_ele_grid[$xl][$y] << 3) |
						($wall_ele_grid[$xr][$y] << 4) |
						($wall_ele_grid[$xl][$yb] << 5) |
						($wall_ele_grid[$x][$yb] << 6) |
						($wall_ele_grid[$xr][$yb] << 7)
					];

					//if it's an autotile set, go anead and put it in
					if ($tile_id > 0)
						puzz_copy_to_stage($x, $y, $lut_tile[$remap[$tile_id]], $puzz_grid);
				}
			}
		}
	}

	//Copy the puzzle grid into the final grid
	//This is offset by one tile, since the top row and left column are always empty anyways
	//ASHE NOTE: The destination is offset by -1, -1. it shouldn't have to be,
	//but I don't feel like fixing the script at this point as it'll break everything else
	grid_copy_to_grid($puzz_grid, 1, 1, ($puzz_w * 2) + 2, ($puzz_h * 2) + 2, $fin_grid, -1, -1);

	//Pack the grid into a hex string and return it
	return grid_pack($fin_grid);*/
}

//misc utility functions
function clamp($val, $min, $max)
{
	return min(max(intval($val), $min), $max);
}

function grid_create($w, $h, $val)
{
	$grid	= [];
	for ($x = 0; $x < $w; $x++)
		for ($y = 0; $y < $h; $y++)
			$grid[$x][$y] = $val;
	return $grid;
}

function puzz_ele_to_bitmask($ele, $sub)
{
	return (($sub & 0x7) << 5) | ($ele & 0x1F);
}
function puzz_get_mirrored_tile($tile_id)
{
	return [253, $tile_id, 253, $tile_id + 16];
}
function puzz_get_full_tile($tile_id)
{
	return [$tile_id, $tile_id + 1, $tile_id + 16, $tile_id + 17];
}
function puzz_get_single_tile($tile_id)
{
	return [$tile_id, $tile_id, $tile_id, $tile_id];
}

function puzz_copy_to_stage($x, $y, $tile_arr, &$puzz_grid)
{
	//Roxy note: probably a good way to do this programatically but I don't feel like it
	$fin_x	= $x * 2;
	$fin_y 	= $y * 2;
	$puzz_grid[$fin_x][$fin_y]	= $tile_arr[0];
	$puzz_grid[$fin_x + 1][$fin_y]	= $tile_arr[1];
	$puzz_grid[$fin_x][$fin_y + 1]	= $tile_arr[2];
	$puzz_grid[$fin_x + 1][$fin_y + 1]	= $tile_arr[3];
}

function grid_copy_to_grid($src_grid, $src_x, $src_y, $src_w, $src_h, &$dst_grid, $dst_x, $dst_y)
{
	//Figure out the width bound for all rows
	$dst_max_w 	= min($dst_x + $src_w, count($dst_grid));
	$src_max_w 	= min($src_x + $src_w, count($src_grid));
	//Now, start copying
	for ($x = $src_x; $x < $src_max_w; $x++)
	{
		//Figure out the height bound for this column
		$grid_col	= $dst_grid[$x];
		$x_fin 		= min($dst_x + $x, $dst_max_w);
		$src_max_h 	= min($src_y + $src_h, count($grid_col));
		$dst_max_h 	= min($dst_y + $src_h, count($grid_col));
		for ($y = $src_y; $y < $src_max_h; $y++)
		{
			$y_fin 	= min($dst_y + $y, $dst_max_h);
			$dst_grid[$x_fin][$y_fin] = $src_grid[$x][$y];
		}
	}
}

function grid_pack($grid, $for_pico8 = false)
{
	//Figure out the size of this grid
	$grid_w 	= count($grid);
	$grid_h 	= 0;
	for ($x = 0; $x < $grid_w; $x++)
		$grid_h = max(count($grid[$x]), $grid_h);
	
	//Create a string for this grid
	$packed 	= '';
	for ($y = 0; $y < $grid_h; $y++)
	{
		for ($x = 0; $x < $grid_w; $x++)
			$packed 	.= str_pad(dechex($grid[$x][$y]), 2, '0', STR_PAD_LEFT);
		if ($for_pico8)
			$packed	.= "\r\n";
	}
	return $packed;
}

?>