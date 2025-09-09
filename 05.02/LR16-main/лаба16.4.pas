program FindMinMaxInList;

type
  PNode = ^Node;
  Node = record
    value: integer;
    next: PNode;
  end;

var
  Head: PNode;

// functionf of creating node
function CreateNode(NewValue: integer): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.value := NewValue;
  NewNode^.next := nil;
  Result := NewNode;
end;

// adding to the end of the list
procedure AddLast(var Head: PNode; NewNode: PNode);
var
  pp: PNode;
begin
  if Head = nil then
    Head := NewNode
  else
  begin
    pp := Head;
    while pp^.next <> nil do
      pp := pp^.next;
    pp^.next := NewNode;
  end;
end;

// outputting list
procedure PrintList(Head: PNode);
var
  pp: PNode;
begin
  pp := Head;
  while pp <> nil do
  begin
    write(pp^.value, ' ');
    pp := pp^.next;
  end;
  writeln;
end;

// searching maximum and minimum elements
procedure FindMinMax(Head: PNode; var MinValue, MaxValue: integer);
var
  pp: PNode;
begin
  if Head = nil then
  begin
    writeln('Список пуст.');
    exit;
  end;

  MinValue := Head^.value;
  MaxValue := Head^.value;
  pp := Head^.next;

  while pp <> nil do
  begin
    if pp^.value < MinValue then MinValue := pp^.value;
    if pp^.value > MaxValue then MaxValue := pp^.value;
    pp := pp^.next;
  end;
end;

var
  i, x, MinValue, MaxValue: integer;
  NewNode: PNode;
begin
  Head := nil;

  // 1:
  (*
  for i := 1 to 10 do
  begin
    NewNode := CreateNode(i);
    AddLast(Head, NewNode);
  end;
  *)

  // 2:
  (*
  Randomize;
  for i := 1 to 10 do
  begin
    NewNode := CreateNode(Random(100)); // От 0 до 99
    AddLast(Head, NewNode);
  end;
  *)

  // 3:
  writeln('input 10 numbers:');
  for i := 1 to 10 do
  begin
    read(x);
    NewNode := CreateNode(x);
    AddLast(Head, NewNode);
  end;

  writeln('whole list:');
  PrintList(Head);

  // finding minimum and maximum
  FindMinMax(Head, MinValue, MaxValue);
  writeln('minimum element: ', MinValue);
  writeln('maximum element: ', MaxValue);
end.
