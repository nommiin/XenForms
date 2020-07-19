function Button( _parent, _data ) : Control() constructor {
	// Members
	Alignment = new Point(fa_left, fa_top);
	TextAlignment = new Point(fa_left, fa_top);
	Value = undefined;
	Colour = c_white;
	HoverColour = c_ltgray;
	HeldColour = c_dkgray;
	TextColour = c_black;
	BorderColour = c_black;
	BorderSize = 1;
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
	_Render = function() {
		var _buttonColour = (Held == true ? HeldColour : (Hover == true ? HoverColour : Colour));
		draw_set_font(Font);
		draw_set_alpha(Alpha);
		draw_rectangle_colour(Position.x, Position.y, Position.x + Size.x, Position.y + Size.y, BorderColour, BorderColour, BorderColour, BorderColour, false);
		draw_rectangle_colour(Position.x + BorderSize, Position.y + BorderSize, (Position.x + Size.x) - BorderSize, (Position.y + Size.y) - BorderSize, _buttonColour, _buttonColour, _buttonColour, _buttonColour, false);
		Position.Push(Position.Clone().Anchor(TextAlignment, Size));
		draw_set_halign(TextAlignment.x);
		draw_set_valign(TextAlignment.y);
		draw_text_colour(Position.x, Position.y, string(Value), TextColour, TextColour, TextColour, TextColour, Alpha);
		draw_set_alpha(1);
		Position.Pop();
		Position.Pop();
	}
	
	// Control
	Parent = _parent;
	AnchorAlignment = true;
	Initialize(self, _data, CacheFont);
}