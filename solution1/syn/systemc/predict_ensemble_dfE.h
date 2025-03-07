// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_dfE_H__
#define __predict_ensemble_dfE_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_dfE_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 1;
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


   SC_CTOR(predict_ensemble_dfE_ram) {
        ram[0] = "0b0";
        ram[1] = "0b1";
        ram[2] = "0b0";
        ram[3] = "0b1";
        ram[4] = "0b0";
        ram[5] = "0b0";
        ram[6] = "0b0";
        ram[7] = "0b1";
        ram[8] = "0b1";
        ram[9] = "0b0";
        ram[10] = "0b0";
        ram[11] = "0b0";
        ram[12] = "0b1";
        ram[13] = "0b1";
        ram[14] = "0b1";
        ram[15] = "0b0";
        ram[16] = "0b1";
        ram[17] = "0b0";
        ram[18] = "0b0";
        ram[19] = "0b1";
        ram[20] = "0b1";
        ram[21] = "0b0";
        ram[22] = "0b1";
        ram[23] = "0b0";
        ram[24] = "0b1";
        ram[25] = "0b1";
        ram[26] = "0b0";
        ram[27] = "0b0";
        ram[28] = "0b0";
        ram[29] = "0b0";
        ram[30] = "0b1";
        ram[31] = "0b1";
        ram[32] = "0b0";
        ram[33] = "0b1";
        ram[34] = "0b1";
        ram[35] = "0b0";
        ram[36] = "0b0";
        ram[37] = "0b0";
        ram[38] = "0b1";
        ram[39] = "0b1";
        ram[40] = "0b0";
        ram[41] = "0b0";
        ram[42] = "0b1";
        ram[43] = "0b1";
        ram[44] = "0b1";
        ram[45] = "0b0";
        ram[46] = "0b0";
        ram[47] = "0b1";
        ram[48] = "0b0";
        ram[49] = "0b1";
        ram[50] = "0b1";
        for (unsigned i = 51; i < 56 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[56] = "0b1";
        ram[57] = "0b1";
        ram[58] = "0b1";
        ram[59] = "0b0";
        ram[60] = "0b0";
        ram[61] = "0b1";
        ram[62] = "0b1";
        ram[63] = "0b1";
        ram[64] = "0b0";
        ram[65] = "0b1";
        ram[66] = "0b1";
        ram[67] = "0b0";
        ram[68] = "0b0";
        ram[69] = "0b0";
        ram[70] = "0b1";
        ram[71] = "0b1";
        ram[72] = "0b0";
        ram[73] = "0b1";
        ram[74] = "0b1";
        ram[75] = "0b1";
        ram[76] = "0b0";
        ram[77] = "0b1";
        ram[78] = "0b0";
        ram[79] = "0b0";
        ram[80] = "0b1";
        ram[81] = "0b1";
        ram[82] = "0b0";
        ram[83] = "0b0";
        ram[84] = "0b1";
        ram[85] = "0b0";
        ram[86] = "0b1";
        ram[87] = "0b0";
        ram[88] = "0b0";
        ram[89] = "0b0";
        ram[90] = "0b1";
        ram[91] = "0b0";
        ram[92] = "0b1";
        ram[93] = "0b1";
        ram[94] = "0b0";
        ram[95] = "0b0";
        ram[96] = "0b1";
        ram[97] = "0b1";
        ram[98] = "0b0";
        ram[99] = "0b0";
        ram[100] = "0b0";
        ram[101] = "0b1";
        ram[102] = "0b1";
        ram[103] = "0b0";
        ram[104] = "0b1";
        ram[105] = "0b0";
        ram[106] = "0b1";
        ram[107] = "0b1";
        ram[108] = "0b0";
        ram[109] = "0b0";
        ram[110] = "0b0";
        ram[111] = "0b1";
        ram[112] = "0b1";
        ram[113] = "0b1";
        ram[114] = "0b1";
        ram[115] = "0b0";
        ram[116] = "0b1";
        ram[117] = "0b0";
        ram[118] = "0b1";
        ram[119] = "0b0";
        ram[120] = "0b0";
        ram[121] = "0b0";
        ram[122] = "0b0";
        ram[123] = "0b1";
        ram[124] = "0b0";
        ram[125] = "0b1";
        ram[126] = "0b1";
        ram[127] = "0b1";
        ram[128] = "0b1";
        ram[129] = "0b0";
        ram[130] = "0b0";
        ram[131] = "0b1";
        ram[132] = "0b1";
        ram[133] = "0b0";
        ram[134] = "0b0";
        ram[135] = "0b0";
        ram[136] = "0b1";
        ram[137] = "0b1";
        ram[138] = "0b1";
        for (unsigned i = 139; i < 145 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[145] = "0b1";
        ram[146] = "0b0";
        ram[147] = "0b0";
        ram[148] = "0b1";
        ram[149] = "0b0";
        ram[150] = "0b1";
        ram[151] = "0b1";
        ram[152] = "0b1";
        ram[153] = "0b1";
        ram[154] = "0b0";
        ram[155] = "0b1";
        ram[156] = "0b1";
        ram[157] = "0b1";
        ram[158] = "0b1";
        ram[159] = "0b0";
        ram[160] = "0b0";
        ram[161] = "0b0";
        ram[162] = "0b0";
        ram[163] = "0b1";
        ram[164] = "0b0";
        ram[165] = "0b1";
        ram[166] = "0b1";
        ram[167] = "0b0";
        ram[168] = "0b0";
        ram[169] = "0b1";
        ram[170] = "0b1";
        ram[171] = "0b1";
        ram[172] = "0b1";
        ram[173] = "0b0";
        ram[174] = "0b1";
        ram[175] = "0b1";
        ram[176] = "0b0";
        ram[177] = "0b1";
        ram[178] = "0b0";
        ram[179] = "0b1";
        ram[180] = "0b0";
        ram[181] = "0b0";
        ram[182] = "0b1";
        ram[183] = "0b1";
        ram[184] = "0b1";
        for (unsigned i = 185; i < 195 ; i = i + 1) {
            ram[i] = "0b0";
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


SC_MODULE(predict_ensemble_dfE) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_dfE_ram* meminst;


SC_CTOR(predict_ensemble_dfE) {
meminst = new predict_ensemble_dfE_ram("predict_ensemble_dfE_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_dfE() {
    delete meminst;
}


};//endmodule
#endif
