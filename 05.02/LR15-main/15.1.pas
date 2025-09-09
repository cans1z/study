program forms;

type
  form = record
  fml: string;
  birth: string;
  course: 1..5;
  end;

var
  student: form;

begin
  // input student data
  writeln('enter student''s full name:');
  readln(student.fml);
  
  writeln('enter student''s birth date:');
  readln(student.birth);
  
  writeln('enter student''s course (1-5):');
  readln(student.course);
  
  // output student form
  writeln('student form:');
  writeln('name: ', student.fml);
  writeln('birth date: ', student.birth);
  writeln('course: ', student.course);2
end.
