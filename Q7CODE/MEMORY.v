module MEMORY (
    input [8:0] mem_address,
    input write,
    input read,
    input clk,
    input [511:0] din,
    output reg [511:0] dout

);

reg [31:0] ram [0:511];
reg [8:0] address;
integer i;

always @(*) begin
    address = mem_address;

    if (read) begin
        for (i = 0; i < 16; i = i + 1) begin
            if (address > 511) begin
                address = 0;
            end
            dout[i*32 +: 32] = ram[address];
            address = address + 1;
        end
    end

    else if (write) begin
        for (i = 0; i < 16; i = i + 1) begin
            if (address > 511) begin
                address = 0;
            end
            ram[address + i] = din[i*32 +: 32];
            address = address + 1;
        end
    end
end

initial begin
    for (i = 0; i < 512; i = i + 1) begin
    if (i % 16 == 0) begin
        ram[i] = 32'hFFFFFFF0;
    end else if (i % 16 == 1) begin
        ram[i] = 32'hFFFFFFF1;
    end else if (i % 16 == 2) begin
        ram[i] = 32'hFFFFFFF2;
    end else if (i % 16 == 3) begin
        ram[i] = 32'hFFFFFFF3;
    end else if (i % 16 == 4) begin
        ram[i] = 32'hFFFFFFF4;
    end else if (i % 16 == 5) begin
        ram[i] = 32'hFFFFFFF5;
    end else if (i % 16 == 6) begin
        ram[i] = 32'hFFFFFFF6;
    end else if (i % 16 == 7) begin
        ram[i] = 32'hFFFFFFF7;
    end else if (i % 16 == 8) begin
        ram[i] = 32'hFFFFFFF8;
    end else if (i % 16 == 9) begin
        ram[i] = 32'hFFFFFFF9;
    end else if (i % 16 == 10) begin
        ram[i] = 32'hFFFFFFFA;
    end else if (i % 16 == 11) begin
        ram[i] = 32'hFFFFFFFB;
    end else if (i % 16 == 12) begin
        ram[i] = 32'hFFFFFFFC;
    end else if (i % 16 == 13) begin
        ram[i] = 32'hFFFFFFFD;
    end else if (i % 16 == 14) begin
        ram[i] = 32'hFFFFFFFE;
    end else if (i % 16 == 15) begin
        ram[i] = 32'hFFFFFFFF;
    end
end



    for (i = 55; i < 71; i = i + 1) begin
        ram[i] = 32'hFFFFFFFF;
    end

    for (i = 71; i < 87; i = i + 1) begin
        ram[i] = 32'h00000001;
    end

    for (i = 87; i < 103; i = i + 1) begin
        ram[i] = 32'h7FFFFFFF;
    end
    
    for (i = 103; i < 119; i = i + 1) begin
        ram[i] = 32'hAABBCCDD;
    end

    for (i = 119; i < 135; i = i + 1) begin
        ram[i] = 32'hEEDD0011;
    end
end

endmodule

