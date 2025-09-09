program AlphabetFrequencyDictionary;


type
  PNode = ^Node;
  Node = record
    word: string[40];
    count: integer;
    next: PNode;
  end;

var
  Head: PNode;
  F: Text;

function CreateNode(NewWord: string): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure AddAfter(var p: PNode; NewNode: PNode);
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var
  pp: PNode;
begin
  if p = Head then
    AddFirst(Head, NewNode)
  else
  begin
    pp := Head;
    while (pp <> nil) and (pp^.next <> p) do
      pp := pp^.next;
    if pp <> nil then
      AddAfter(pp, NewNode);
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;
var
  pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var
  pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

function TakeWord(var F: Text): string;
var
  c: char;
begin
  Result := '';
  while not eof(F) do
  begin
    read(F, c);
    if c > ' ' then
      break;
  end;
  while not eof(F) and (c > ' ') do
  begin
    Result := Result + c;
    read(F, c);
  end;
end;

procedure PrintList(Head: PNode);
var
  pp: PNode;
  count: integer;
begin
  pp := Head;
  count := 0;
  while pp <> nil do
  begin
    writeln(pp^.word, ': ', pp^.count);
    inc(count);
    pp := pp^.next;
  end;
  writeln('total unique words: ', count);
end;

var
  WordStr: string;
  ExistingNode, NewNode, PlaceNode: PNode;
begin

  Assign(F, 'input.txt');
  Reset(F);
  Head := nil;

  while not eof(F) do
  begin
    WordStr := TakeWord(F);
    if WordStr = '' then
      continue;

    ExistingNode := Find(Head, WordStr);
    if ExistingNode <> nil then
      inc(ExistingNode^.count)
    else
    begin
      NewNode := CreateNode(WordStr);
      PlaceNode := FindPlace(Head, WordStr);
      AddBefore(Head, PlaceNode, NewNode);
    end;
  end;
  
  Close(F);
  PrintList(Head);
end.
