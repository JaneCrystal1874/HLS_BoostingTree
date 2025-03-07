// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_cnw_H__
#define __predict_ensemble_cnw_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_cnw_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 4;
  static const unsigned AddressRange = 195;
  static const unsigned AddressWidth = 8;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(predict_ensemble_cnw_ram) {
        ram[0] = "0b1001";
        ram[1] = "0b0000";
        ram[2] = "0b1001";
        ram[3] = "0b0000";
        ram[4] = "0b1011";
        ram[5] = "0b0000";
        ram[6] = "0b1000";
        ram[7] = "0b0011";
        ram[8] = "0b0000";
        ram[9] = "0b0001";
        ram[10] = "0b0111";
        ram[11] = "0b0000";
        ram[12] = "0b0000";
        ram[13] = "0b0101";
        ram[14] = "0b0101";
        ram[15] = "0b0000";
        ram[16] = "0b0111";
        ram[17] = "0b0110";
        ram[18] = "0b0000";
        ram[19] = "0b0000";
        ram[20] = "0b0000";
        ram[21] = "0b0101";
        ram[22] = "0b0001";
        ram[23] = "0b0110";
        ram[24] = "0b0000";
        ram[25] = "0b0000";
        ram[26] = "0b0000";
        ram[27] = "0b1001";
        ram[28] = "0b1001";
        ram[29] = "0b0000";
        ram[30] = "0b0000";
        ram[31] = "0b1011";
        ram[32] = "0b1011";
        ram[33] = "0b0000";
        ram[34] = "0b0011";
        ram[35] = "0b0000";
        ram[36] = "0b1010";
        ram[37] = "0b0011";
        ram[38] = "0b0000";
        ram[39] = "0b1100";
        ram[40] = "0b0011";
        ram[41] = "0b0100";
        ram[42] = "0b0000";
        ram[43] = "0b0000";
        ram[44] = "0b1011";
        ram[45] = "0b0000";
        ram[46] = "0b0000";
        ram[47] = "0b1100";
        ram[48] = "0b0000";
        ram[49] = "0b0000";
        ram[50] = "0b1011";
        ram[51] = "0b0001";
        ram[52] = "0b0010";
        ram[53] = "0b0000";
        ram[54] = "0b1011";
        ram[55] = "0b0001";
        ram[56] = "0b0000";
        ram[57] = "0b0111";
        ram[58] = "0b1010";
        ram[59] = "0b0101";
        ram[60] = "0b1010";
        ram[61] = "0b0000";
        ram[62] = "0b0000";
        ram[63] = "0b0000";
        ram[64] = "0b1011";
        ram[65] = "0b0000";
        ram[66] = "0b1101";
        ram[67] = "0b0000";
        ram[68] = "0b0000";
        ram[69] = "0b0100";
        ram[70] = "0b0000";
        ram[71] = "0b0000";
        ram[72] = "0b0000";
        ram[73] = "0b0000";
        ram[74] = "0b1011";
        ram[75] = "0b0100";
        ram[76] = "0b0100";
        ram[77] = "0b0101";
        ram[78] = "0b0000";
        ram[79] = "0b0100";
        ram[80] = "0b0000";
        ram[81] = "0b0000";
        ram[82] = "0b1000";
        ram[83] = "0b0101";
        ram[84] = "0b0000";
        ram[85] = "0b1011";
        ram[86] = "0b0000";
        ram[87] = "0b0000";
        ram[88] = "0b0000";
        ram[89] = "0b0100";
        ram[90] = "0b0000";
        ram[91] = "0b0110";
        ram[92] = "0b0000";
        ram[93] = "0b0101";
        ram[94] = "0b0100";
        ram[95] = "0b0010";
        ram[96] = "0b0110";
        ram[97] = "0b0010";
        for (unsigned i = 98; i < 104 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[104] = "0b0100";
        ram[105] = "0b0000";
        ram[106] = "0b0000";
        ram[107] = "0b0000";
        ram[108] = "0b1100";
        ram[109] = "0b0101";
        ram[110] = "0b1011";
        ram[111] = "0b0000";
        ram[112] = "0b0000";
        ram[113] = "0b0000";
        ram[114] = "0b1011";
        ram[115] = "0b0000";
        ram[116] = "0b1101";
        ram[117] = "0b0000";
        ram[118] = "0b0101";
        ram[119] = "0b0101";
        ram[120] = "0b1000";
        ram[121] = "0b0100";
        ram[122] = "0b0000";
        ram[123] = "0b1001";
        ram[124] = "0b0000";
        ram[125] = "0b0001";
        ram[126] = "0b0011";
        ram[127] = "0b0000";
        ram[128] = "0b1011";
        ram[129] = "0b1000";
        ram[130] = "0b0000";
        ram[131] = "0b0110";
        ram[132] = "0b0000";
        ram[133] = "0b0000";
        ram[134] = "0b0111";
        ram[135] = "0b0000";
        ram[136] = "0b0000";
        ram[137] = "0b0111";
        ram[138] = "0b0111";
        ram[139] = "0b0000";
        ram[140] = "0b0000";
        ram[141] = "0b1010";
        ram[142] = "0b1010";
        ram[143] = "0b0101";
        ram[144] = "0b0000";
        ram[145] = "0b0100";
        ram[146] = "0b1100";
        ram[147] = "0b0110";
        ram[148] = "0b0000";
        ram[149] = "0b0000";
        ram[150] = "0b1000";
        ram[151] = "0b0100";
        ram[152] = "0b0011";
        ram[153] = "0b0000";
        ram[154] = "0b0000";
        ram[155] = "0b1010";
        ram[156] = "0b0111";
        ram[157] = "0b0000";
        ram[158] = "0b1011";
        ram[159] = "0b0111";
        ram[160] = "0b0011";
        ram[161] = "0b0000";
        ram[162] = "0b0000";
        ram[163] = "0b1101";
        ram[164] = "0b0000";
        ram[165] = "0b0111";
        ram[166] = "0b0000";
        ram[167] = "0b0000";
        ram[168] = "0b0010";
        ram[169] = "0b0000";
        ram[170] = "0b0000";
        ram[171] = "0b0000";
        ram[172] = "0b0000";
        ram[173] = "0b1001";
        ram[174] = "0b0001";
        ram[175] = "0b0000";
        ram[176] = "0b0100";
        ram[177] = "0b0000";
        ram[178] = "0b1010";
        ram[179] = "0b1001";
        ram[180] = "0b0000";
        ram[181] = "0b0000";
        ram[182] = "0b0000";
        ram[183] = "0b0000";
        ram[184] = "0b0111";
        for (unsigned i = 185; i < 195 ; i = i + 1) {
            ram[i] = "0b0000";
        }


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(predict_ensemble_cnw) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_cnw_ram* meminst;


SC_CTOR(predict_ensemble_cnw) {
meminst = new predict_ensemble_cnw_ram("predict_ensemble_cnw_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_cnw() {
    delete meminst;
}


};//endmodule
#endif
