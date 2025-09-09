program forms4;

type
    toy = record
        name: string[20]; // limit string length to 20 characters
        price: real;
        age: string[10]; // limit string length to 10 characters
    end;

var
    toys: array[1..3] of toy; // array of 3 toys
    i: integer;
    f: file of toy; // file for writing and reading toys

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

    // writing data to file
    AssignFile(f, 'toy.txt');
    Rewrite(f);
    for i := 1 to 3 do
    begin
        write(f, toys[i]);
    end;
    CloseFile(f);

    // reading data from file and displaying it
    AssignFile(f, 'toy.txt');
    Reset(f);
    writeln('available toys from file:');
    for i := 1 to 3 do
    begin
        read(f, toys[i]);
        with toys[i] do
        begin
            writeln('name: ', name);
            writeln('price: ', price, ' rub.');
            writeln('age range: ', age);
            writeln;
        end;
    end;
    CloseFile(f);
end.
