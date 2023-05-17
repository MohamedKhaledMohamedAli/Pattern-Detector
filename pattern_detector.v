module pattern_detector (
    input clk,
    input rst,
    input stream_in,
    output reg pattern_found
);

    parameter state_reg_width = 3;
    parameter [state_reg_width-1 : 0]   state       = 3'b000,
                                        state_1     = 3'b001,
                                        state_11    = 3'b010,
                                        state_110   = 3'b011,
                                        state_1101  = 3'b100,
                                        state_11010 = 3'b101;

    reg [state_reg_width-1 : 0] curr_state, next_state;

    always @(posedge clk or posedge rst) begin

        if(rst) begin
            curr_state <= state;
        end
        else begin
            curr_state <= next_state;
        end
    end

    always @(*) begin

        //default value
        pattern_found = 0;

        case (curr_state)
        state: begin
            if(stream_in == 1) begin
                next_state = state_1;
            end
            else begin
                next_state = curr_state;
            end
        end
        state_1: begin
                if(stream_in == 1) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state;
                end
            end
            state_11: begin
                if(stream_in == 0) begin
                    next_state = state_110;
                end
                else begin
                    next_state = curr_state;
                end
            end
            state_110: begin
                if(stream_in == 1) begin
                    next_state = state_1101;
                end
                else begin
                    next_state = state;
                end
            end
            state_1101: begin
                if(stream_in == 0) begin
                    next_state = state_11010;
                end
                else begin
                    next_state = state_11;
                end
            end
            state_11010: begin
                if(stream_in == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state;
                end

                //Set output for 1 clk cycle
                pattern_found = 1;
            end
        endcase
    end
endmodule