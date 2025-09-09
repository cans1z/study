unit program1;

interface

uses GraphABC;

var
    a: real;// глобальная переменная текущего угла

procedure go_forward(len: real; angle: real);// отрисовка прямой заданной длины и заданного наклона
procedure mink(order: integer; size: real);// отрисовка кривой Минковского

implementation

// отрисовка прямой заданной длины и заданного наклона
procedure go_forward;
var
    cur_pos: array[1..2] of integer;
begin
    cur_pos[1] := penx();
    cur_pos[2] := peny();
    lineto(cur_pos[1] + round(len * cos(angle)), cur_pos[2] + round(len * sin(angle)));
end;

// отрисовка кривой Минковского
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