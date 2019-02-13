//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Nov 13 22:40:17 2018
//Host        : DESKTOP-2R46888 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (clk_100MHz,
    reset_rtl_0,
    reset_rtl_0_0);
  input clk_100MHz;
  input reset_rtl_0;
  input reset_rtl_0_0;

  wire clk_100MHz;
  wire reset_rtl_0;
  wire reset_rtl_0_0;

  system system_i
       (.clk_100MHz(clk_100MHz),
        .reset_rtl_0(reset_rtl_0),
        .reset_rtl_0_0(reset_rtl_0_0));
endmodule
