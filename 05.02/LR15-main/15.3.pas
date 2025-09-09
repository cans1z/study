program forms3;

type
    toy = record
        name: string;
        price: integer;
        age: string;
    end;

var
    toys: array[1..3] of toy;
    i: integer;

begin
    // initializing toy data
    with toys[1] do
    begin
        name := 'rubiks cube';
        price := 300;
        age := '8-15 years';
    end;

    with toys[2] do
    begin
        name := 'toy soldier';
        price := 100;
        age := '0-5 years';
    end;

    with toys[3] do
    begin
        name := 'battleship';
        price := 700;
        age := '6-12 years';
    end;

    // output toy list
    writeln('available toys:');
    for i := 1 to 3 do
    begin
        with toys[i] do
        begin
            writeln('name: ', name);
            writeln('price: ', price, ' rub.');
            writeln('age range: ', age);
            writeln;
        end;
    end;
end.
