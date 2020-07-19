function Application() : Control() constructor {
	// Members
	APP = self;
	Controls = ds_list_create();
	Cursor = new Point(0, 0);
	
	// Methods
	static Register = function( _control ) {
		ds_list_add(Controls, _control);
		return _control;
	}
	
	static Find = function( _name ) {
		for(var i = 0; i < ds_list_size(Controls); i++) {
			if (Controls[| i].Name == _name) return Controls[| i];
		}
		return undefined;
	}
	
	// Events
	_Update = function() {
		Size.Apply(window_get_width(), window_get_height());
		Cursor.Apply(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
		for(var i = 0; i < ds_list_size(Controls); i++) {
			with (Controls[| i]) {
				AnchorApply();
				ExecuteEvent(self, _Update, Update);
				
				if (point_in_rectangle(CURSOR.x, CURSOR.y, PositionAnchored.x, PositionAnchored.y, PositionAnchored.x + Size.x, PositionAnchored.y + Size.y) == true) {
					ExecuteEvent(self, _OnHover, OnHover);
					if (mouse_check_button_pressed(mb_left) == true) {
						ExecuteEvent(self, _OnPressed, OnPressed);
					} else if (mouse_check_button_released(mb_left) == true) {
						ExecuteEvent(self, _OnReleased, OnReleased);
						Held = false;
					}
					
					if (mouse_check_button(mb_left) == true) {
						ExecuteEvent(self, _OnHeld, OnHeld);
						Held = true;
					}
					
					Hover = true;
					if (HoverState == 0) {
						ExecuteEvent(self, _OnEnter, OnEnter);
						HoverState = 1;
					}
				} else {
					Held = false;
					Hover = false;
					if (HoverState == 1) {
						ExecuteEvent(self, _OnExit, OnExit);
						HoverState = 0;	
					}
				}
			}
		}
	}
	
	_Render = function() {
		display_set_gui_size(Size.x, Size.y);
		draw_line_width_color(0, Size.y / 2, Size.x, Size.y / 2, 3, c_red, c_red);
		draw_line_width_colour(Size.x / 2, 0, Size.x / 2, Size.y, 3, c_blue, c_blue);
		draw_set_alpha(0.1);
		draw_rectangle_colour(Position.x, Position.y, Position.x + Size.x, Position.y + Size.y, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(1);
		for(var i = 0; i < ds_list_size(Controls); i++) {
			with (Controls[| i]) {
				draw_line_width_colour(0, WINDOW.y, PositionAnchored.x, PositionAnchored.y, 2, c_green, c_green);
				ExecuteEvent(self, _Render, Render);
			}
		}
	}
}