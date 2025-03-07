// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_qcK_H__
#define __predict_ensemble_qcK_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_qcK_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_qcK_ram) {
        ram[0] = "0b0";
        ram[1] = "0b0";
        ram[2] = "0b0";
        ram[3] = "0b0";
        ram[4] = "0b1";
        ram[5] = "0b0";
        ram[6] = "0b0";
        ram[7] = "0b0";
        ram[8] = "0b1";
        ram[9] = "0b1";
        ram[10] = "0b1";
        ram[11] = "0b0";
        ram[12] = "0b0";
        ram[13] = "0b0";
        ram[14] = "0b1";
        ram[15] = "0b0";
        ram[16] = "0b0";
        for (unsigned i = 17; i < 23 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 23; i < 29 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 29; i < 34 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[34] = "0b0";
        ram[35] = "0b1";
        ram[36] = "0b1";
        ram[37] = "0b1";
        ram[38] = "0b0";
        ram[39] = "0b0";
        ram[40] = "0b0";
        ram[41] = "0b1";
        ram[42] = "0b1";
        for (unsigned i = 43; i < 48 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[48] = "0b1";
        ram[49] = "0b1";
        ram[50] = "0b1";
        ram[51] = "0b1";
        for (unsigned i = 52; i < 63 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[63] = "0b1";
        ram[64] = "0b1";
        ram[65] = "0b1";
        ram[66] = "0b1";
        ram[67] = "0b0";
        ram[68] = "0b0";
        ram[69] = "0b0";
        ram[70] = "0b1";
        ram[71] = "0b0";
        for (unsigned i = 72; i < 77 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[77] = "0b0";
        ram[78] = "0b0";
        ram[79] = "0b0";
        ram[80] = "0b0";
        ram[81] = "0b1";
        ram[82] = "0b0";
        ram[83] = "0b0";
        ram[84] = "0b0";
        ram[85] = "0b1";
        ram[86] = "0b1";
        ram[87] = "0b0";
        ram[88] = "0b0";
        ram[89] = "0b0";
        for (unsigned i = 90; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[95] = "0b0";
        ram[96] = "0b0";
        ram[97] = "0b0";
        ram[98] = "0b0";
        ram[99] = "0b1";
        ram[100] = "0b0";
        ram[101] = "0b1";
        ram[102] = "0b1";
        ram[103] = "0b1";
        ram[104] = "0b0";
        ram[105] = "0b1";
        ram[106] = "0b0";
        ram[107] = "0b1";
        ram[108] = "0b1";
        for (unsigned i = 109; i < 114 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[114] = "0b1";
        ram[115] = "0b1";
        ram[116] = "0b1";
        for (unsigned i = 117; i < 122 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[122] = "0b1";
        ram[123] = "0b1";
        ram[124] = "0b1";
        ram[125] = "0b0";
        ram[126] = "0b0";
        for (unsigned i = 127; i < 134 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[134] = "0b0";
        ram[135] = "0b1";
        ram[136] = "0b1";
        ram[137] = "0b1";
        ram[138] = "0b1";
        ram[139] = "0b0";
        ram[140] = "0b1";
        ram[141] = "0b0";
        ram[142] = "0b0";
        ram[143] = "0b1";
        ram[144] = "0b1";
        ram[145] = "0b0";
        ram[146] = "0b1";
        ram[147] = "0b1";
        ram[148] = "0b0";
        ram[149] = "0b0";
        ram[150] = "0b0";
        ram[151] = "0b1";
        ram[152] = "0b0";
        ram[153] = "0b1";
        ram[154] = "0b0";
        ram[155] = "0b1";
        for (unsigned i = 156; i < 161 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[161] = "0b1";
        ram[162] = "0b1";
        ram[163] = "0b1";
        ram[164] = "0b0";
        ram[165] = "0b1";
        ram[166] = "0b1";
        ram[167] = "0b0";
        ram[168] = "0b0";
        ram[169] = "0b0";
        ram[170] = "0b1";
        ram[171] = "0b1";
        ram[172] = "0b1";
        ram[173] = "0b1";
        ram[174] = "0b0";
        ram[175] = "0b1";
        ram[176] = "0b1";
        ram[177] = "0b0";
        for (unsigned i = 178; i < 183 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[183] = "0b0";
        ram[184] = "0b1";
        ram[185] = "0b1";
        ram[186] = "0b1";
        for (unsigned i = 187; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_qcK) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_qcK_ram* meminst;


SC_CTOR(predict_ensemble_qcK) {
meminst = new predict_ensemble_qcK_ram("predict_ensemble_qcK_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_qcK() {
    delete meminst;
}


};//endmodule
#endif
