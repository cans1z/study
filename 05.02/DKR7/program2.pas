uses graphabc;
uses program1;

begin
    var center := window.center;
    moveto(center.x - 200, center.y - 100); // установка указателя на 100 пикселей выше и на 200 левее центра
    
    a := 0; // начальное значение угла
    
    ClearWindow(); // очистка окна
    
    a := 0; // начальное значение угла
    // отрисовка кривой Минковского
    mink(3, 3000);
    a += Pi / 2;
    mink(3, 3000);
    a += Pi / 2;
    mink(3, 3000);
    a += Pi / 2;
    mink(3, 3000);
    
    Sleep(1000); // пауза
    ClearWindow(); // очистка окна
    moveto(center.x + 100, center.y); // установка указателя
    
    a := Pi; // начальное значение угла
    
    Sleep(1000); // пауза
    CloseWindow(); // закрытие окна
end.