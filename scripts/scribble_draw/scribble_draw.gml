/// @param json
/// @param [x]
/// @param [y]
/// @param [shader]
/// @param [do_hyperlinks]
/// @param [do_sprite_slots]

var _json            = argument[0];
var _x               = ((argument_count > 1) && (argument[1] != undefined))? argument[1] : 0;
var _y               = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : 0;
var _shader          = ((argument_count > 3) && (argument[3] != undefined))? argument[3] : SCRIBBLE_DEFAULT_SHADER;
var _do_hyperlinks   = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : true;
var _do_sprite_slots = ((argument_count > 5) && (argument[5] != undefined))? argument[5] : true;

if ( SCRIBBLE_COMPATIBILITY_MODE ) {
    scribble_draw_compatibility( _json, _x, _y, _do_hyperlinks, _do_sprite_slots );
    exit;
}

if ( _do_hyperlinks ) {
    //Build an array that describes the hyperlink mix state for each hyperlink
    //(The default max value is 16)
    var _mix_array = array_create( SCRIBBLE_MAX_HYPERLINKS, 0 );
    var _hyperlinks = _json[? "hyperlinks" ];
    var _hyperlink_list = _json[? "hyperlink list" ];
    var _size = min( SCRIBBLE_MAX_HYPERLINKS, ds_list_size( _hyperlink_list ) );
    for( var _i = 0; _i < _size; _i++ ) {
    
        var _hyperlink_name = _hyperlink_list[| _i ];
        var _hyperlink_map = _hyperlinks[? _hyperlink_name ];
        _mix_array[ _i ] = _hyperlink_map[? "mix" ];
    
    }
}

if ( _do_sprite_slots ) {
    var _sprite_slot_array = array_create( SCRIBBLE_MAX_SPRITE_SLOTS, 0 );
    var _sprite_slot_list = _json[? "sprite slots" ];
    var _size = ds_list_size( _sprite_slot_list );
    for( var _i = 0; _i < _size; _i++ ) {
        var _slot_map = _sprite_slot_list[| _i ];
        _sprite_slot_array[ _i ] = _slot_map[? "image" ];
    }
}



var _real_x      = _x + _json[? "left" ];
var _real_y      = _y + _json[? "top" ];
var _vbuff_list  = _json[? "vertex buffer list" ];
var _vbuff_count = ds_list_size( _vbuff_list );

if ( _real_x != 0 ) || ( _real_y != 0 ) {
    var _old_matrix = matrix_get( matrix_world );
    var _matrix;
    _matrix[15] =  1;
    _matrix[ 0] =  1;
    _matrix[ 5] =  1;
    _matrix[10] =  1;
    _matrix[12] = _real_x;
    _matrix[13] = _real_y;
    matrix_set( matrix_world, _matrix );
}

if ( _json[? "shader master" ] ) {
    
    shader_set( _shader );
    shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fTime" ), global.__scribble_time );
    
    scribble_shader_mix_colour(     _json[? "mix colour" ], _json[? "mix weight" ] );
    scribble_shader_alpha(          _json[? "alpha" ] );
    scribble_shader_options(        _json[? "wave size" ], _json[? "shake size" ], _json[? "rainbow weight" ] );
    scribble_shader_character_fade( _json[? "char fade t" ], _json[? "char fade smoothness" ] );
    scribble_shader_line_fade(      _json[? "line fade t" ], _json[? "line fade smoothness" ] );
    
    if ( _do_hyperlinks   ) scribble_shader_hyperlink(    _json[? "hyperlink colour" ], _mix_array );
    if ( _do_sprite_slots ) scribble_shader_sprite_slots( _sprite_slot_array );
    
    for( var _i = 0; _i < _vbuff_count; _i++ ) {
        var _vbuff_map = _vbuff_list[| _i ];
        vertex_submit( _vbuff_map[? "vertex buffer" ], pr_trianglelist, _vbuff_map[? "texture" ] );
    }
    
    shader_reset();
    
} else {
    
    if ( os_type == os_macosx ) {
        
        shader_set( shScribblePassthrough );
        for( var _i = 0; _i < _vbuff_count; _i++ ) {
            var _vbuff_map = _vbuff_list[| _i ];
            vertex_submit( _vbuff_map[? "vertex buffer" ], pr_trianglelist, _vbuff_map[? "texture" ] );
        }
        shader_reset();
        
    } else {
        
        for( var _i = 0; _i < _vbuff_count; _i++ ) {
            var _vbuff_map = _vbuff_list[| _i ];
            vertex_submit( _vbuff_map[? "vertex buffer" ], pr_trianglelist, _vbuff_map[? "texture" ] );
        }
        
    }
    
}

if ( _x != 0 ) || ( _y != 0 ) matrix_set( matrix_world, _old_matrix );