class monitor;
 
  transaction tr;
  
  mailbox #(bit [7:0]) mbx;
  
  bit [7:0] srx; 
  bit [7:0] rrx; 
  
 
  
  virtual uart_if vif;
  
  
  function new(mailbox #(bit [7:0]) mbx);
    this.mbx = mbx;
    endfunction
  
  task run();
    
    forever begin
     
       @(posedge vif.uclktx);
      if ( (vif.newd== 1'b1) && (vif.rx == 1'b1) ) 
                begin
                  
                  @(posedge vif.uclktx); ////start collecting tx data from next clock tick
                  
              for(int i = 0; i<= 7; i++) 
              begin 
                    @(posedge vif.uclktx);
                    srx[i] = vif.tx;
                    
              end
 
                  
                  $display("[MON] : DATA SEND on UART TX %0d", srx);
                  
                  //////////wait for done tx before proceeding next transaction                
                @(posedge vif.uclktx); //
                mbx.put(srx);
                 
               end
      
      else if ((vif.rx == 1'b0) && (vif.newd == 1'b0) ) 
        begin
          wait(vif.donerx == 1);
           rrx = vif.doutrx;     
           $display("[MON] : DATA RCVD RX %0d", rrx);
           @(posedge vif.uclktx); 
           mbx.put(rrx);
      end
  end  
endtask
  
 
endclass