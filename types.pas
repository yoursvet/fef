unit types;
interface

const n = 100;

  type
  
  
 Date = record
  d:byte;
  m:byte;
  y:word;
  end;
  
 Mountaineer = record
  fn:string[24];
  lan:string[24];
  patr:string[24];
  gen:string[1]; 
  birth:Date;
  id:integer;
  end;
 
  
list_m = array [1..n] of Mountaineer;



implementation

begin 
  
end.