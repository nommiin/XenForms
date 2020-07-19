function Container( _parent, _data ) : Control( _parent, _data ) constructor {
	// Members
	Size = new Point(0, 0);
	
	// Control
	Parent = _parent;
	AnchorAlignment = false;
	Initialize(self, _data);
}