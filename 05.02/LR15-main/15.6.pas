program zadaca6;

type
  t_chs = set of char;
const
  lett: t_chs = ['a'..'z', 'A'..'Z', '_'];
  num: t_chs = ['0'..'9']; 
var
  str: string;
  i: byte;
  flag: boolean;
begin
  flag := true; 

  write('enter a string: ');
  readln(str);

  // check if the first character is a letter or underscore
  if not (str[1] in lett) then
    flag := false;

  // check the rest of the string
  for i := 2 to length(str) do
  begin
    if not (str[i] in lett + num) then
    begin
      flag := false;
      break; 
    end;
  end;

  // output result
  if flag then
    writeln('string is valid: true')
  else
    writeln('string is invalid: false');
end.