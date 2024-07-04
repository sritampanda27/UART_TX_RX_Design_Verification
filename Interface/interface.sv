    interface uart_if;
      logic clk;
      logic uclktx;
      logic uclkrx;
      logic rst;
      logic rx;
      logic [7:0] dintx;
      logic newd;
      logic tx;
      logic [7:0] doutrx;
      logic donetx;
      logic donerx;
      
    endinterface