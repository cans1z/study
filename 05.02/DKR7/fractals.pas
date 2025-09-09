unit fractals;

interface

uses GraphABC;

var
    a: real; // global variable for the current angle

procedure go_forward(len: real; angle: real); // drawing a line of a given length and angle
procedure mink(order: integer; size: real); // drawing the Minkowski curve

implementation

// drawing a line of a given length and angle
procedure go_forward;
var
    cur_pos: array[1..2] of integer;
begin
    cur_pos[1] := penx();
    cur_pos[2] := peny();
    lineto(cur_pos[1] + round(len * cos(angle)), cur_pos[2] + round(len * sin(angle)));
end;

// drawing the Minkowski curve
procedure mink;
begin
    if order = 0 then
        go_forward(size, a)
    else
    begin
        mink(order - 1, size / 8);
        a -= Pi / 2;
        mink(order - 1, size / 8);
        a += Pi / 2;
        mink(order - 1, size / 8);
        a += Pi / 2;
        mink(order - 1, size / 8);
        mink(order - 1, size / 8);
        a -= Pi / 2;
        mink(order - 1, size / 8);
        a -= Pi / 2;
        mink(order - 1, size / 8);
        a += Pi / 2;
        mink(order - 1, size / 8);
    end;
end;

end.
