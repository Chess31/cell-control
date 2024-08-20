function MenuCreate(_x, _y, _options, _description = -1)
{
	with (instance_create_depth(_x, _y, -999, obj_menu))
	{
		options = _options;
		description = _description;
		optionsCount = array_length(_options);
		hovermarker = "+ ";
		
		//set up size of menu
		margin = 8;
		//draw_set_font()
		
		width = 1;
		if (_description != -1) width = max(width, string_width(_description));
		for (var i = 0; i < optionsCount; i++)
		{
			width = max(width, string_width(_options[i][0]));
		}
		width += string_width(hovermarker);
		
		heightLine = 17;
		height = heightLine * (optionsCount + !(description == -1));
		
		widthFull = width + margin * 2;
		heightFull = height + margin * 2;
	}
}

function display_tutorial(_x, _y, _tutorial, _description = -1)
{
	with (instance_create_depth(_x, _y, -999, obj_tutorial))
	{
		description = _description;
		text = _tutorial;
		
		//set up size
		margin = 8;
		wrap_width = 400;
		//draw_set_font()
		
		width = 1;
		
		if (_description != -1) {width = max(width, string_width(_description))};
		
		//width = max(width, string_width(_tutorial))
		
		width = string_width_ext(_tutorial,string_height(_tutorial),wrap_width);
		
		line_height = string_height(_tutorial);//17;
		
		height = string_height_ext(_tutorial,line_height,wrap_width);
		
		width_full = width + (margin * 2);
		height_full = height + (margin * 2);
	}
}

function create_tooltip(_x, _y, _text, _button_id, _description = -1)
{
	with (instance_create_depth(_x, _y, -999, obj_tooltip))
	{
		description = _description;
		text = _text;
		button_id = _button_id;
		
		//set up size
		margin = 8;
		wrap_width = 400;
		//draw_set_font()
		
		width = 1;
		
		if (_description != -1) {width = max(width, string_width(_description))};
		
		//width = max(width, string_width(_tutorial))
		
		width = string_width_ext(_text,string_height(_text),wrap_width);
		
		line_height = string_height(_text);//17;
		
		height = string_height_ext(_text,line_height,wrap_width);
		
		width_full = width + (margin * 2);
		height_full = height + (margin * 2);
	}
}