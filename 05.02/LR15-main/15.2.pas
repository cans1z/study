program forms2;

type
  form = record
  fml: string;
  birth: string;
  course: 1..5;
  end;

var
  students: array[1..52] of form; // array to store student data
  i, n: integer; // n - number of students

begin
  writeln('enter the number of students:');
  readln(n);
  
  if (n < 1) or (n > 52) then
  begin
    writeln('error: the number of students must be between 1 and 52.');
    exit;
  end;

  for i := 1 to n do
  begin
    writeln('enter student ', i, ' full name:');
    readln(students[i].fml);
    
    writeln('enter student ', i, ' birth date:');
    readln(students[i].birth);
    
    writeln('enter student ', i, ' course:');
    readln(students[i].course);
  end;

  writeln('student records:');
  for i := 1 to n do
  begin
    writeln('student ', i, ':');
    writeln('name: ', students[i].fml);
    writeln('birth date: ', students[i].birth);
    writeln('course: ', students[i].course);
    writeln; 
  end;
end.