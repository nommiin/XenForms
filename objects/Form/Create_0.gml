App = new Application();

framerate = App.Register(new Label(App, {
	Alignment: new Point(fa_right, fa_top),
	Anchor: new Point(fa_right, fa_top),
	Update: function() {
		Value = "FPS: " + string(fps) + " (" + string(fps_real) + ")";
	}
}));

label1 = App.Register(new Label(App, {
	Name: "label1",
	Anchor: new Point(fa_center, fa_top),
	Alignment: new Point(fa_middle, fa_middle),
	Position: new Point(0, 128),
	Value: "Hello World!",
	FontSize: 24,
	Update: function() {
		Position.y = CURSOR.y;
	}	
}));

label2 = App.Register(new Label(label1, {
	Name: "label2",
	Alignment: new Point(fa_center, fa_top),
	Position: new Point(0, 14),
	Value: "Goodbye To A World!"
}));

button1 = App.Register(new Button(App, {
	Anchor: new Point(fa_right, fa_top),
	Alignment: new Point(fa_right, fa_top),
	Position: new Point(-16, 16),
	Size: new Point(256, 32),
	TextAlignment: new Point(fa_center, fa_middle),
	Value: "press me! OwO",
	OnPressed: function() {
		Value = "heehee, you pressed me UwU";
		APP.Find("label1").Value = "you pressed the button!!! ^_^";
		APP.Find("label2").Value = "*nuzzles u* x3";
	}
}));


