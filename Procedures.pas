unit Procedures;
interface
uses types, check;

procedure read_f(f1:text; var m_list:list_m; var rn:byte);
procedure print(f3:text; m_list:list_m; rn:integer);

implementation

procedure read_f(f1:text; var m_list:list_m; var rn:byte);
var
  s1,s:string;
  day,mon,i,fiN,len:byte;
  ln:byte;
  flag,state,corLin:boolean;
  alp: Mountaineer;
  fn,lan,patr,gen:string;
  year:word;
  id:integer;
  
  begin
    ln:=1;
    rn:=0;
    corLin:=True;
    while (not eof(f1)) and (corLin= True) do begin
      if ln> n then begin
        writeln('Файл Альпинисты: в' + n + 'верных строк, обработано заканчивается');
        corLin:=False;
        end
        else begin 
          readln(f1,s);
          len:=length(s);
          if len < 22 then writeln('Файл Альпинисты : в ' + ln+ 'строке недостаточное количество данных')
          else begin
            if s[1] = ' ' then writeln('Файл Альпинситы: в' + ln + 'в строке в начале стоят пробелы')
            else begin
              s:=s+' ';
              fiN:=1;
              s1:='';
              i:=1;
              flag:=True;
              state:=True;
              while (i <= len +1) and (flag = True) and (flag=True) and (fiN <=7) do begin
                if s[i] <> ' ' then s1:=s1+s[i]
                else begin
                  if s1 = '' then begin
                    writeln('Файл альпинситы: в' + ln + ' строке между полями встречается больше одного пробелма');
                    flag:=False;
                    state:=False;
                  end
                  else begin
                    case fiN of
                      1: begin 
                        check_fam(s1,state,ln,fn);
                        alp.fn:=fn;
                      end;
                      2: begin
                        check_name(s1,state,ln,lan);
                        alp.lan:=lan;
                      end;
                      3: begin
                        check_patr(s1,state,ln,patr);
                        alp.patr:=patr;
                      end;
                      4: begin
                        check_gen(s1,state,ln,gen);
                        alp.gen:=gen;
                      end;
                      5: begin
                        check_bir(s1,state,ln,day,mon,year);
                        alp.birth.d:=day;
                        alp.birth.m:=mon;
                        alp.birth.y:=year;
                      end;
                      6: begin 
                        check_id(s1,state,ln,id);
                        alp.id:=id;
                      end;
                    end;
                    s1:='';
                    inc(fiN);
                  end;
                end;
                inc(i);
              end;
              if state=True then begin
                inc(rn);
                m_list[rn]:=alp;
              end;
            end;
          end;
          inc(ln);
        end;
    end;
    writeln;
    end;
    
    procedure print(f3:text; m_list:list_m; rn:integer);
    var
      j:byte;
     
      begin
      for j:=1 to rn do begin
        
          write(f3, m_list[j].fn + ' ');
          write(f3, m_list[j].lan + ' ');
          write(f3, m_list[j].patr + ' ');
          write(f3, m_list[j].gen + ' ');
          write(f3, m_list[j].birth.d + '.');
          write(f3, m_list[j].birth.m + '.');
          write(f3, m_list[j].birth.y + ' ');
          write(f3, m_list[j].id + ' ');
          writeln(f3, '');
      end;
      end;

    begin 
     
    
  end.