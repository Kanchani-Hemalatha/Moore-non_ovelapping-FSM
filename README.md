# Moore FSM Non-Overlapping Sequence Detector (1010)

## Overview
This Verilog module implements a **Moore finite state machine (FSM) with non-overlapping sequence detection**. Unlike the overlapping version, this FSM ensures that each detected sequence is counted separately without reusing part of a previous sequence.

## Features
- **Moore FSM**: Output depends only on the current state.
- **Non-Overlapping Sequence Detection**: Ensures strict sequence detection.
- **Five-State Implementation**: Uses states `s0` to `s4`.
- **Clock Synchronous**: State transitions occur on the rising edge of `clk`.
- **Asynchronous Reset**: FSM resets to `s0` when `reset` is high.

## State Diagram
The FSM transitions through five states:

- `s0` (Idle state)
- `s1`, `s2`, `s3` (Intermediate states for pattern detection)
- `s4` (Final state where `dout = 1` is asserted, completing the sequence)

## State Transition Table

| Current State | `din = 0` Next State | `din = 1` Next State | Output `dout` |
|--------------|--------------------|--------------------|------------|
| `s0`        | `s0`               | `s1`               | `0`        |
| `s1`        | `s2`               | `s1`               | `0`        |
| `s2`        | `s0`               | `s3`               | `0`        |
| `s3`        | `s4`               | `s1`               | `0`        |
| `s4`        | `s0`               | `s1`               | `1`        |

## Inputs & Outputs
### Inputs:
- `clk`: Clock signal for synchronous state transitions.
- `reset`: Asynchronous reset to initialize FSM.
- `din`: Serial input bit stream.

### Output:
- `dout`: Output signal, set to `1` only when a full sequence is detected.

## edapalyground link
https://www.edaplayground.com/x/rcf_

## simulation output
![image](https://github.com/user-attachments/assets/6afc46f9-93a5-46e2-a894-3b186b0400d3)

## waveform
![image](https://github.com/user-attachments/assets/a490289a-fa73-41e7-a6ec-863b7050e0c7)

