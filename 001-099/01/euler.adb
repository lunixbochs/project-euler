with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Euler is
    sum:Integer := 0;
begin
    for I in Integer range 1 .. 999 loop
        if I mod 5 = 0 or I mod 3 = 0 then
            sum := sum + I;
        end if;
    end loop;
    Put(sum);
    New_Line;
end Euler;
