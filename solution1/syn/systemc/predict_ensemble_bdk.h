// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_bdk_H__
#define __predict_ensemble_bdk_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_bdk_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_bdk_ram) {
        ram[0] = "0b00000010";
        ram[1] = "0b00000000";
        ram[2] = "0b00000100";
        ram[3] = "0b00000000";
        ram[4] = "0b00000110";
        ram[5] = "0b00001000";
        ram[6] = "0b00001010";
        ram[7] = "0b00001100";
        ram[8] = "0b00000000";
        ram[9] = "0b00001110";
        ram[10] = "0b00000000";
        ram[11] = "0b00010000";
        ram[12] = "0b00010010";
        ram[13] = "0b00000000";
        ram[14] = "0b00010100";
        ram[15] = "0b00010110";
        ram[16] = "0b00000000";
        ram[17] = "0b00011000";
        ram[18] = "0b00011010";
        ram[19] = "0b00000000";
        ram[20] = "0b00000000";
        ram[21] = "0b00000000";
        ram[22] = "0b00000000";
        ram[23] = "0b00011100";
        ram[24] = "0b00000000";
        ram[25] = "0b00011110";
        ram[26] = "0b00000000";
        ram[27] = "0b00000000";
        ram[28] = "0b00000000";
        ram[29] = "0b00100000";
        ram[30] = "0b00100010";
        ram[31] = "0b00000000";
        ram[32] = "0b00100100";
        ram[33] = "0b00100110";
        ram[34] = "0b00101000";
        ram[35] = "0b00000000";
        ram[36] = "0b00000000";
        ram[37] = "0b00000000";
        ram[38] = "0b00000000";
        ram[39] = "0b00101010";
        ram[40] = "0b00000000";
        ram[41] = "0b00101100";
        ram[42] = "0b00101110";
        ram[43] = "0b00110000";
        ram[44] = "0b00000000";
        ram[45] = "0b00000000";
        ram[46] = "0b00110010";
        ram[47] = "0b00000000";
        ram[48] = "0b00110100";
        ram[49] = "0b00000000";
        ram[50] = "0b00110110";
        ram[51] = "0b00000000";
        ram[52] = "0b00111000";
        ram[53] = "0b00111010";
        ram[54] = "0b00111100";
        ram[55] = "0b00000000";
        ram[56] = "0b00000000";
        ram[57] = "0b00111110";
        ram[58] = "0b01000000";
        ram[59] = "0b00000000";
        ram[60] = "0b00000000";
        ram[61] = "0b01000010";
        ram[62] = "0b00000000";
        ram[63] = "0b00000000";
        ram[64] = "0b01000100";
        ram[65] = "0b01000110";
        ram[66] = "0b00000000";
        ram[67] = "0b01001000";
        ram[68] = "0b01001010";
        ram[69] = "0b01001100";
        ram[70] = "0b01001110";
        ram[71] = "0b00000000";
        ram[72] = "0b01010000";
        ram[73] = "0b00000000";
        ram[74] = "0b00000000";
        ram[75] = "0b01010010";
        ram[76] = "0b01010100";
        ram[77] = "0b00000000";
        ram[78] = "0b01010110";
        ram[79] = "0b01011000";
        ram[80] = "0b00000000";
        ram[81] = "0b01011010";
        ram[82] = "0b00000000";
        ram[83] = "0b00000000";
        ram[84] = "0b01011100";
        ram[85] = "0b01011110";
        ram[86] = "0b00000000";
        ram[87] = "0b01100000";
        ram[88] = "0b00000000";
        ram[89] = "0b01100010";
        ram[90] = "0b01100100";
        ram[91] = "0b00000000";
        ram[92] = "0b01100110";
        ram[93] = "0b00000000";
        ram[94] = "0b01101000";
        ram[95] = "0b01101010";
        ram[96] = "0b00000000";
        ram[97] = "0b00000000";
        ram[98] = "0b00000000";
        ram[99] = "0b01101100";
        ram[100] = "0b01101110";
        ram[101] = "0b00000000";
        ram[102] = "0b01110000";
        ram[103] = "0b01110010";
        ram[104] = "0b01110100";
        ram[105] = "0b00000000";
        ram[106] = "0b00000000";
        ram[107] = "0b01110110";
        ram[108] = "0b00000000";
        ram[109] = "0b01111000";
        ram[110] = "0b00000000";
        ram[111] = "0b00000000";
        ram[112] = "0b01111010";
        ram[113] = "0b00000000";
        ram[114] = "0b00000000";
        ram[115] = "0b01111100";
        ram[116] = "0b01111110";
        ram[117] = "0b10000000";
        ram[118] = "0b00000000";
        ram[119] = "0b00000000";
        ram[120] = "0b00000000";
        ram[121] = "0b10000010";
        ram[122] = "0b10000100";
        ram[123] = "0b00000000";
        ram[124] = "0b00000000";
        ram[125] = "0b10000110";
        ram[126] = "0b00000000";
        ram[127] = "0b10001000";
        ram[128] = "0b00000000";
        ram[129] = "0b10001010";
        ram[130] = "0b10001100";
        ram[131] = "0b00000000";
        ram[132] = "0b10001110";
        ram[133] = "0b10010000";
        ram[134] = "0b10010010";
        for (unsigned i = 135; i < 141 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[141] = "0b10010100";
        ram[142] = "0b10010110";
        ram[143] = "0b00000000";
        ram[144] = "0b10011000";
        ram[145] = "0b10011010";
        ram[146] = "0b10011100";
        ram[147] = "0b10011110";
        ram[148] = "0b10100000";
        ram[149] = "0b00000000";
        ram[150] = "0b00000000";
        ram[151] = "0b00000000";
        ram[152] = "0b10100010";
        ram[153] = "0b00000000";
        ram[154] = "0b00000000";
        ram[155] = "0b00000000";
        ram[156] = "0b00000000";
        ram[157] = "0b10100100";
        ram[158] = "0b10100110";
        ram[159] = "0b10101000";
        ram[160] = "0b00000000";
        ram[161] = "0b00000000";
        ram[162] = "0b00000000";
        ram[163] = "0b10101010";
        ram[164] = "0b10101100";
        ram[165] = "0b00000000";
        ram[166] = "0b10101110";
        ram[167] = "0b00000000";
        ram[168] = "0b10110000";
        ram[169] = "0b00000000";
        ram[170] = "0b00000000";
        ram[171] = "0b10110010";
        ram[172] = "0b00000000";
        ram[173] = "0b10110100";
        ram[174] = "0b10110110";
        ram[175] = "0b00000000";
        ram[176] = "0b10111000";
        for (unsigned i = 177; i < 182 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[182] = "0b10111010";
        ram[183] = "0b00000000";
        ram[184] = "0b00000000";
        ram[185] = "0b00000000";
        ram[186] = "0b10111100";
        for (unsigned i = 187; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_bdk) {


static const unsigned DataWidth = 8;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_bdk_ram* meminst;


SC_CTOR(predict_ensemble_bdk) {
meminst = new predict_ensemble_bdk_ram("predict_ensemble_bdk_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_bdk() {
    delete meminst;
}


};//endmodule
#endif
