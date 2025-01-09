`timescale 1ns/1ps
module Risc_16_bit(
 input clk,
 output jump,
 output bne,
 output beq,
 output mem_read,
 output mem_write,
 output alu_src,
 output reg_dst,
 output mem_to_reg,
 output reg_write,
 output [1:0] alu_op,
 output [3:0] opcode
);
 // Internal signals
 wire jump_internal, bne_internal, beq_internal, mem_read_internal, mem_write_internal;
 wire alu_src_internal, reg_dst_internal, mem_to_reg_internal, reg_write_internal;
 wire [1:0] alu_op_internal;
 wire [3:0] opcode_internal;

 // Datapath
 Datapath_Unit DU (
  .clk(clk),
  .jump(jump_internal),
  .beq(beq_internal),
  .mem_read(mem_read_internal),
  .mem_write(mem_write_internal),
  .alu_src(alu_src_internal),
  .reg_dst(reg_dst_internal),
  .mem_to_reg(mem_to_reg_internal),
  .reg_write(reg_write_internal),
  .bne(bne_internal),
  .alu_op(alu_op_internal),
  .opcode(opcode_internal)
 );

 // Control Unit
 Control_Unit control (
  .opcode(opcode_internal),
  .reg_dst(reg_dst_internal),
  .mem_to_reg(mem_to_reg_internal),
  .alu_op(alu_op_internal),
  .jump(jump_internal),
  .bne(bne_internal),
  .beq(beq_internal),
  .mem_read(mem_read_internal),
  .mem_write(mem_write_internal),
  .alu_src(alu_src_internal),
  .reg_write(reg_write_internal)
 );

 // Assign internal signals to module outputs
 assign jump = jump_internal;
 assign bne = bne_internal;
 assign beq = beq_internal;
 assign mem_read = mem_read_internal;
 assign mem_write = mem_write_internal;
 assign alu_src = alu_src_internal;
 assign reg_dst = reg_dst_internal;
 assign mem_to_reg = mem_to_reg_internal;
 assign reg_write = reg_write_internal;
 assign alu_op = alu_op_internal;
 assign opcode = opcode_internal;

endmodule