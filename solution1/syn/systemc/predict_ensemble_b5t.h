// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_b5t_H__
#define __predict_ensemble_b5t_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_b5t_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 8;
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


   SC_CTOR(predict_ensemble_b5t_ram) {
        ram[0] = "0b00000001";
        ram[1] = "0b00000000";
        ram[2] = "0b00000011";
        ram[3] = "0b00000000";
        ram[4] = "0b00000101";
        ram[5] = "0b00000000";
        ram[6] = "0b00000111";
        ram[7] = "0b00000000";
        ram[8] = "0b00001001";
        ram[9] = "0b00001011";
        ram[10] = "0b00001101";
        ram[11] = "0b00000000";
        ram[12] = "0b00001111";
        ram[13] = "0b00010001";
        ram[14] = "0b00000000";
        ram[15] = "0b00000000";
        ram[16] = "0b00000000";
        ram[17] = "0b00010011";
        ram[18] = "0b00000000";
        ram[19] = "0b00010101";
        ram[20] = "0b00000000";
        ram[21] = "0b00010111";
        ram[22] = "0b00000000";
        ram[23] = "0b00011001";
        ram[24] = "0b00000000";
        ram[25] = "0b00011011";
        ram[26] = "0b00011101";
        ram[27] = "0b00000000";
        ram[28] = "0b00000000";
        ram[29] = "0b00000000";
        ram[30] = "0b00011111";
        ram[31] = "0b00100001";
        ram[32] = "0b00000000";
        ram[33] = "0b00100011";
        ram[34] = "0b00000000";
        ram[35] = "0b00100101";
        ram[36] = "0b00100111";
        ram[37] = "0b00000000";
        ram[38] = "0b00101001";
        ram[39] = "0b00000000";
        ram[40] = "0b00101011";
        ram[41] = "0b00000000";
        ram[42] = "0b00000000";
        ram[43] = "0b00101101";
        ram[44] = "0b00000000";
        ram[45] = "0b00101111";
        ram[46] = "0b00000000";
        ram[47] = "0b00000000";
        ram[48] = "0b00110001";
        ram[49] = "0b00110011";
        ram[50] = "0b00000000";
        ram[51] = "0b00110101";
        ram[52] = "0b00110111";
        ram[53] = "0b00000000";
        ram[54] = "0b00111001";
        ram[55] = "0b00111011";
        ram[56] = "0b00111101";
        ram[57] = "0b00111111";
        ram[58] = "0b00000000";
        ram[59] = "0b01000001";
        ram[60] = "0b00000000";
        ram[61] = "0b01000011";
        ram[62] = "0b00000000";
        ram[63] = "0b01000101";
        ram[64] = "0b01000111";
        ram[65] = "0b01001001";
        ram[66] = "0b00000000";
        ram[67] = "0b01001011";
        for (unsigned i = 68; i < 73 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[73] = "0b01001101";
        ram[74] = "0b00000000";
        ram[75] = "0b00000000";
        ram[76] = "0b01001111";
        ram[77] = "0b01010001";
        ram[78] = "0b01010011";
        ram[79] = "0b00000000";
        ram[80] = "0b00000000";
        ram[81] = "0b01010101";
        ram[82] = "0b01010111";
        ram[83] = "0b01011001";
        ram[84] = "0b00000000";
        ram[85] = "0b01011011";
        ram[86] = "0b00000000";
        ram[87] = "0b01011101";
        ram[88] = "0b01011111";
        ram[89] = "0b00000000";
        ram[90] = "0b00000000";
        ram[91] = "0b00000000";
        ram[92] = "0b01100001";
        ram[93] = "0b01100011";
        ram[94] = "0b00000000";
        ram[95] = "0b01100101";
        ram[96] = "0b01100111";
        ram[97] = "0b00000000";
        ram[98] = "0b00000000";
        ram[99] = "0b01101001";
        ram[100] = "0b01101011";
        ram[101] = "0b00000000";
        ram[102] = "0b01101101";
        ram[103] = "0b00000000";
        ram[104] = "0b01101111";
        ram[105] = "0b00000000";
        ram[106] = "0b01110001";
        ram[107] = "0b00000000";
        ram[108] = "0b00000000";
        ram[109] = "0b00000000";
        ram[110] = "0b01110011";
        ram[111] = "0b01110101";
        ram[112] = "0b00000000";
        ram[113] = "0b00000000";
        ram[114] = "0b00000000";
        ram[115] = "0b00000000";
        ram[116] = "0b01110111";
        ram[117] = "0b01111001";
        ram[118] = "0b00000000";
        ram[119] = "0b00000000";
        ram[120] = "0b00000000";
        ram[121] = "0b00000000";
        ram[122] = "0b01111011";
        ram[123] = "0b00000000";
        ram[124] = "0b01111101";
        ram[125] = "0b00000000";
        ram[126] = "0b01111111";
        ram[127] = "0b10000001";
        ram[128] = "0b10000011";
        ram[129] = "0b10000101";
        ram[130] = "0b10000111";
        ram[131] = "0b10001001";
        ram[132] = "0b10001011";
        ram[133] = "0b00000000";
        ram[134] = "0b10001101";
        ram[135] = "0b10001111";
        ram[136] = "0b00000000";
        ram[137] = "0b00000000";
        ram[138] = "0b00000000";
        ram[139] = "0b10010001";
        ram[140] = "0b10010011";
        ram[141] = "0b10010101";
        for (unsigned i = 142; i < 147 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[147] = "0b10010111";
        ram[148] = "0b10011001";
        ram[149] = "0b00000000";
        ram[150] = "0b00000000";
        ram[151] = "0b10011011";
        ram[152] = "0b10011101";
        ram[153] = "0b10011111";
        ram[154] = "0b10100001";
        ram[155] = "0b00000000";
        ram[156] = "0b00000000";
        ram[157] = "0b10100011";
        ram[158] = "0b10100101";
        ram[159] = "0b00000000";
        ram[160] = "0b00000000";
        ram[161] = "0b00000000";
        ram[162] = "0b00000000";
        ram[163] = "0b10100111";
        ram[164] = "0b00000000";
        ram[165] = "0b00000000";
        ram[166] = "0b10101001";
        ram[167] = "0b00000000";
        ram[168] = "0b10101011";
        ram[169] = "0b10101101";
        ram[170] = "0b10101111";
        ram[171] = "0b10110001";
        ram[172] = "0b00000000";
        ram[173] = "0b00000000";
        ram[174] = "0b10110011";
        for (unsigned i = 175; i < 195 ; i = i + 1) {
            ram[i] = "0b00000000";
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


SC_MODULE(predict_ensemble_b5t) {


static const unsigned DataWidth = 8;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_b5t_ram* meminst;


SC_CTOR(predict_ensemble_b5t) {
meminst = new predict_ensemble_b5t_ram("predict_ensemble_b5t_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_b5t() {
    delete meminst;
}


};//endmodule
#endif
