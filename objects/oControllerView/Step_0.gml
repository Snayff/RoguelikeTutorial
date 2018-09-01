/// @desc update FOV

if fovRecompute == true {
	scCalculateFov();	
	
	fovRecompute = false; //turn flag off
}
