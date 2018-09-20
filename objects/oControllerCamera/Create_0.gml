/// @desc

scDebugMsg("CREATE CONTROLLER CAMERA:");

scInitialiseDisplay();
scInitialiseCamera();

//Set the port bounds of view 0 
view_set_wport(0, idealWidth );
view_set_hport(0, idealHeight);

cameraWidth = idealWidth;
cameraHeight = idealHeight;
camera_set_view_size(camera, cameraWidth, cameraHeight); //**update to zoom out and show more screen - https://www.youtube.com/watch?v=_BG67vHcZSo
