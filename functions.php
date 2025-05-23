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

function pico_hint_arrows($replay_data)
{
	//For now, don't parse this and just return 0 hints
	return '0';
}

function pico_puzzle_data($stage)
{
	global $tile_lut;

	//First, unpack the stage data
	$stage_data 	= bin2hex(zlib_decode(base64_decode($stage->stage_data)));

	$puzz_w 	= $stage->stage_width;
	$puzz_h 	= $stage->stage_height;

	//Create a grid to hold the puzzle elements
	$ele_grid 	= grid_create($puzz_w, $puzz_h, 0);
	//Fill the element grid with values from the stage data
	$len 	= strlen($stage_data);
	for ($i = 0; $i < $len; $i += 2)
	{
		$fin_i 	= $i / 2;
		$ele_grid[floor($fin_i % $puzz_w)][$fin_i / $puzz_w] = hexdec(substr($stage_data, $i, 2));
	}

	//Now, fill in the grid that'll represent the puzzle tiles themselves
	$puzz_grid 	= grid_create($puzz_w * 2, $puzz_h * 2, 0);

	//For each tile space, get the element tile array and place it into the puzzle tile grid
	for ($x = 0; $x < $puzz_w; $x++)
		for ($y = 0; $y < $puzz_h; $y++)
			puzz_copy_to_stage($x, $y, $tile_lut[$ele_grid[$x][$y]], $puzz_grid);
	
	//Create a grid that'll represent the entirety of this puzzle's playfield
	//TMP: Make it as big as pico 8 (should be 48 when done)
	$fin_grid 	= grid_create(128, 32, 1);

	//Copy the puzzle grid into it
	grid_copy_to_grid($puzz_grid, 0, 0, $puzz_w * 2, $puzz_h * 2, $fin_grid, 0, 0);

	//Create a metatile grid for all 256 possible puzzle tiles
	$metatile_grid 	= grid_create(32, 32, 0);
	for ($x = 0; $x < 16; $x++)
		for ($y = 0; $y < 16; $y++)
			puzz_copy_to_stage($x, $y, $tile_lut[($x * 16) + $y], $metatile_grid);
	
	//Copy this into the final grid
	grid_copy_to_grid($metatile_grid, 0, 0, 32, 32, $fin_grid, 96, 0);

	//Pack the grid into a hex string and return it
	return grid_pack($fin_grid);
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

function grid_pack($grid)
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
		//tmp
		$packed	.= "\r\n";
	}
	return $packed;
}

?>