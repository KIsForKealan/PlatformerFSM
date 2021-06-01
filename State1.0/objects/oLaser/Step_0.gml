/// @description 
x = oController.x;
y = oController.y;
if (oController.pressedMouse == false) 
{
	instance_destroy();	
}

if (image_index > 7)
{
	image_speed = 0;
	imageFlicker = true;
}

if (imageFlicker == true)
{
	image_yscale = random_range(0.9, 1.1);	
}