function Point( _x, _y ) constructor {
	static Apply = function( _x, _y ) {
		x = _x;
		y = _y;
	}
	
	static Add = function( _x, _y ) {
		if (instanceof(_x) == "Point") {
			x += _x.x;
			y += _x.y;
		} else if (argument_count > 1) {
			x += _x;
			y += _y;
		} else {
			throw "Invalid arguments provided to 'Add' method";	
		}
		return self;
	}
	
	static Subtract = function( _x, _y ) {
		if (instanceof(_x) == "Point") {
			x -= _x.x;
			y -= _x.y;
		} else if (argument_count > 1) {
			x -= _x;
			y -= _y;
		} else {
			throw "Invalid arguments provided to 'Subtract' method";	
		}
		return self;
	}
	
	static Multiply = function( _x, _y ) {
		if (instanceof(_x) == "Point") {
			x *= _x.x;
			y *= _x.y;
		} else if (argument_count > 1) {
			x *= _x;
			y *= _y;
		} else {
			throw "Invalid arguments provided to 'Multiply' method";	
		}
		return self;
	}
	
	static Divide = function( _x, _y ) {
		if (instanceof(_x) == "Point") {
			x /= _x.x;
			y /= _x.y;
		} else if (argument_count > 1) {
			x /= _x;
			y /= _y;
		} else {
			throw "Invalid arguments provided to 'Divide' method";	
		}
		return self;
	}
	
	static Copy = function( _point ) {
		if (instanceof(_point) == "Point") {
			x = _point.x;
			y = _point.y;
		} else {
			throw "Invalid argument provided to 'Copy' method, argument must be an instance of 'Point'";	
		}
		return self;
	}
	
	static Clone = function() {
		return new Point(x, y);	
	}
	
	static Push = function( _x, _y ) {
		Stack[array_length(Stack)] = [x, y];
		if (instanceof(_x) == "Point") {
			x = _x.x;
			y = _x.y;
		} else if (argument_count > 1) {
			x = _x;
			y = _y;
		} else {
			throw "Invalid arguments provided to 'Push' method";	
		}
		return self;
	}
	
	static Pop = function() {
		var _stackLength = array_length(Stack);
		if (_stackLength > 0) {
			var _stackTop = Stack[_stackLength - 1], _stackCopy = [];
			x = _stackTop[0];
			y = _stackTop[1];
			for(var i = 0; i < _stackLength - 1; i++) _stackCopy[i] = Stack[i];
			Stack = _stackCopy;
		} else {
			throw "Could not pop from empty stack";	
		}
		return self;
	}
	
	static Anchor = function( _anchor, _bounds, _sign ) {
		var _anchorSign = sign(_sign == undefined ? 1 : _sign);
		if (_anchor.x == fa_center) x += (_bounds.x / 2) * _anchorSign;
		else if (_anchor.x == fa_right) x += _bounds.x * _anchorSign;
		if (_anchor.y == fa_middle) y += (_bounds.y / 2) * _anchorSign;
		else if (_anchor.y == fa_bottom) y += _bounds.y * _anchorSign;
		return self;
	}
	
	static toString = function() {
		return "(" + string(x) + ", " + string(y) + ")";	
	}
	
	if (instanceof(_x) == "Point") {
		x = _x.x;
		y = _x.y;
	} else {
		x = (_x == undefined ? 0 : _x);
		y = (_y == undefined ? 0 : _y);
	}
	Stack = [];
}