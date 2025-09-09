program forms5;

var
  year: integer;
  ending: string;

begin
  // user input
  write('enter the number of years: ');
  readln(year);

  // determine the correct word ending
    if (year mod 100) in [11, 12, 13, 14] then
    ending := 'лет'
  else
  begin
    case year mod 10 of
      1: ending := 'год';
      2, 3, 4: ending := 'года';
      else ending := 'лет';
    end;
  end;

  // output result
  writeln(year, ' ', ending);
end.