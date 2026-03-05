module bubble #(parameter 
    BITWIDTH = 3
) (
    input [BITWIDTH-1:0] din,
    input sortit,
    input clk,
    input resetn,
    output logic [8*BITWIDTH:0] dout
);

logic [BITWIDTH-1:0] mem [3]; // 3 memory elements each [Bitwidth - 1 : 0] wide
logic [1:0] count;

always @ (posedge clk) begin
    if(!resetn)begin
        mem[0] <= 0;
        mem[1] <= 0;
        mem[2] <= 0;
        count <= 0;
        dout <= 0;
    end
    else begin
        if(!sortit)begin
            if(count < 2) count <= count + 1;
            else  count <= 0;
            mem[count] = din;
        end
        else begin
            count <= 0;
            dout <= {mem[0],mem[1],mem[2]};
        end
    end
end
logic [BITWIDTH-1:0] temp;

always_comb begin
if(sortit)begin
temp = 0;
for(int j = 0; j < 2; j++)begin
for(int i = 1; i < 3; i ++)begin
if(mem[i] < mem[i-1])begin
    temp = mem[i];
    mem[i] = mem[i-1];
    mem[i-1] = temp;
end
end
end
end
end
endmodule