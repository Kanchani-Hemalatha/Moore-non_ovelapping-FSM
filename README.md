# Moore-non_ovelapping-FSM
The moore_fsm_nonoverlapping module follows the Moore state machine principle, where the output depends only on the current state. It consists of five states
# Moore Non-Overlapping FSM

## Overview
This repository contains the Verilog implementation of a **Moore Non-Overlapping Finite State Machine (FSM)**. The FSM detects a specific sequence of input bits and produces an output based on its current state.

## Module Description
The `moore_fsm_nonoverlapping` module follows the Moore state machine principle, where the output depends only on the current state. It consists of five states:

- `s0`: Initial state
- `s1`: Transition state
- `s2`: Transition state
- `s3`: Transition state
- `s4`: Final state (Output `dout = 1`)

The FSM transitions through these states based on the input `din` and resets to `s0` when `reset` is high.

## State Transition Table
| Current State | Input (din) | Next State | Output (dout) |
|--------------|------------|------------|--------------|
| `s0` | 0 | `s0` | 0 |
| `s0` | 1 | `s1` | 0 |
| `s1` | 0 | `s2` | 0 |
| `s1` | 1 | `s1` | 0 |
| `s2` | 0 | `s0` | 0 |
| `s2` | 1 | `s3` | 0 |
| `s3` | 0 | `s4` | 0 |
| `s3` | 1 | `s1` | 0 |
| `s4` | 0 | `s0` | 1 |
| `s4` | 1 | `s1` | 1 |

## Verilog Code
```verilog
module moore_fsm_nonoverlapping(input clk, input reset, input din, output reg dout);
    parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
    
    reg [2:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= s0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            s0: next_state = (din) ? s1 : s0;
            s1: next_state = (din) ? s1 : s2;
            s2: next_state = (din) ? s3 : s0;
            s3: next_state = (din) ? s1 : s4;
            s4: next_state = (din) ? s1 : s0;
            default: next_state = s0;
        endcase
    end

    always @(current_state) begin
        case (current_state)
            s0, s1, s2, s3: dout = 0;
            s4: dout = 1;
            default: dout = 0;
        endcase
    end
endmodule
```

## Simulation
To verify the FSM behavior, you can create a testbench in Verilog. Ensure that:
- The FSM correctly transitions through the defined states.
- The output `dout` follows the Moore FSM principle.
- The reset functionality properly initializes the FSM to `s0`.

## How to Use
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/moore_fsm_nonoverlapping.git
   ```
2. Open the Verilog file in a simulator (e.g., ModelSim, Xilinx Vivado, Quartus).
3. Run the testbench to observe state transitions.

## edapalyground link
https://www.edaplayground.com/x/rcf_

## simulation output
![image](https://github.com/user-attachments/assets/6afc46f9-93a5-46e2-a894-3b186b0400d3)

## waveform
![image](https://github.com/user-attachments/assets/bbd2cfbe-8816-4950-acdb-49df1ca94881)

