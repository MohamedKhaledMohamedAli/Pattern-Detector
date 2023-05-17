module pattern_detector_tb;

    //Setup the clock signal
    parameter clk_prd = 1ns;
    reg clk = 0;

    always #(clk_prd/2) clk = ~clk;

    //Create input/output ports
    reg rst_tb;     //Reset
    reg inp_tb;     //Input Stream
    wire out_tb;    //Output
    wire [32:0] test = 33'b0_1011_0101_0011_0010_1111_0101_0110_1011; //testing values

    //Create instaneous from pattern_detector module
    pattern_detector dut (.clk(clk), .stream_in(inp_tb), .rst(rst_tb), .pattern_found(out_tb));

    //Reset Task
    task reset();

        //Set Reset signal
        rst_tb = 1;

        // Wait to make sure of reseting
        #10;

        //Clear Reset signal
        rst_tb = 0;

        #5;

    endtask

    //testing Task
    task tst(input in);

        //Send a bit to pattern_detector module
        inp_tb = in;

        //Wait a clock period
        #(clk_prd);

        //Display the value
        $display("%d",out_tb);
        
    endtask

    //Iteration Variable
    integer i;

    initial begin
        
        //Reset
        reset();

        //testing
        for(i=0;i<=32;i=i+1) begin
            inp_tb = test[i];
            @(negedge clk);
            $display("%d",out_tb);
        end
            
        //Finish simulation
        $finish();
    end
endmodule