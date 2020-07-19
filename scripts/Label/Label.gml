function Label( _parent, _data ) : Control() constructor {
	// Members
	Alignment = new Point(fa_left, fa_top);
	Value = undefined;
	Colour = c_white;
	Alpha = 1;
	Font = undefined;
	FontSize = 10;
	
	// Methods
	static CacheFont = function() {
		if (FONTS[? FontSize] == undefined) {
			FONTS[? FontSize] = font_add("segoeui.ttf", FontSize, false, false, 32, 128);
		}
		Font = FONTS[? FontSize];
	}
	
	// Events
	_Update = function() {
		draw_set_font(Font);
		Size.Apply(string_width(string(Value)), string_height(string(Value)));
	}
	
	_Render = function() {
		draw_set_font(Font);
		draw_set_halign(Alignment.x);
		draw_set_valign(Alignment.y);
		draw_text_colour(Position.x, Position.y, string(Value), Colour, Colour, Colour, Colour, Alpha);	
		Position.Pop();
	}
	
	// Control
	Parent = _parent;
	AnchorAlignment = false;
	Initialize(self, _data, CacheFont);
}