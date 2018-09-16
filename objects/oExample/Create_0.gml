/// @desc
//Define a temporary string. This is the data Scribble will parse to make a JSON

//Scribble Drawing Events
//	[] - reset drawing
//	[ev|sound|sndExample]  - apply sound to drawing of each character
//	[rainbow] - rainbow effect 
//	[shake] - shake effect
//	[wave] - wave effect
//	[link] [/link] - hyperlink, changes colour on hover, must use end command too. 
//	[$FF4499] - colour
//	[c_orange] - colour, must be in script __scribble_string_to_colour
//	[fa_left] - alignment of text, also forces new line if current line has content. Can use other alignments as normal.
//	[spExample|$0] - sprite and subimage, there is an upper limit set (somewhere)
//	## - ???
//	\n - new line
//var _string = "[rainbow]rainbow[] NoEffect [wave][c_orange]orangeWave[] .,<>\"'&[sCoin|$0][sCoin|$1][sCoin|$0][sCoin|1][shake][rainbow]!?[]\n\n[link|0]the quick[/link] [link|1]brown fox[/link] [wave]jumps[] over the lazy dog\n\n[fa_right]THE [$FF4499][shake]QUICK [$D2691E]BROWN [$FF4499]FOX [fa_left]JUMPS OVER []THE LAZY DOG.";
var _string = "Welcome to [c_orange]Roguelike Tutorial[]";

//Build a JSON that describdes how the text should be laid out
//This script also (by default) builds vertex buffers to draw the text
json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );

//Set how the text should be aligned relative to the draw coordinate
//Here, we're setting the alignment so that the middle/centre of the box is at the draw coordinate
scribble_set_box_alignment( json, fa_left, fa_top );

//Set some properties for dyanmic text effects
scribble_set_shake( json, 4 );
scribble_set_wave( json, 4 );
scribble_set_rainbow( json, 0.4 );

//Set how our hyperlinks should look. Fade in/out rates are deltas per frame (0 < rate <= 1)
//By default, there is a maximum of 4 hyperlinks
scribble_set_hyperlink( json, c_lime, 0.2, 0.2 );

//Set properties for sprite slots. Sprite slots are used to animate sprites
//By default, there is a maximum of 4 sprite slots
scribble_set_sprite_slot_speed( json, 0, 0.1 );
scribble_set_sprite_slot_image( json, 1, 1   );
scribble_set_sprite_slot_speed( json, 1, 0.2 );



//Variable to track which character of the string we've revealed
char_pos = 0;
