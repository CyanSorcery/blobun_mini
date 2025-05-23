<?php

//NOTE: each of these is in the order of top left, top right, bottom left, bottom right

//Start by creating an array of 256 entries with blank tiles
//any unrecognized puzzle elements will be replaced with the trans tile
$tile_lut	= array_fill(0, 256, puzz_get_single_tile(15));

//void/empty tile
$tile_lut[0]	= [0, 0, 0, 0];

//blank tile
$tile_lut[puzz_ele_to_bitmask(1, 0)] = puzz_get_mirrored_tile(16);

//Heart (on)
$tile_lut[puzz_ele_to_bitmask(3, 0)] = puzz_get_mirrored_tile(19);
//Heart (off)
$tile_lut[puzz_ele_to_bitmask(4, 0)] = puzz_get_mirrored_tile(20);

//Diamond (on)
$tile_lut[puzz_ele_to_bitmask(3, 1)] = puzz_get_mirrored_tile(21);
//Diamond (off)
$tile_lut[puzz_ele_to_bitmask(4, 1)] = puzz_get_mirrored_tile(22);

//Triangle (on)
$tile_lut[puzz_ele_to_bitmask(3, 2)] = puzz_get_mirrored_tile(23);
//Triangle (off)
$tile_lut[puzz_ele_to_bitmask(4, 2)] = puzz_get_mirrored_tile(24);

//Coin (on)
$tile_lut[puzz_ele_to_bitmask(3, 3)] = puzz_get_mirrored_tile(25);
//Coin (off)
$tile_lut[puzz_ele_to_bitmask(4, 3)] = puzz_get_mirrored_tile(26);

//Octoblock (on)
$tile_lut[puzz_ele_to_bitmask(10, 2)] = puzz_get_mirrored_tile(27);
//Octoblock (off)
$tile_lut[puzz_ele_to_bitmask(10, 3)] = puzz_get_mirrored_tile(28);

//Zapper (cyan)
$tile_lut[puzz_ele_to_bitmask(7, 1)] = puzz_get_mirrored_tile(29);
//Zapper (magenta)
$tile_lut[puzz_ele_to_bitmask(7, 0)] = puzz_get_mirrored_tile(30);
//Zapper (yellow)
$tile_lut[puzz_ele_to_bitmask(7, 2)] = puzz_get_mirrored_tile(31);

//Slime trap
$tile_lut[puzz_ele_to_bitmask(9, 4)] = puzz_get_mirrored_tile(48);

//Generic lock block
$tile_lut[puzz_ele_to_bitmask(10, 4)] = puzz_get_mirrored_tile(51);
//Generic key
$tile_lut[puzz_ele_to_bitmask(12, 1)] = puzz_get_mirrored_tile(18);

//Heart key
$tile_lut[puzz_ele_to_bitmask(2, 0)] = puzz_get_mirrored_tile(52);
//Diamond key
$tile_lut[puzz_ele_to_bitmask(2, 1)] = puzz_get_mirrored_tile(53);
//Triangle key
$tile_lut[puzz_ele_to_bitmask(2, 2)] = puzz_get_mirrored_tile(54);
//Coin key
$tile_lut[puzz_ele_to_bitmask(2, 3)] = puzz_get_mirrored_tile(55);

//Octogems
$tile_lut[puzz_ele_to_bitmask(15, 0)] = puzz_get_mirrored_tile(56);
$tile_lut[puzz_ele_to_bitmask(15, 1)] = puzz_get_mirrored_tile(57);
$tile_lut[puzz_ele_to_bitmask(15, 2)] = puzz_get_mirrored_tile(58);
$tile_lut[puzz_ele_to_bitmask(15, 3)] = puzz_get_mirrored_tile(59);
$tile_lut[puzz_ele_to_bitmask(15, 4)] = puzz_get_mirrored_tile(60);
$tile_lut[puzz_ele_to_bitmask(15, 5)] = puzz_get_mirrored_tile(61);
$tile_lut[puzz_ele_to_bitmask(15, 6)] = puzz_get_mirrored_tile(62);
$tile_lut[puzz_ele_to_bitmask(15, 7)] = puzz_get_mirrored_tile(63);

//Normal state
$tile_lut[puzz_ele_to_bitmask(8, 0)] = puzz_get_mirrored_tile(80);
//Fire state
$tile_lut[puzz_ele_to_bitmask(8, 1)] = puzz_get_mirrored_tile(82);
//Ice state
$tile_lut[puzz_ele_to_bitmask(8, 2)] = puzz_get_mirrored_tile(81);

//Red portal
$tile_lut[puzz_ele_to_bitmask(5, 0)] = puzz_get_full_tile(88);
//Green portal
$tile_lut[puzz_ele_to_bitmask(5, 1)] = puzz_get_full_tile(90);
//Blue portal
$tile_lut[puzz_ele_to_bitmask(5, 2)] = puzz_get_full_tile(92);
//Yellow portal
$tile_lut[puzz_ele_to_bitmask(5, 3)] = puzz_get_full_tile(94);

//Conveyer east
$tile_lut[puzz_ele_to_bitmask(6, 0)] = puzz_get_full_tile(112);
//Conveyer north
$tile_lut[puzz_ele_to_bitmask(6, 1)] = puzz_get_full_tile(114);
//Conveyer west
$tile_lut[puzz_ele_to_bitmask(6, 2)] = puzz_get_full_tile(116);
//Conveyer south
$tile_lut[puzz_ele_to_bitmask(6, 3)] = puzz_get_full_tile(118);

//Ice block
$tile_lut[puzz_ele_to_bitmask(10, 0)] = puzz_get_full_tile(120);

//Ice floor
$tile_lut[puzz_ele_to_bitmask(9, 3)] = puzz_get_full_tile(122);

//Cracked floor
$tile_lut[puzz_ele_to_bitmask(9, 0)] = puzz_get_full_tile(124);

//Lava floor
$tile_lut[puzz_ele_to_bitmask(9, 1)] = puzz_get_single_tile(176);
//Water tile
$tile_lut[puzz_ele_to_bitmask(9, 2)] = puzz_get_single_tile(192);

?>