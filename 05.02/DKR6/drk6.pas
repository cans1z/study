program DoublyLinkedList;

const
  MAX_SIZE = 10;

type
  Node = record
    data: Integer;
    prev, next: Integer;
  end;

var
  List: array[1..MAX_SIZE] of Node;
  head, tail, free: Integer;

procedure InitList;
var
  i: Integer;
begin
  head := 0;
  tail := 0;
  free := 1;
  for i := 1 to MAX_SIZE - 1 do
  begin
    List[i].next := i + 1;
    List[i].prev := 0;
  end;
  List[MAX_SIZE].next := 0;
  List[MAX_SIZE].prev := 0;
end;

function AllocateNode: Integer;
begin
  if free = 0 then
  begin
    AllocateNode := 0;
    Exit;
  end;
  AllocateNode := free;
  free := List[free].next;
end;

procedure DeallocateNode(index: Integer);
begin
  List[index].next := free;
  free := index;
end;

procedure InsertFront(value: Integer);
var
  newIndex: Integer;
begin
  newIndex := AllocateNode;
  if newIndex = 0 then
  begin
    Writeln('No free space available.');
    Exit;
  end;
  List[newIndex].data := value;
  List[newIndex].prev := 0;
  List[newIndex].next := head;
  if head <> 0 then
    List[head].prev := newIndex;
  head := newIndex;
  if tail = 0 then
    tail := newIndex;
end;

procedure InsertBack(value: Integer);
var
  newIndex: Integer;
begin
  newIndex := AllocateNode;
  if newIndex = 0 then
  begin
    Writeln('No free space available.');
    Exit;
  end;
  List[newIndex].data := value;
  List[newIndex].next := 0;
  List[newIndex].prev := tail;
  if tail <> 0 then
    List[tail].next := newIndex;
  tail := newIndex;
  if head = 0 then
    head := newIndex;
end;

procedure DeleteFront;
var
  temp: Integer;
begin
  if head = 0 then
  begin
    Writeln('List is empty.');
    Exit;
  end;
  temp := head;
  head := List[head].next;
  if head <> 0 then
    List[head].prev := 0
  else
    tail := 0;
  DeallocateNode(temp);
end;

procedure DeleteBack;
var
  temp: Integer;
begin
  if tail = 0 then
  begin
    Writeln('List is empty.');
    Exit;
  end;
  temp := tail;
  tail := List[tail].prev;
  if tail <> 0 then
    List[tail].next := 0
  else
    head := 0;
  DeallocateNode(temp);
end;

procedure DisplayList;
var
  current: Integer;
begin
  current := head;
  if current = 0 then
  begin
    Writeln('List is empty.');
    Exit;
  end;
  while current <> 0 do
  begin
    Write(List[current].data, ' <-> ');
    current := List[current].next;
  end;
  Writeln('NULL');
end;

var
  choice, value: Integer;
begin
  InitList;
  repeat
    Writeln('1. Insert Front');
    Writeln('2. Insert Back');
    Writeln('3. Delete Front');
    Writeln('4. Delete Back');
    Writeln('5. Display List');
    Writeln('0. Exit');
    Write('Enter choice: ');
    Readln(choice);
    case choice of
      1: begin
           Write('Enter value: ');
           Readln(value);
           InsertFront(value);
         end;
      2: begin
           Write('Enter value: ');
           Readln(value);
           InsertBack(value);
         end;
      3: DeleteFront;
      4: DeleteBack;
      5: DisplayList;
    end;
  until choice = 0;
end.