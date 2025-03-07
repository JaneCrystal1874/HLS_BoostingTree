// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_bkb_H__
#define __predict_ensemble_bkb_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_bkb_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_bkb_ram) {
        for (unsigned i = 0; i < 9 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[9] = "0b1";
        for (unsigned i = 10; i < 20 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[20] = "0b1";
        ram[21] = "0b1";
        ram[22] = "0b1";
        for (unsigned i = 23; i < 28 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[28] = "0b1";
        ram[29] = "0b1";
        for (unsigned i = 30; i < 35 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 35; i < 45 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[45] = "0b0";
        ram[46] = "0b0";
        ram[47] = "0b1";
        for (unsigned i = 48; i < 59 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[59] = "0b1";
        ram[60] = "0b0";
        ram[61] = "0b0";
        ram[62] = "0b1";
        ram[63] = "0b1";
        ram[64] = "0b0";
        ram[65] = "0b0";
        ram[66] = "0b1";
        ram[67] = "0b0";
        ram[68] = "0b0";
        ram[69] = "0b1";
        for (unsigned i = 70; i < 77 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[77] = "0b1";
        ram[78] = "0b0";
        ram[79] = "0b0";
        ram[80] = "0b1";
        ram[81] = "0b0";
        ram[82] = "0b1";
        ram[83] = "0b0";
        ram[84] = "0b1";
        ram[85] = "0b1";
        ram[86] = "0b1";
        ram[87] = "0b1";
        ram[88] = "0b0";
        ram[89] = "0b1";
        ram[90] = "0b0";
        for (unsigned i = 91; i < 99 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[99] = "0b0";
        ram[100] = "0b0";
        ram[101] = "0b0";
        ram[102] = "0b0";
        ram[103] = "0b1";
        ram[104] = "0b1";
        ram[105] = "0b0";
        ram[106] = "0b1";
        for (unsigned i = 107; i < 115 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[115] = "0b1";
        ram[116] = "0b1";
        ram[117] = "0b1";
        ram[118] = "0b1";
        ram[119] = "0b0";
        ram[120] = "0b0";
        ram[121] = "0b0";
        ram[122] = "0b0";
        for (unsigned i = 123; i < 129 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[129] = "0b0";
        ram[130] = "0b0";
        ram[131] = "0b1";
        ram[132] = "0b1";
        ram[133] = "0b1";
        ram[134] = "0b1";
        ram[135] = "0b0";
        ram[136] = "0b1";
        ram[137] = "0b1";
        ram[138] = "0b0";
        ram[139] = "0b1";
        ram[140] = "0b0";
        ram[141] = "0b1";
        ram[142] = "0b0";
        for (unsigned i = 143; i < 152 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[152] = "0b0";
        ram[153] = "0b1";
        ram[154] = "0b1";
        ram[155] = "0b1";
        ram[156] = "0b0";
        ram[157] = "0b1";
        ram[158] = "0b1";
        ram[159] = "0b0";
        ram[160] = "0b1";
        ram[161] = "0b0";
        ram[162] = "0b1";
        ram[163] = "0b1";
        ram[164] = "0b1";
        ram[165] = "0b0";
        for (unsigned i = 166; i < 177 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[177] = "0b0";
        ram[178] = "0b1";
        ram[179] = "0b1";
        ram[180] = "0b1";
        for (unsigned i = 181; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_bkb) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_bkb_ram* meminst;


SC_CTOR(predict_ensemble_bkb) {
meminst = new predict_ensemble_bkb_ram("predict_ensemble_bkb_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_bkb() {
    delete meminst;
}


};//endmodule
#endif
