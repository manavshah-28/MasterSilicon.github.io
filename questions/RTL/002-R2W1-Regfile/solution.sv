module model #(parameter 
    DATA_WIDTH = 16
) (
    input [DATA_WIDTH-1:0] din,
    input [4:0] wad1,
    input [4:0] rad1, rad2,
    input wen1, ren1, ren2,
    input clk,
    input resetn,
    output logic [DATA_WIDTH-1:0] dout1, dout2,
    output logic collision
);

logic [DATA_WIDTH-1:0] mem [32];

always @(posedge clk)begin
    if(!resetn)begin
        dout1 <= 0;
        dout2 <= 0;
        collision <= 0;
    end
    else begin
        // no op
        if(!wen1 & !ren1 & !ren2)begin
            dout1 <= 0;
            dout2 <= 0;
            collision <= 0;
        end
        // 1 op
        // write 
        else if(wen1 & !ren1 & !ren2)begin
            mem[wad1] = din;
            dout1 <= 0;
            dout2 <= 0;
            collision <= 0;
        end
        // read 1
        else if(!wen1 & ren1 & !ren2)begin
            dout1 <= mem[rad1];
            dout2 <= 0;
            collision <= 0;
        end
        // read 2
        else if(!wen1 & !ren1 & ren2)begin
            dout1 <= 0;
            dout2 <= mem[rad2];
            collision <= 0;
        end
        // 2 op
        // read 1 and read 2
        else if(!wen1 & ren1 & ren2)begin
            if(rad1 == rad2)begin
                dout1 <= 0;
                dout2 <= 0;
                collision <= 1;
            end
            else begin
                dout1 <= mem[rad1];
                dout2 <= mem[rad2];
                collision <= 0;
            end
        end
        // write and read 1
        else if(wen1 & ren1 & !ren2)begin
            if(wad1 == rad1)begin
                dout1 <= 0;
                dout2 <= 0;
                collision <= 1;
            end
            else begin
                mem[wad1] = din;
                dout1 <= mem[rad1];
                dout2 <= 0;
                collision <= 0;
            end
        end
        // write and read 2 
        else if(wen1 & !ren1 & ren2)begin
            if(wad1 == rad2)begin
                dout1 <= 0;
                dout2 <= 0;
                collision <= 1;
            end
            else begin
                mem[rad1] = din;
                dout1 <= 0;
                dout2 <= mem[rad2];
                collision <= 0;
            end
        end
        // 3 op
        else if(wen1 & ren1 & ren2) begin
            // write and read to same address
            if(wad1 == rad1) begin
                dout1 <= 0;
                dout2 <= mem[rad2];
                collision <= 1;
            end
            else if(wad1 == rad2) begin
                dout1 <= mem[rad1];
                dout2 <= 0;
                collision <= 1;
            end
            else if(rad1 == rad2) begin
                mem[wad1] <= din;
                dout1 <= 0;
                dout2 <= 0;
                collision <= 1;
            end
            else if(wad1 == rad1 == rad2)begin
                dout1 <= 0;
                dout2 <= 0;
                collision <= 1;
            end
        end
    end
end
endmodule