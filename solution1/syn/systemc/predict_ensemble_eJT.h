// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_eJT_H__
#define __predict_ensemble_eJT_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_eJT_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 32;
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


   SC_CTOR(predict_ensemble_eJT_ram) {
        ram[0] = "0b00111111011101100101011000010101";
        ram[1] = "0b00111101001011000010100010110011";
        ram[2] = "0b10111000100101001110010111010110";
        ram[3] = "0b10111000010001010010000111011110";
        ram[4] = "0b00111101010011111101101100001010";
        ram[5] = "0b00111000101101100111001111000101";
        ram[6] = "0b00111101011000001010010000011010";
        ram[7] = "0b10111000010011011000010101011001";
        ram[8] = "0b00111111011011100101000000001101";
        ram[9] = "0b00111111010111101000101110100000";
        ram[10] = "0b00111000000111110110001000110000";
        ram[11] = "0b00111101100010100001101101011100";
        ram[12] = "0b00111101111000111011100010100010";
        ram[13] = "0b00111111011100110101111010110111";
        ram[14] = "0b00111101000101111101110100000001";
        ram[15] = "0b10110101100001100011011110111101";
        ram[16] = "0b00111000000101101111111010110101";
        ram[17] = "0b10111000000100101100110011110111";
        ram[18] = "0b00110110111010101110000110001011";
        ram[19] = "0b10110111100111110110001000110000";
        ram[20] = "0b00111110100111111100011110000010";
        ram[21] = "0b00111110100110001001011110000101";
        ram[22] = "0b00111101111101101110111001110100";
        ram[23] = "0b00111110000100011111110110011100";
        ram[24] = "0b00111000100111010100100101010010";
        ram[25] = "0b00110111011110111010100010000010";
        ram[26] = "0b00111100010110000011100000111011";
        ram[27] = "0b10110111100101101111111010110101";
        ram[28] = "0b00111111010001111110010011001101";
        ram[29] = "0b00111111000000011000101111100111";
        ram[30] = "0b00111101011100111011101110000100";
        ram[31] = "0b00111101110000101101101111101000";
        ram[32] = "0b00110110111010101110000110001011";
        ram[33] = "0b00110111100001100011011110111101";
        ram[34] = "0b10111000000000100000010111111111";
        ram[35] = "0b00110111100011101001101100111001";
        ram[36] = "0b00111101100111011011110100110000";
        ram[37] = "0b10110110100001100011011110111101";
        ram[38] = "0b00111101111010100000010001001011";
        ram[39] = "0b00110111000101101111111010110101";
        ram[40] = "0b00111101110100110000010110010110";
        ram[41] = "0b00110110100001100011011110111101";
        ram[42] = "0b00111111001011111001101011110010";
        ram[43] = "0b00111111001011010001011101000000";
        ram[44] = "0b00111111011101001001010110011110";
        ram[45] = "0b00111101101000100100011110001000";
        ram[46] = "0b10110110010010010101001110011100";
        ram[47] = "0b00111101101100100010000011111111";
        ram[48] = "0b10110111100011101001101100111001";
        ram[49] = "0b00111101111101010001010100000101";
        ram[50] = "0b00111111001010010010000101010111";
        ram[51] = "0b10110101100001100011011110111101";
        ram[52] = "0b00111110100101001011101010010101";
        ram[53] = "0b00110111000001100011011110111101";
        ram[54] = "0b10110111000001100011011110111101";
        ram[55] = "0b10110111000001100011011110111101";
        ram[56] = "0b00111101111111110110001010110111";
        ram[57] = "0b00110111100111110110001000110000";
        ram[58] = "0b00110110000001100011011110111101";
        ram[59] = "0b00111111000011011000110010110000";
        ram[60] = "0b00000000000000000000000000000000";
        ram[61] = "0b00110110101001111100010110101100";
        ram[62] = "0b00111111011000010011001101101110";
        ram[63] = "0b00110110010010010101001110011100";
        ram[64] = "0b00110101100001100011011110111101";
        ram[65] = "0b00111111001001110001010111101000";
        ram[66] = "0b10110110101001111100010110101100";
        ram[67] = "0b00111111000111011111101010101001";
        ram[68] = "0b00110110010010010101001110011100";
        ram[69] = "0b00111111011100000100010101000110";
        ram[70] = "0b10110110110010010101001110011100";
        ram[71] = "0b00111111011110001100011011100111";
        ram[72] = "0b00111111000111111010001110011000";
        ram[73] = "0b00111101101011101000101101111110";
        ram[74] = "0b10110110010010010101001110011100";
        ram[75] = "0b00110110000001100011011110111101";
        ram[76] = "0b00110101100001100011011110111101";
        ram[77] = "0b10110110000001100011011110111101";
        ram[78] = "0b00111110110011100110010011110101";
        ram[79] = "0b00111111001100000001110001110001";
        ram[80] = "0b00111111010111000101000110111001";
        ram[81] = "0b00111110100001001001101010111011";
        ram[82] = "0b10110110100001100011011110111101";
        ram[83] = "0b00111101101000110000010101010011";
        ram[84] = "0b00110110010010010101001110011100";
        ram[85] = "0b10110110100001100011011110111101";
        ram[86] = "0b00111110110010111011111010101001";
        ram[87] = "0b00110110000001100011011110111101";
        ram[88] = "0b00111110100110101110010010001111";
        ram[89] = "0b00111110100010001000111101000011";
        ram[90] = "0b10110110000001100011011110111101";
        ram[91] = "0b00111110010111100110010001101111";
        ram[92] = "0b00111110100010010101011110001010";
        ram[93] = "0b00111110011110010101111000011000";
        ram[94] = "0b00111110100100101110111111110110";
        ram[95] = "0b10110101100001100011011110111101";
        ram[96] = "0b00111110010110001010011111100111";
        ram[97] = "0b10110101100001100011011110111101";
        ram[98] = "0b00111110101010010011110000000100";
        ram[99] = "0b00111110011011010111010110011111";
        ram[100] = "0b00111110100001000001100111100011";
        ram[101] = "0b00111110100011101001000101100100";
        ram[102] = "0b00111111011001100010101001101111";
        ram[103] = "0b00111110011100000011111000100001";
        ram[104] = "0b00110110010010010101001110011100";
        ram[105] = "0b00110101100001100011011110111101";
        ram[106] = "0b00111111001000011100101100110110";
        ram[107] = "0b00000000000000000000000000000000";
        ram[108] = "0b10110101100001100011011110111101";
        ram[109] = "0b00110110010010010101001110011100";
        ram[110] = "0b00110101100001100011011110111101";
        ram[111] = "0b00111110100101111111001001011110";
        ram[112] = "0b10110110010010010101001110011100";
        ram[113] = "0b00111111010100001001010110101111";
        ram[114] = "0b00111111010000110001010110110101";
        ram[115] = "0b00110110000001100011011110111101";
        ram[116] = "0b00110101100001100011011110111101";
        ram[117] = "0b00111111010110001011000000101001";
        ram[118] = "0b00111111010001011000101001000100";
        ram[119] = "0b10110101100001100011011110111101";
        ram[120] = "0b00110101100001100011011110111101";
        ram[121] = "0b00111110101100101101101000110100";
        ram[122] = "0b00110101100001100011011110111101";
        ram[123] = "0b00000000000000000000000000000000";
        ram[124] = "0b10110110000001100011011110111101";
        ram[125] = "0b00111111010010110111110111011000";
        ram[126] = "0b10000000000000000000000000000000";
        ram[127] = "0b10000000000000000000000000000000";
        ram[128] = "0b00000000000000000000000000000000";
        ram[129] = "0b10110101100001100011011110111101";
        ram[130] = "0b00111111001111000000000010101000";
        ram[131] = "0b00111111000000010010000000011001";
        ram[132] = "0b00000000000000000000000000000000";
        ram[133] = "0b00111111001101001001000011100110";
        ram[134] = "0b00110101100001100011011110111101";
        ram[135] = "0b00111110111011001001000110110000";
        ram[136] = "0b00000000000000000000000000000000";
        ram[137] = "0b00111111011001011000011010000111";
        ram[138] = "0b00111110110110100101100011010110";
        ram[139] = "0b00111110110011011111011101000000";
        ram[140] = "0b00000000000000000000000000000000";
        ram[141] = "0b00111111011001001000110111010010";
        ram[142] = "0b00111111000010100110111110110101";
        ram[143] = "0b10000000000000000000000000000000";
        ram[144] = "0b10110101100001100011011110111101";
        ram[145] = "0b00000000000000000000000000000000";
        ram[146] = "0b10000000000000000000000000000000";
        ram[147] = "0b00111110001100000011111010100111";
        ram[148] = "0b10000000000000000000000000000000";
        ram[149] = "0b00000000000000000000000000000000";
        ram[150] = "0b00110101100001100011011110111101";
        ram[151] = "0b00111110110011100001110111001001";
        ram[152] = "0b00111110101100010111010001100000";
        ram[153] = "0b10000000000000000000000000000000";
        ram[154] = "0b00110101100001100011011110111101";
        ram[155] = "0b10000000000000000000000000000000";
        ram[156] = "0b00111110110101000010111011011100";
        ram[157] = "0b00111110110111101010001001001101";
        ram[158] = "0b00111111000000100100001011110010";
        ram[159] = "0b10000000000000000000000000000000";
        ram[160] = "0b00111110101100011011000010001010";
        ram[161] = "0b00000000000000000000000000000000";
        ram[162] = "0b00111110011010100101011001011000";
        ram[163] = "0b00000000000000000000000000000000";
        ram[164] = "0b10000000000000000000000000000000";
        ram[165] = "0b10000000000000000000000000000000";
        for (unsigned i = 166; i < 195 ; i = i + 1) {
            ram[i] = "0b00000000000000000000000000000000";
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


SC_MODULE(predict_ensemble_eJT) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_eJT_ram* meminst;


SC_CTOR(predict_ensemble_eJT) {
meminst = new predict_ensemble_eJT_ram("predict_ensemble_eJT_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_eJT() {
    delete meminst;
}


};//endmodule
#endif
