
//================================================================================================
//                  MOORE NON-OVERLAPPING MODULE DEFINITION								  
//================================================================================================
module moore_fsm_nonoverlapping(input clk,input reset,input din,output reg dout);
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  
    reg[2:0] current_state,next_state;
  
  always@(posedge clk or posedge reset)begin
    if(reset)
      
    current_state<=s0;
    
    else
      
    current_state<=next_state;
  end
  always@(*)begin
   case(current_state)
     
       s0:  if(din)begin
              next_state=s1;end
           else begin
              next_state=s0;
           end
     
        s1:  if(din)begin
               next_state=s1;end
          else begin
               next_state=s2;
          end
     
        s2:  if(din)begin
                 next_state=s3;end
            else begin
                 next_state=s0;
            end
     
         s3: if(din)begin
                 next_state=s1;end
             else begin
                next_state=s4;
             end
     
        s4: if(din)begin
               next_state=s1;end
            else begin
               next_state=s0;
            end
     
        default:next_state=s0; 
     endcase
  end
  always@(current_state)begin
      case(current_state)
        s0:dout=0;
        s1:dout=0;
        s2:dout=0;
        s3:dout=0;
        s4:dout=1;
        default:dout=0;  
     endcase
  end
endmodule:moore_fsm_nonoverlapping
