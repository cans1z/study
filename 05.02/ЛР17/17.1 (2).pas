program zadaca1;

const
  MAXSIZE = 50;

type
  Stack = record
    tags: array[1..MAXSIZE] of integer; // стек рассчитан на 50 целых чисел
    size: integer; // число элементов
  end;

procedure Push(var S: Stack; x: integer);
begin
  if S.size = MAXSIZE then Exit; // выход, если произошло переполнение стека
  S.size := S.size + 1;
  S.tags[S.size] := x; // добавляем элемент
end;

function Pop(var S: Stack): integer;
begin
  if S.size = 0 then begin
    Result := -1; // -1 - ошибка, стек пуст
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

  // Открываем файл для чтения
  AssignFile(i, 'C:\Users\User\Desktop\www.txt');
  Reset(i);
  
  // Читаем числа из файла и помещаем их в стек
  while not EOF(i) do
  begin
    ReadLn(i, num);
    Push(S, num);
  end;
  
  CloseFile(i);

  // Открываем файл для записи
  AssignFile(f, 'C:\Users\User\Desktop\nnn.txt');
  Rewrite(f);
  
  // Записываем числа в обратном порядке
  while not isEmptyStack(S) do
  begin
    num := Pop(S);
    WriteLn(f, num);
  end;

  CloseFile(f);
  
  WriteLn('Числа успешно записаны в обратном порядке в файл C:\Users\User\Desktop\nnn.txt');
end.
