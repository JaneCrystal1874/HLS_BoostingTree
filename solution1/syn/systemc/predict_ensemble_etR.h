// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_etR_H__
#define __predict_ensemble_etR_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_etR_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_etR_ram) {
        ram[0] = "0b0111";
        ram[1] = "0b1011";
        ram[2] = "0b1010";
        ram[3] = "0b0000";
        ram[4] = "0b0101";
        ram[5] = "0b0111";
        ram[6] = "0b0000";
        ram[7] = "0b1011";
        ram[8] = "0b0000";
        ram[9] = "0b0000";
        ram[10] = "0b0101";
        ram[11] = "0b0000";
        ram[12] = "0b1011";
        ram[13] = "0b0100";
        ram[14] = "0b0111";
        ram[15] = "0b1001";
        ram[16] = "0b1011";
        for (unsigned i = 17; i < 24 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[24] = "0b1011";
        ram[25] = "0b0000";
        ram[26] = "0b1011";
        ram[27] = "0b0000";
        ram[28] = "0b0101";
        ram[29] = "0b0011";
        ram[30] = "0b0000";
        ram[31] = "0b0000";
        ram[32] = "0b0011";
        ram[33] = "0b0000";
        ram[34] = "0b1001";
        ram[35] = "0b0000";
        ram[36] = "0b0111";
        ram[37] = "0b1000";
        ram[38] = "0b0111";
        ram[39] = "0b0011";
        ram[40] = "0b0000";
        ram[41] = "0b0000";
        ram[42] = "0b1011";
        ram[43] = "0b0011";
        ram[44] = "0b0111";
        for (unsigned i = 45; i < 50 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[50] = "0b1010";
        ram[51] = "0b1011";
        ram[52] = "0b0000";
        ram[53] = "0b0000";
        ram[54] = "0b0110";
        ram[55] = "0b1000";
        ram[56] = "0b1010";
        ram[57] = "0b1000";
        ram[58] = "0b1000";
        ram[59] = "0b0000";
        ram[60] = "0b0000";
        ram[61] = "0b1100";
        ram[62] = "0b0000";
        ram[63] = "0b0000";
        ram[64] = "0b0000";
        ram[65] = "0b0000";
        ram[66] = "0b0001";
        ram[67] = "0b1100";
        ram[68] = "0b0011";
        ram[69] = "0b0000";
        ram[70] = "0b0000";
        ram[71] = "0b1011";
        ram[72] = "0b1010";
        ram[73] = "0b1000";
        ram[74] = "0b0000";
        ram[75] = "0b0100";
        ram[76] = "0b0000";
        ram[77] = "0b0111";
        ram[78] = "0b0000";
        ram[79] = "0b1000";
        ram[80] = "0b0000";
        ram[81] = "0b1011";
        ram[82] = "0b1010";
        ram[83] = "0b1001";
        for (unsigned i = 84; i < 90 ; i = i + 1) {
            ram[i] = "0b0000";
        }
        ram[90] = "0b0110";
        ram[91] = "0b0011";
        ram[92] = "0b1101";
        ram[93] = "0b0101";
        ram[94] = "0b0101";
        ram[95] = "0b1101";
        ram[96] = "0b1100";
        ram[97] = "0b0000";
        ram[98] = "0b0000";
        ram[99] = "0b0000";
        ram[100] = "0b1010";
        ram[101] = "0b1100";
        ram[102] = "0b0000";
        ram[103] = "0b0000";
        ram[104] = "0b0111";
        ram[105] = "0b0000";
        ram[106] = "0b0000";
        ram[107] = "0b0000";
        ram[108] = "0b1010";
        ram[109] = "0b0010";
        ram[110] = "0b1000";
        ram[111] = "0b0000";
        ram[112] = "0b0011";
        ram[113] = "0b0000";
        ram[114] = "0b0000";
        ram[115] = "0b1011";
        ram[116] = "0b0000";
        ram[117] = "0b0000";
        ram[118] = "0b0000";
        ram[119] = "0b0001";
        ram[120] = "0b1011";
        ram[121] = "0b0111";
        ram[122] = "0b0000";
        ram[123] = "0b1010";
        ram[124] = "0b0000";
        ram[125] = "0b0000";
        ram[126] = "0b0000";
        ram[127] = "0b0000";
        ram[128] = "0b1000";
        ram[129] = "0b0000";
        ram[130] = "0b1101";
        ram[131] = "0b1101";
        ram[132] = "0b1101";
        ram[133] = "0b1010";
        ram[134] = "0b0111";
        ram[135] = "0b0000";
        ram[136] = "0b0011";
        ram[137] = "0b0000";
        ram[138] = "0b0000";
        ram[139] = "0b0000";
        ram[140] = "0b0000";
        ram[141] = "0b1011";
        ram[142] = "0b0111";
        ram[143] = "0b0000";
        ram[144] = "0b0000";
        ram[145] = "0b0110";
        ram[146] = "0b0001";
        ram[147] = "0b0000";
        ram[148] = "0b1100";
        ram[149] = "0b1100";
        ram[150] = "0b0000";
        ram[151] = "0b0100";
        ram[152] = "0b0000";
        ram[153] = "0b0000";
        ram[154] = "0b0000";
        ram[155] = "0b0100";
        ram[156] = "0b0100";
        ram[157] = "0b0000";
        ram[158] = "0b0000";
        ram[159] = "0b0000";
        ram[160] = "0b1001";
        ram[161] = "0b0000";
        ram[162] = "0b0101";
        ram[163] = "0b0000";
        ram[164] = "0b0011";
        for (unsigned i = 165; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_etR) {


static const unsigned DataWidth = 4;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_etR_ram* meminst;


SC_CTOR(predict_ensemble_etR) {
meminst = new predict_ensemble_etR_ram("predict_ensemble_etR_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_etR() {
    delete meminst;
}


};//endmodule
#endif
