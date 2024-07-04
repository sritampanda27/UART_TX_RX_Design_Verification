class transaction;
  
  typedef enum bit  {write = 1'b0 , read = 1'b1} oper_type;
  
  randc oper_type oper;
  
  bit rx;
  
  rand bit [7:0] dintx;
  
  bit newd;
  bit tx;
  
  bit [7:0] doutrx;
  bit donetx;
  bit donerx;
  
 
  
  function transaction copy();
    copy = new();
    copy.rx = this.rx;
    copy.dintx = this.dintx;
    copy.newd = this.newd;
    copy.tx = this.tx;
    copy.doutrx = this.doutrx;
    copy.donetx = this.donetx;
    copy.donerx = this.donerx;
    copy.oper = this.oper;
  endfunction
  
endclass