/// @desc

scDebugMsg("CREATE CONTROLLER CAMERA:");

scInitialiseDisplay();
scInitialiseCamera();

cameraWidth = idealWidth;
cameraHeight = idealHeight;


//Set the port bounds of view 0 
view_set_wport(0, cameraWidth );
view_set_hport(0, cameraHeight);


//cameraWidth = global.mapWidthInPixels;
//cameraHeight = global.mapHeightInPixels;