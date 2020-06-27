wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb06/b06167/DSD_Final/Extension/L2Cache/nb20incre3/Final.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 1881534.357374 -snap {("G1" 3)}
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 2064557.088155 -snap {("G1" 2)}
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 1394461.247688 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1398659.374640 -snap {("G1" 2)}
wvResizeWindow -win $_nWave1 0 23 1536 801
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1536 801
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvExpandBus -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 23 24 25 26 27 28 29 30 31 32 33 34 35 36 \
           37 38 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 1400455.475167 -snap {("G1" 9)}
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 2247623.314472 -snap {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 14 15 )} 
wvSetCursor -win $_nWave1 2245514.654016 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 2245514.654016 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 10 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 8 10 14 15 )} 
wvSetCursor -win $_nWave1 36450508.571864 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 28271536.122336 -snap {("G1" 7)}
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1433626.645662 -snap {("G1" 8)}
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 33932821.843372 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 14 15 )} 
wvSetRadix -win $_nWave1 -format Hex
wvSelectSignal -win $_nWave1 {( "G1" 11 12 14 15 )} 
wvSetRadix -win $_nWave1 -format Hex
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/aluctrl_ex\[3:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/aluctrl_ex\[3:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalClose -win $_nWave1
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetCursor -win $_nWave1 6274528.051910 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 6275414.871728 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 6274539.000303 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 6275480.562085 -snap {("G1" 18)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 36450485.345975 -snap {("G1" 9)}
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 10 )} 
wvSearchNext -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 10372.507353 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 15764502.175604 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 17 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 12 17 18 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA_n\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB_n\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 21 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA_n\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB_n\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 21 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSelectSignal -win $_nWave1 {( "G1" 14 15 20 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 20 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 17 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 15 17 18 )} {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 15787873.989180 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 15788500.107250 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 15787658.761094 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 15788451.191776 -snap {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetCursor -win $_nWave1 15789466.677019 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 15788429.668965 -snap {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 17 18 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_regwrite} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_regwrite} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Final_tb"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/ALU"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/Registers"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV/forwarding_unit"
wvGetSignalSetScope -win $_nWave1 "/Final_tb/chip0/i_RISCV"
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_regwrite} \
{/Final_tb/chip0/i_RISCV/regwrite_wb} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Final_tb/chip0/i_RISCV/clk} \
{/Final_tb/chip0/i_RISCV/pc\[8:0\]} \
{/Final_tb/chip0/i_RISCV/hazard_flush} \
{/Final_tb/chip0/i_RISCV/hazard_mux} \
{/Final_tb/chip0/i_RISCV/hazard_stall} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[0:31\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[9\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[10\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[11\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[12\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[13\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[14\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/Registers/REGISTER_BANK\[15\]\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardA\[1:0\]} \
{/Final_tb/chip0/i_RISCV/ForwardB\[1:0\]} \
{/Final_tb/chip0/i_RISCV/branch} \
{/Final_tb/chip0/i_RISCV/ALU/src1\[31:0\]} \
{/Final_tb/chip0/i_RISCV/ALU/src2\[31:0\]} \
{/Final_tb/chip0/i_RISCV/alusrc_ex} \
{/Final_tb/chip0/i_RISCV/alu_result_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Final_tb/chip0/i_RISCV/memread_mem} \
{/Final_tb/chip0/i_RISCV/src2_tmp\[31:0\]} \
{/Final_tb/chip0/i_RISCV/result\[31:0\]} \
{/Final_tb/chip0/i_RISCV/branch_or_not} \
{/Final_tb/chip0/i_RISCV/rd_data_wb\[31:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs2\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/ID_EX_rs1\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_rd\[4:0\]} \
{/Final_tb/chip0/i_RISCV/forwarding_unit/MEM_WB_regwrite} \
{/Final_tb/chip0/i_RISCV/regwrite_wb} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvSetPosition -win $_nWave1 {("G2" 10)}
wvGetSignalClose -win $_nWave1
