program g;

const
  MaxSize = 50;

type
  Stack = record
    tags: array[1..MaxSize] of integer; 
    size: integer; // elements' quantity
  end;

procedure Push(var S: Stack; x: integer);
begin
  if S.size = MaxSize then Exit; 
  S.size := S.size + 1;
  S.tags[S.size] := x; // adding element
end;

function Pop(var S: Stack): integer;
begin
  if S.size = 0 then begin
    Result := -1; // stack is empty
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack(S: Stack): Boolean;
begin
  Result := (S.size = 0);
end;

var
  S: Stack;
  num: integer;
  i, f: TextFile;
begin
  S.size := 0;

  
  AssignFile(i, 'input.txt');
  Reset(i);
  
  // Читаем числа из файла и помещаем их в стек
  while not EOF(i) do
  begin
    ReadLn(i, num);
    Push(S, num);
  end;
  
  CloseFile(i);

  AssignFile(f, 'output.txt');
  Rewrite(f);
  
  while not isEmptyStack(S) do
  begin
    num := Pop(S);
    WriteLn(f, num);
  end;

  CloseFile(f);
  
  WriteLn('numbers have been written in reverse order in file');
end.
