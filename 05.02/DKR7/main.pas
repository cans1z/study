uses graphabc;
uses fractals;

var size: real ;
var depth: integer;
var _x, _y: integer;

procedure Render();
begin
  ClearWindow();
  var center := Window.Center;
  MoveTo(center.x + _x, center.y + _y);

  a := 0;
    mink(depth, size);
    a += Pi / 2;
    mink(depth, size);
    a += Pi / 2;
    mink(depth, size);
    a += Pi / 2;
    mink(depth, size);
end;

procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Left:  _x := _x - 20;  //move right
    VK_Right: _x := _x + 20;  //move left
    VK_Up:    _y := _y - 20;  //move up
    VK_Down:  _y := _y + 20;  //move down
    VK_PageUp:  depth := depth + 1; //add recursive's depth
    VK_PageDown:  depth := depth - 1;//remove recursive's depth
    VK_Insert: size := size + 500; //add size
    VK_Delete: size := size - 500; //remove size
  end;
  Render(); //call drawing after coordinates change
end;

begin
  //depth := readinteger('input recurison s depth from 1 to 4: ');
  //size := readreal('input fractal s size from 500 to 3000: ');
  //_x := readinteger('input x position: ');
  //_y := readinteger('input y position: ');
  OnKeyDown := KeyDown; //install key handler
  depth := 2;
  size := 1000;
  _x := -100;
  _y := -100;
  Render(); //first render

  while true do
  begin
    Sleep(10); //reducing processor's load
  end;
end.
