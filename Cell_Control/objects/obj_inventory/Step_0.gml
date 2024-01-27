var _scroll_down = mouse_wheel_up();
var _scroll_up = mouse_wheel_down();

if (_scroll_up)
{
	item_pos += 1;

	if	(item_pos > 4)
	{
		item_pos = 0;
	}
}

if (_scroll_down)
{
	item_pos -= 1;

	if (item_pos < 0)
	{
		item_pos = 4;
	}
}