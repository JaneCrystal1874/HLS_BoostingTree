// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_b1s_H__
#define __predict_ensemble_b1s_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_b1s_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_b1s_ram) {
        ram[0] = "0b00000010";
        ram[1] = "0b00000100";
        ram[2] = "0b00000110";
        ram[3] = "0b00001000";
        ram[4] = "0b00001010";
        ram[5] = "0b00001100";
        ram[6] = "0b00001110";
        ram[7] = "0b00010000";
        ram[8] = "0b00010010";
        ram[9] = "0b00010100";
        ram[10] = "0b00010110";
        ram[11] = "0b00011000";
        ram[12] = "0b00011010";
        ram[13] = "0b00011100";
        ram[14] = "0b00011110";
        ram[15] = "0b00100000";
        ram[16] = "0b00100010";
        ram[17] = "0b00100100";
        ram[18] = "0b00100110";
        ram[19] = "0b00101000";
        ram[20] = "0b00000000";
        ram[21] = "0b00000000";
        ram[22] = "0b00101010";
        ram[23] = "0b00000000";
        ram[24] = "0b00101100";
        ram[25] = "0b00000000";
        ram[26] = "0b00000000";
        ram[27] = "0b00000000";
        ram[28] = "0b00101110";
        ram[29] = "0b00110000";
        ram[30] = "0b00110010";
        ram[31] = "0b00110100";
        ram[32] = "0b00110110";
        ram[33] = "0b00111000";
        ram[34] = "0b00111010";
        for (unsigned i = 35; i < 40 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[40] = "0b00111100";
        ram[41] = "0b00111110";
        ram[42] = "0b00000000";
        ram[43] = "0b01000000";
        ram[44] = "0b00000000";
        ram[45] = "0b01000010";
        ram[46] = "0b01000100";
        ram[47] = "0b01000110";
        ram[48] = "0b01001000";
        ram[49] = "0b01001010";
        ram[50] = "0b01001100";
        ram[51] = "0b01001110";
        ram[52] = "0b00000000";
        ram[53] = "0b00000000";
        ram[54] = "0b01010000";
        ram[55] = "0b01010010";
        ram[56] = "0b00000000";
        ram[57] = "0b01010100";
        ram[58] = "0b00000000";
        ram[59] = "0b01010110";
        ram[60] = "0b01011000";
        ram[61] = "0b00000000";
        ram[62] = "0b00000000";
        ram[63] = "0b00000000";
        ram[64] = "0b01011010";
        ram[65] = "0b01011100";
        ram[66] = "0b01011110";
        ram[67] = "0b00000000";
        ram[68] = "0b01100000";
        ram[69] = "0b00000000";
        ram[70] = "0b01100010";
        ram[71] = "0b00000000";
        ram[72] = "0b00000000";
        ram[73] = "0b01100100";
        ram[74] = "0b01100110";
        ram[75] = "0b00000000";
        ram[76] = "0b01101000";
        ram[77] = "0b00000000";
        ram[78] = "0b01101010";
        ram[79] = "0b01101100";
        ram[80] = "0b01101110";
        ram[81] = "0b00000000";
        ram[82] = "0b00000000";
        ram[83] = "0b01110000";
        ram[84] = "0b01110010";
        ram[85] = "0b00000000";
        ram[86] = "0b00000000";
        ram[87] = "0b00000000";
        ram[88] = "0b00000000";
        ram[89] = "0b01110100";
        ram[90] = "0b00000000";
        ram[91] = "0b00000000";
        ram[92] = "0b00000000";
        ram[93] = "0b01110110";
        ram[94] = "0b00000000";
        ram[95] = "0b00000000";
        ram[96] = "0b00000000";
        ram[97] = "0b01111000";
        ram[98] = "0b00000000";
        ram[99] = "0b01111010";
        ram[100] = "0b01111100";
        ram[101] = "0b00000000";
        ram[102] = "0b00000000";
        ram[103] = "0b01111110";
        ram[104] = "0b00000000";
        ram[105] = "0b10000000";
        ram[106] = "0b00000000";
        ram[107] = "0b10000010";
        ram[108] = "0b10000100";
        ram[109] = "0b00000000";
        ram[110] = "0b10000110";
        ram[111] = "0b00000000";
        ram[112] = "0b00000000";
        ram[113] = "0b10001000";
        ram[114] = "0b10001010";
        ram[115] = "0b00000000";
        ram[116] = "0b00000000";
        ram[117] = "0b10001100";
        ram[118] = "0b10001110";
        ram[119] = "0b00000000";
        ram[120] = "0b00000000";
        ram[121] = "0b10010000";
        ram[122] = "0b10010010";
        ram[123] = "0b00000000";
        ram[124] = "0b00000000";
        ram[125] = "0b10010100";
        ram[126] = "0b00000000";
        ram[127] = "0b10010110";
        ram[128] = "0b00000000";
        ram[129] = "0b10011000";
        ram[130] = "0b10011010";
        ram[131] = "0b10011100";
        ram[132] = "0b00000000";
        ram[133] = "0b10011110";
        ram[134] = "0b00000000";
        ram[135] = "0b00000000";
        ram[136] = "0b00000000";
        ram[137] = "0b10100000";
        ram[138] = "0b10100010";
        ram[139] = "0b00000000";
        ram[140] = "0b00000000";
        ram[141] = "0b10100100";
        ram[142] = "0b10100110";
        for (unsigned i = 143; i < 151 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[151] = "0b10101000";
        ram[152] = "0b00000000";
        ram[153] = "0b00000000";
        ram[154] = "0b10101010";
        ram[155] = "0b10101100";
        ram[156] = "0b00000000";
        ram[157] = "0b10101110";
        ram[158] = "0b00000000";
        ram[159] = "0b10110000";
        ram[160] = "0b00000000";
        ram[161] = "0b10110010";
        ram[162] = "0b00000000";
        ram[163] = "0b10110100";
        ram[164] = "0b10110110";
        ram[165] = "0b00000000";
        ram[166] = "0b00000000";
        ram[167] = "0b10111000";
        for (unsigned i = 168; i < 178 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[178] = "0b10111010";
        ram[179] = "0b10111100";
        ram[180] = "0b00000000";
        ram[181] = "0b00000000";
        ram[182] = "0b10111110";
        for (unsigned i = 183; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_b1s) {


static const unsigned DataWidth = 8;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_b1s_ram* meminst;


SC_CTOR(predict_ensemble_b1s) {
meminst = new predict_ensemble_b1s_ram("predict_ensemble_b1s_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_b1s() {
    delete meminst;
}


};//endmodule
#endif
