module traffic_signal (
    input clk, // clk input
    output reg [2:0] led // 110 G, 101 B, 011 R
);

reg [31:0] counter; 
localparam red_time = 32'd240_000_000;
localparam blue_time = 32'd48_000_000;
localparam green_time = 32'd120_000_000;

always @(posedge clk) begin
    
    if (counter < red_time)  // 10 saniye boyunca kırmızı yanacak
        led = 3'b011;
    else if (counter == red_time)
        led[2:0] = {led[0] , led[2:1]};
    else if (counter < red_time + blue_time)  // 2 saniye boyunca mavi yanacak
        led = 3'b101;
    else if (counter == red_time + blue_time)
        led[2:0] = {led[2] , led[0] , led[1]};
    else if (counter < red_time + blue_time + green_time)  // 5 saniye boyunca yeşil yanacak
        led = 3'b110;
    else if (counter == red_time + blue_time + green_time)begin
        led[2:0] = {led[0] , led[2:1]};
        counter = 0;
    end
    counter <= counter + 1;
       
end
endmodule