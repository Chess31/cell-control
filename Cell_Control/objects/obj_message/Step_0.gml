y--;

image_alpha = lerp(image_alpha, 0, 0.02);

if (image_alpha <= 0){
	instance_destroy();
}