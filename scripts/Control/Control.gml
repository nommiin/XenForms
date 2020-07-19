function Control(_data) constructor {
	// Statics
	static Identifier = 0;
	
	// Members
	Name = "Control" + string(Identifier++);
	Parent = undefined;
	Anchor = new Point(fa_left, fa_top);
	AnchorAlignment = true;
	Position = new Point();
	PositionAnchored = new Point();
	Size = new Point();
	Drawn = true;
	Hover = false;
	HoverState = 0;
	Held = false;
	
	// Events
	_Update = undefined; Update = undefined;
	_Render = undefined; Render = undefined;
	_OnHover = undefined; OnHover = undefined;
	_OnEnter = undefined; OnEnter = undefined;
	_OnExit = undefined; OnExit = undefined;
	_OnPressed = undefined; OnPressed = undefined;
	_OnReleased = undefined; OnReleased = undefined;
	_OnHeld = undefined; OnHeld = undefined;
	Override = false;
	
	// Methods
	static Initialize = function( _target, _data, _callback ) {
		if (_data != undefined) {
			var _dataMembers = variable_struct_get_names(_data);
			for(var i = 0; i < array_length(_dataMembers); i++) {
				variable_struct_set(_target, _dataMembers[i], variable_struct_get(_data, _dataMembers[i]));	
			}
			if (_callback != undefined) _callback();
		}
	}
	
	static ExecuteEvent = function( _target, _internal, _external ) {
		if (Override == true) {
			if (_external != undefined) method(_target, _external)();
			else if (_internal != undefined) method(_target, _internal)();
		} else {
			if (_internal != undefined) method(_target, _internal)();
			if (_external != undefined) method(_target, _external)();
		}
	}
	
	static AnchorApply = function() {
		var _anchorCopy = Position.Clone().Add(Parent.PositionAnchored).Anchor(Anchor, Parent.Size);
		Position.Push((AnchorAlignment == true ? _anchorCopy.Anchor(Alignment, Size, -1) : _anchorCopy));
		PositionAnchored.Copy(Position);
	}
}