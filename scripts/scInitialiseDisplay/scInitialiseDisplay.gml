/// @description initializes display properties.

// set base ideal width/height
idealHeight = 360;
idealWidth = 0; //set based on height and aspect ratio

zoom = 1; //***Inherit from settings

// calculate display aspect ratio
aspect_ratio = display_get_width()/display_get_height();
aspect_ratio = clamp(aspect_ratio, 16/10, 21/9); // clamps aspect ratio of the game overall.


idealWidth = round(idealHeight*aspect_ratio);

// PIXEL PERFECT SCALING

if (display_get_width() mod idealWidth != 0)
{
	var _d = round(display_get_width()/idealWidth);
	idealWidth= display_get_width()/_d;
}

if (display_get_height() mod idealHeight != 0)
{
	var _d = round(display_get_height()/idealHeight);
	idealHeight = display_get_height()/_d;
}


// ELIMINATE ODD NUMBERED WIDTH AND HEIGHT VALUES
if (idealWidth & 1){
	idealWidth++;
}

if (idealHeight & 1){
	idealHeight++;
}

// store maximum zoom value for windowed mode.
max_zoom = floor(display_get_width()/idealWidth);

// resize application surface
surface_resize(application_surface, idealWidth, idealHeight);
window_set_size(idealWidth *zoom, idealHeight *zoom);

fullScreen = 0;

alarm[0] = 1; //  to trigger centers view.

scDebugMsg("Display initialised");