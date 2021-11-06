with
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;
use
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;

procedure challenge is
    B_string : String(1..300) := (others => ' ');
    Sep : String := " ";
    Last_i : Natural;
    Split_i : Integer;
    Alturapulo : Integer;
    Canos : Integer;
    C_atual : Integer;
    P_atual : Integer;

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    Get_Line(Item => B_string, Last => Last_i);
    Split_i := Index(Source => B_string, Pattern => Sep, From => 1);

    Split(Source => B_string, Pos => Split_i, Value => Alturapulo, Remainder => B_string);
    Split(Source => B_string, Pos => B_string'Last, Value => Canos, Remainder => B_string);

    Get_Line(Item => B_string, Last => Last_I);
    
    for I in 1 .. Canos loop
        Split_Idx := Index(Source => B_string, Pattern => Sep, From => 1);
        Split(Source => B_string, Pos => Split_Idx, Value => P_atual, Remainder => B_string);
        if I /= 1 and abs(P_atual - C_atual) > Alturapulo then
            Put_Line("GAME OVER");
            exit;
        end if;
        C_atual := P_atual;
        if I = Canos then
            Put_Line("YOU WIN");
        end if;
    end loop;
end challenge;