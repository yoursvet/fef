program main;
uses types, Procedures;
var
  f1, f_err1, f3:text;
  m_list:list_m;
  rn:byte;


begin
  assign(f1, 'Mountaineer.txt'); reset(f1);

  assign(f3, 'correct_list.txt'); rewrite(f3);
  
  
  read_f(f1,m_list,rn);
  print(f3,m_list,rn);
  close(f1); 
 
  close(f3);
end.