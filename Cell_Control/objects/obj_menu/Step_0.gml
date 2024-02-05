//convert x and y to other things here
var gui_x = x;
var gui_y = y;

mouseOver = false;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (point_in_rectangle(_mx, _my, gui_x, gui_y, gui_x + width, gui_y + height)) 
{
	mouseOver = true;
	if (mxPrev != _mx) || (myPrev != _my)
	{
		var _mouseHoverLine = (_my - gui_y) div heightLine;
		if !(description == -1) _mouseHoverLine -= 1;
		if (_mouseHoverLine < 0) _mouseHoverLine = 0;
		if (_mouseHoverLine > optionsCount - 1) _mouseHoverLine = optionsCount - 1;
		hover = _mouseHoverLine;
	}
}

hover += keyboard_check_pressed(ord("E")) - keyboard_check_pressed(ord("Q"));

if (hover > optionsCount - 1) hover = 0;
if (hover < 0) hover = optionsCount - 1;

if ((mouse_check_button_pressed(mb_left) && mouseOver))
{
	if (array_length(options[hover]) == 2)
	{
		var _func = options[hover][1];
		if (_func != -1) _func();
	}
	instance_destroy();
}

mxPrev = _mx;
myPrev = _my;