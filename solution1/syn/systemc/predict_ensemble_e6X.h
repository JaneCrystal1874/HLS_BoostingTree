// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_e6X_H__
#define __predict_ensemble_e6X_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_e6X_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_e6X_ram) {
        for (unsigned i = 0; i < 5 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[5] = "0b1";
        ram[6] = "0b0";
        ram[7] = "0b0";
        ram[8] = "0b1";
        ram[9] = "0b0";
        ram[10] = "0b1";
        ram[11] = "0b0";
        for (unsigned i = 12; i < 17 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[17] = "0b0";
        ram[18] = "0b0";
        ram[19] = "0b0";
        ram[20] = "0b1";
        ram[21] = "0b0";
        ram[22] = "0b0";
        ram[23] = "0b1";
        ram[24] = "0b1";
        ram[25] = "0b0";
        ram[26] = "0b0";
        ram[27] = "0b0";
        ram[28] = "0b0";
        ram[29] = "0b1";
        ram[30] = "0b0";
        ram[31] = "0b1";
        ram[32] = "0b0";
        ram[33] = "0b0";
        ram[34] = "0b0";
        ram[35] = "0b1";
        ram[36] = "0b0";
        ram[37] = "0b0";
        ram[38] = "0b1";
        ram[39] = "0b1";
        ram[40] = "0b1";
        ram[41] = "0b1";
        ram[42] = "0b0";
        ram[43] = "0b1";
        ram[44] = "0b1";
        ram[45] = "0b0";
        ram[46] = "0b1";
        ram[47] = "0b1";
        ram[48] = "0b1";
        ram[49] = "0b1";
        for (unsigned i = 50; i < 55 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[55] = "0b1";
        ram[56] = "0b1";
        for (unsigned i = 57; i < 62 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[62] = "0b1";
        ram[63] = "0b0";
        ram[64] = "0b1";
        ram[65] = "0b1";
        ram[66] = "0b0";
        ram[67] = "0b0";
        ram[68] = "0b1";
        ram[69] = "0b0";
        ram[70] = "0b1";
        ram[71] = "0b1";
        ram[72] = "0b1";
        ram[73] = "0b1";
        ram[74] = "0b0";
        ram[75] = "0b0";
        ram[76] = "0b0";
        ram[77] = "0b0";
        ram[78] = "0b1";
        ram[79] = "0b0";
        for (unsigned i = 80; i < 85 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[85] = "0b0";
        ram[86] = "0b0";
        ram[87] = "0b0";
        ram[88] = "0b0";
        ram[89] = "0b1";
        for (unsigned i = 90; i < 96 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 96; i < 102 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[102] = "0b0";
        for (unsigned i = 103; i < 108 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[108] = "0b0";
        ram[109] = "0b1";
        ram[110] = "0b0";
        ram[111] = "0b0";
        ram[112] = "0b0";
        ram[113] = "0b1";
        ram[114] = "0b1";
        ram[115] = "0b0";
        ram[116] = "0b0";
        ram[117] = "0b1";
        ram[118] = "0b1";
        ram[119] = "0b0";
        ram[120] = "0b0";
        ram[121] = "0b1";
        ram[122] = "0b1";
        ram[123] = "0b1";
        ram[124] = "0b0";
        ram[125] = "0b1";
        for (unsigned i = 126; i < 131 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[131] = "0b1";
        ram[132] = "0b1";
        ram[133] = "0b1";
        ram[134] = "0b0";
        ram[135] = "0b0";
        ram[136] = "0b0";
        ram[137] = "0b0";
        ram[138] = "0b1";
        ram[139] = "0b0";
        ram[140] = "0b0";
        ram[141] = "0b1";
        ram[142] = "0b1";
        ram[143] = "0b1";
        ram[144] = "0b0";
        ram[145] = "0b1";
        ram[146] = "0b0";
        ram[147] = "0b0";
        ram[148] = "0b0";
        ram[149] = "0b0";
        ram[150] = "0b1";
        ram[151] = "0b0";
        ram[152] = "0b1";
        ram[153] = "0b0";
        ram[154] = "0b0";
        ram[155] = "0b1";
        ram[156] = "0b0";
        ram[157] = "0b1";
        ram[158] = "0b1";
        ram[159] = "0b1";
        ram[160] = "0b0";
        ram[161] = "0b1";
        ram[162] = "0b1";
        ram[163] = "0b1";
        ram[164] = "0b0";
        ram[165] = "0b0";
        for (unsigned i = 166; i < 172 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[172] = "0b0";
        for (unsigned i = 173; i < 179 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 179; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_e6X) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_e6X_ram* meminst;


SC_CTOR(predict_ensemble_e6X) {
meminst = new predict_ensemble_e6X_ram("predict_ensemble_e6X_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_e6X() {
    delete meminst;
}


};//endmodule
#endif
