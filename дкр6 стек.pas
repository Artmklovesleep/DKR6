Uses GraphABC;
const
stacksize = 10;
type
elemtype = integer;
stack = record
elems: array [1..stacksize] of elemtype;
top: integer
end;
var S: stack;

procedure push (var S: stack;x:elemtype);
Begin
S.top:=S.top+1;
if S.top > stacksize then
x:=-32767
else
S.elems[S.top]:=x;
end;

procedure pop (var S: stack; var x:elemtype);
begin
if S.top > stacksize then
x:=-32767
else
begin
if S.top = 0 then
x:=-32767
else begin
x:=S.elems[S.top];
S.elems[S.top]:=0;
S.top:=S.top-1;
end;
end;
end;

function Stacktop : integer;
begin
if S.top > stacksize then
Stacktop := -32767
else
begin
if S.top = 0 then
Stacktop := -32767
else Stacktop := S.elems[S.top];
end;
end;

procedure init_stack (var S: stack);
begin
for var i:=1 to 10 do
S.elems[i]:=0;
S.top:=0;
end;

function full_stack(var S: stack):boolean;
Begin
full_stack:=S.top=stacksize
end;

function empty_stack(var S: stack):boolean;
Begin
empty_stack:=S.top=0
end;
procedure menu(var a: integer);
begin
clearwindow;
textout(10, 10, 'Выберите действие: ');
textout(10, 30, '1 - Кошмар ');
textout(10, 50, '2 - Добавление в стек ');
textout(10, 70, '3 - Просмотр верхнего элемента');
textout(10, 90, '4 - Вытолкнуть и посмотреть верхний элемент');
textout(10, 110, '5 - Очистка стека');
textout(10, 130, '6 - Просмотр содержимого стека ');
textout(10, 150, '7 - Конец');
read(a);
clearwindow;
end;

begin
var stakk: integer;
menu(stakk);
while true do
begin
case stakk of
1: begin textout(10, 10, 'Кошмар!');sleep(3000); menu(stakk); end;
2: begin var x:integer; textout(10, 10, 'Введите число для добавления в стек'); x:= readinteger (); push(s,x); if x =-32767 then begin textout(10, 10, 'Нельзя втолкнуть число');sleep(3000); end; menu(stakk); end;
3: begin var c:=stacktop; if c =-32767 then textout(10, 10, 'Верхнего числа в стеке нет') else begin
var l,v:string;
str(c, v);
l:='Верхнее число: '+ v;
textout(10, 10, l);end; sleep(3000); menu(stakk); end;
4: begin var x:integer; pop(s,x);if x =-32767 then textout(10, 10, 'Ошибка. Стек либо пуст либо переполнен') else begin
var l,v:string;
str(x, v);
l:='Вытолкнули верхнее число: '+ v;
textout(10, 10, l);end; sleep(3000); menu(stakk); end;
5: begin init_stack(s);textout(10, 10, 'Очистка выполнена успешно');sleep(3000); menu(stakk); end;
6: begin textout(10, 10, s.elems[10]); textout(10, 30, s.elems[9]); textout(10, 50, s.elems[8]); textout(10, 70, s.elems[7]); textout(10, 90, s.elems[6]); textout(10, 110, s.elems[5]); textout(10, 130, s.elems[4]); textout(10, 150, s.elems[3]); textout(10, 170, s.elems[2]); textout(10, 190, s.elems[1]);
sleep(3000); menu(stakk); end;
7: begin textout(10, 10,'Спасибо за внимание'); textout(10, 30,'Нажмите Enter чтобы выйти из приложения...'); exit; end;
else begin textout(10, 10, 'Таких функций не бывает, попробуй еще раз');sleep(3000); menu(stakk); end;
end;
end;
end.