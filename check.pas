unit check;
interface
uses types;
//?????
procedure check_fam(s:string; var state:boolean; ln:byte; var fn:string);
procedure check_name(s:string; var state:boolean; ln:byte; var lan:string);
procedure check_patr(s:string; var state:boolean; ln:byte; var patr:string);
procedure check_gen(s:string; var state:boolean; ln:byte; var gen:string);
procedure check_bir(s:string; var state:boolean; ln:byte; var day, mon:byte; var year:word);
procedure check_id(s:string; var state:boolean; ln:byte; var id:integer);

implementation


 procedure check_fam(s:string; var state:boolean; ln:byte; var fn:string);
 var 
   i,l:byte;
   f_len, f_sym:boolean;
   begin
     f_len:=True; f_sym:=True;
     l:=length(s);
     if l > 24 then begin
       writeln('Файл Альпинисты: в ' + ln +' строке длина поля Фамилия ' + s + ' должна быть меньше 24 символов');
       f_len:=False;
       state:=False;
     end;
     i:=2;
      if  not ((s[1] >= 'А') and (s[1] <= 'Я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Фамилия ' +s+ ' первая буква должна быть от А до Я');
         f_sym:=False;
        state:=False;
      end
      else begin
        while (i <= length(s)) and (f_sym = True) do begin
           if not ((s[i] >= 'а') and (s[i] <= 'я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Фамилия ' +s+ ' встречен некорректный символ, должен быть от а до я  ',s[i]);
        f_sym:=False;
        state:=False;
        end;
        inc(i);
        end;
      end;
      if (f_len = True) and (f_sym = True) then fn:=s;
     end;
     
     
   procedure check_name(s:string; var state:boolean; ln:byte; var lan:string);
   var 
   i,l:byte;
   f_len, f_sym:boolean;
   begin
     f_len:=True; f_sym:=True;
     l:=length(s);
     if l > 24 then begin
       writeln('Файл Альпинисты: в ' + ln +' строке длина поля Имя ' + s + ' должна быть меньше 24 символов');
       f_len:=False;
       state:=False;
     end;
     i:=2;
      if  not ((s[1] >= 'А') and (s[1] <= 'Я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Имя ' +s+ ' первая буква должна быть от А до Я');
         f_sym:=False;
        state:=False;
      end
      else begin
        while (i <= length(s)) and (f_sym = True) do begin
           if not ((s[i] >= 'а') and (s[i] <= 'я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Имя ' +s+ ' встречен некорректный символ, должен быть от а до я  ',s[i]);
        f_sym:=False;
        state:=False;
        end;
        inc(i);
        end;
      end;
      if (f_len = True) and (f_sym = True) then lan:=s;
     end;
     procedure check_patr(s:string; var state:boolean; ln:byte; var patr:string);
      var 
   i,l:byte;
   f_len, f_sym:boolean;
   begin
     f_len:=True; f_sym:=True;
     l:=length(s);
     if l > 24 then begin
       writeln('Файл Альпинисты: в ' + ln +' строке длина поля Отчество ' + s + ' должна быть меньше 24 символов');
       f_len:=False;
       state:=False;
     end;
     i:=2;
      if  not ((s[1] >= 'А') and (s[1] <= 'Я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Отчество ' +s+ ' первая буква должна быть от А до Я');
         f_sym:=False;
        state:=False;
      end
      else begin
        while (i <= length(s)) and (f_sym = True) do begin
           if not ((s[i] >= 'а') and (s[i] <= 'я')) then begin
        writeln('Файл Альпинисты: в ' +ln+' строке поля Отчество ' +s+ ' встречен некорректный символ, должен быть от а до я  ',s[i]);
        f_sym:=False;
        state:=False;
        end;
        inc(i);
        end;
      end;
      if (f_len = True) and (f_sym = True) then patr:=s;
     end;
      
     procedure check_gen(s:string; var state:boolean; ln:byte; var gen:string);
    begin
      if (s <> 'М') and (s <> 'Ж') then begin
        writeln('Файл Альпинисты: в ' +ln+' поле пол ' +s+ ' Неверно указан пол. Это поле может принимать значение только «М» или «Ж»');
        state:=False;
      end
      else if length(s) > 1 then begin
        writeln('Файл Альпинисты: в ' +ln+' поле пол ' +s+ ' Недопустимая длина');
        state:=False
      end
      else gen:=s;
    end;
    
    
    
    procedure check_bir(s:string; var state:boolean; ln:byte; var day, mon:byte; var year:word);
    var d, m, y:string;
    dd, mm, yy:word;
    k:byte;
    i:integer;
    flag:boolean;
    begin
      if(length(s) <> 10) then begin
        writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Недопустимая длина');
        state:=False;
      end
      else begin
        if(s[3] <> '.') or (s[6] <>'.') then begin
          writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Недопустимый разделитель');
          state:=False;
        end
        else begin
          i:=1;
          k:=1;
          flag:=True;
          while (i <=length(s)) and flag do begin
            if (i=3) or (i=6) then inc(k)
            else
              if (s[i] >='0') and (s[i] <='9') then 
                case k of
                  1: d :=d + s[i];
                  2: m :=m + s[i];
                  3: y :=y + s[i];
                end
                else begin
                  writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Недопустимые символы');
                  state:=False;
                  flag:=False;
                end;
                inc(i);
          end;
          val(d, dd, i);
          val(m, mm, i);
          val(y, yy, i);
          if (yy < 1935) or (yy > 2022) then begin
            writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Неверно указан год. Это поле может принимать [1935..2004]');
            state:=False;
          end
          else
            if (mm < 1) or  (mm > 12) then begin
              writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Неверное указан месяц. Это поле может принимать значения от [01..12]');
              state:=False;
            end
            else begin
              case mm of
               1, 3, 5, 7, 8, 10, 12:
                if (dd < 1) or (dd > 31) then begin
                  writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Неверное указан день. Это поле может принимать значения [01..31]');
                  state:=False;
                end;
                4, 6, 9, 11:
                if (dd < 1) or (dd > 30) then begin
                  writeln('Файл Альпинисты: в ' +ln+' поле дата рождения ' +s+ ' Неверное указан день. Это поле может принимать значения [01..30]');
                  state:=False;
                end;
                {  2: begin
              if (yy mod 4 = 0) and ((yy mod 100 <> 0) or (yy mod 400 = 0)) and ((dd < 1) or (dd > 29)) then begin
                writeln('Файл Альпинисты: в ' + ln+ ' в поле дата рождения' + s+ ' значение дня должно входить в область допустимых значений [1..29]');
                state:= False;
              end;
              if (yy mod 4 <> 0) or ((yy mod 100 = 0) and (yy mod 400 <> 0)) and ((dd < 1) or (dd > 28)) then begin
                writeln('Файл Альпинисты: в ' + ln + ' в поле дата рождения' +s+ 'значение дня должно входить в область допустимых значений [1..28]');
                state:= False;
                    end;
                  end;}
                  
                end;
             
              if state then begin
                day := dd;
                mon := mm;
                year := yy;
         end;
         end;
         end;
         end;
         end;
   
   procedure check_id(s:string; var state:boolean; ln:byte; var id:integer);
  var
    err, idd,ls:integer;
    begin
      val(s,idd,err);
      ls:=length(s);
      if ( err<>0) then begin
        writeln('Файл Альпинисты: в ' + ln + ' строке в поле номера личной карточки ' + s + ' встречен недопустимый символ');
        state:=False;
      end
      else 
        if ls > 5 then begin
          writeln('Файл Альпинисты: в ' + ln + ' строке в поле номера личной карточки ' + s + ' недопустимая длина');
          state:=False;
        end
        else
          if ( idd < 10000) and (idd > 99999) then begin
            writeln('Файл Альпинисты: в ' + ln + ' строке в поле номера личной карточки ' + s + ' превышение диапазона');
            state:=False;
          end
          else 
            id:=idd;
          end;
    
     
  
     begin
       
     
   end.