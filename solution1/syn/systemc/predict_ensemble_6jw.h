// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_6jw_H__
#define __predict_ensemble_6jw_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_6jw_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_6jw_ram) {
        ram[0] = "0b00111110010010111010001100000001";
        ram[1] = "0b00111110001101000101110011111111";
        ram[2] = "0b00111111011001011001110101100111";
        ram[3] = "0b00111110111010110101110110101011";
        ram[4] = "0b10111111100000010001111000010001";
        ram[5] = "0b00111101111101110011001000010110";
        ram[6] = "0b10111111000101111101111101111111";
        ram[7] = "0b00111110111010000010110001001101";
        ram[8] = "0b00111110101111110110010010001100";
        ram[9] = "0b00111111011100000101101100001000";
        ram[10] = "0b00111110010010000011011010101000";
        ram[11] = "0b00111111001000100011111100100101";
        ram[12] = "0b10111111100101101010110010011111";
        ram[13] = "0b00111110100110001001111111101000";
        ram[14] = "0b10111100110110110110111001010000";
        ram[15] = "0b00111111000001101110000000111011";
        ram[16] = "0b00111101111110010110001010001101";
        ram[17] = "0b00111110100110110111101110001101";
        ram[18] = "0b10111110110110000010110101111011";
        ram[19] = "0b00111110000001001011010100010011";
        ram[20] = "0b10111111101000111101011100001010";
        ram[21] = "0b00111111011001100100000100011100";
        ram[22] = "0b00111110000000001110100101001111";
        ram[23] = "0b10111110000110001100100101110101";
        ram[24] = "0b00111100110011001100110011001101";
        ram[25] = "0b00111110001111000000100011111010";
        ram[26] = "0b10111111001110111011101110110110";
        ram[27] = "0b00111111010111000100101111000010";
        ram[28] = "0b00111111000001001101111010001111";
        ram[29] = "0b00111111101010001111010111000011";
        ram[30] = "0b00111111000101110101000111110000";
        ram[31] = "0b00000000000000000000000000000000";
        ram[32] = "0b00111110010011001100110011001101";
        ram[33] = "0b00111110011010100000111010000100";
        ram[34] = "0b00111111000000001111011010011101";
        ram[35] = "0b00111110110110000100100000111000";
        ram[36] = "0b00111111011101011000111001010100";
        ram[37] = "0b00111111000101000100001001010011";
        ram[38] = "0b00111111001011000101000100010001";
        ram[39] = "0b10111110101000111101011100001010";
        ram[40] = "0b11000000001100001010001111010111";
        ram[41] = "0b00111111011011011100100010101000";
        ram[42] = "0b00111111000000100111011100101101";
        ram[43] = "0b00111111010110011001100110011010";
        ram[44] = "0b00111101110001111110110001111000";
        ram[45] = "0b00111111000100111011100101111100";
        ram[46] = "0b00111111011000010010010010001101";
        ram[47] = "0b00111110110011111100111010111000";
        ram[48] = "0b00111110000101101011110110110010";
        ram[49] = "0b10111110011101011100001010001111";
        ram[50] = "0b00111110111100100010011011000100";
        ram[51] = "0b10111111100001000100010001000001";
        ram[52] = "0b00111101101011010110011101110111";
        ram[53] = "0b00111111000000001110110001010011";
        ram[54] = "0b00111111000110001111110000011110";
        ram[55] = "0b10111111110001111010111000010100";
        ram[56] = "0b00111111000111001011100110101010";
        ram[57] = "0b00111111011110101110000101001000";
        ram[58] = "0b00111110001010010100100111101001";
        ram[59] = "0b00111110011101011100001010001111";
        ram[60] = "0b00111111001000111101011100001010";
        ram[61] = "0b00000000000000000000000000000000";
        ram[62] = "0b10111111000010011100000010011000";
        ram[63] = "0b00111110100000011111000110101110";
        ram[64] = "0b00111111000001111111010011111101";
        ram[65] = "0b00111111001001001111011101010101";
        ram[66] = "0b00111110101101001011010100010011";
        ram[67] = "0b10111110101001100110011001100110";
        ram[68] = "0b10111100100001011100000000110011";
        ram[69] = "0b10111111011000010100011110101110";
        ram[70] = "0b00111101110111011101011011100000";
        ram[71] = "0b10111111001000111101011100001010";
        ram[72] = "0b00111110110100000010110110011101";
        ram[73] = "0b10111111100110011001100110011010";
        ram[74] = "0b00111111000100101001000010011011";
        ram[75] = "0b00111110110111001100110101110101";
        ram[76] = "0b00111111111011010000100101111101";
        ram[77] = "0b00111110101001101110110111101110";
        ram[78] = "0b00111111010100101001010010101011";
        ram[79] = "0b00111110101100100111110100100100";
        ram[80] = "0b00111110111100100110010011100101";
        ram[81] = "0b00111110110000111001000110010010";
        ram[82] = "0b00111110110101100110011101010001";
        ram[83] = "0b00111111000100000001100010100100";
        ram[84] = "0b10111111000101111110010010101100";
        ram[85] = "0b00111110111101100011001011000010";
        ram[86] = "0b00111111000010110111010110100111";
        ram[87] = "0b00111110111000101110100011000000";
        ram[88] = "0b10111111000000111010100000111111";
        ram[89] = "0b00111111100111101100011111101011";
        ram[90] = "0b00111111001000111000010100011111";
        ram[91] = "0b00111111010001010111011011111111";
        ram[92] = "0b00111111010111011111001100001110";
        ram[93] = "0b00111110101000100110101010000111";
        ram[94] = "0b00111101110111110000011011110111";
        ram[95] = "0b00111111100000110011001100110011";
        ram[96] = "0b00111110011110100110001110110111";
        ram[97] = "0b10111110100101111000001010010000";
        ram[98] = "0b00111101111011010100111011010011";
        ram[99] = "0b00111111100100000001011101100101";
        ram[100] = "0b00111110100011000011111110100011";
        ram[101] = "0b10111110000010001000100001110010";
        ram[102] = "0b00111110100001000010010100000111";
        ram[103] = "0b00111111011010011100011111011110";
        ram[104] = "0b00111110010111100010001100101001";
        ram[105] = "0b00111111001101010100100111011000";
        ram[106] = "0b00111111001001111100101100101110";
        ram[107] = "0b10111110111011101110111011111010";
        ram[108] = "0b10111110000011001100110011001101";
        ram[109] = "0b00111111010000000101110101000010";
        ram[110] = "0b00111111010111011111110000101011";
        ram[111] = "0b00000000000000000000000000000000";
        ram[112] = "0b00111110101010000110101100111000";
        ram[113] = "0b00111111000001010001111010111000";
        ram[114] = "0b00111111001011000011001110110101";
        ram[115] = "0b00111111001110000101000111101100";
        ram[116] = "0b00111110110100100110001001000101";
        ram[117] = "0b00111111001101001101100101110011";
        ram[118] = "0b10111110110010000011111110110011";
        ram[119] = "0b00111111001000110101100001101101";
        ram[120] = "0b00111110110101011111000101011010";
        ram[121] = "0b10111110100000100111000000101010";
        ram[122] = "0b10111101011111001101011010000000";
        ram[123] = "0b00111110110001010101110001110100";
        ram[124] = "0b00000000000000000000000000000000";
        ram[125] = "0b10111110100111110100100111110001";
        ram[126] = "0b00000000000000000000000000000000";
        ram[127] = "0b10111110111101011100001010001111";
        ram[128] = "0b10111110101101100000101101110000";
        ram[129] = "0b00111110101100101001100000000011";
        ram[130] = "0b00111110010110101001100001100111";
        ram[131] = "0b00111110100110011001100110011010";
        ram[132] = "0b00111110111111110011110000101110";
        ram[133] = "0b10111110100000001011101101001101";
        ram[134] = "0b00111111001100010001010101011001";
        ram[135] = "0b00111111001110001010010111110000";
        ram[136] = "0b00111110110111101101100101011010";
        ram[137] = "0b00111101100101111011010000011100";
        ram[138] = "0b00111110111000111000111000101010";
        ram[139] = "0b00111110100100110101111110000001";
        ram[140] = "0b00111110101111101011001011010001";
        ram[141] = "0b00111101110100100010111100100111";
        ram[142] = "0b00111111010000101000111101011100";
        ram[143] = "0b10111110110001010111110001001110";
        ram[144] = "0b00111110001101010101010100111111";
        ram[145] = "0b00111111010100110111010101110101";
        ram[146] = "0b00111101111000111000111000101010";
        ram[147] = "0b00111111001101011010011001100001";
        ram[148] = "0b00111110001111001100101111000000";
        ram[149] = "0b10111110110001100110011001100110";
        ram[150] = "0b00000000000000000000000000000000";
        ram[151] = "0b00111110100101100001011001110010";
        ram[152] = "0b10111111000101001011100101000101";
        ram[153] = "0b00111110111100101100111010101011";
        ram[154] = "0b10111110010000101000111101011100";
        ram[155] = "0b00000000000000000000000000000000";
        ram[156] = "0b00111110010011001100110011001101";
        ram[157] = "0b10111101101000111101011100001010";
        ram[158] = "0b00000000000000000000000000000000";
        ram[159] = "0b00111101100110011001100110011010";
        ram[160] = "0b00111111001110010000011111111011";
        ram[161] = "0b00111111010010000100000010001110";
        ram[162] = "0b10111110001100110011001100110011";
        ram[163] = "0b00111110100011111011100010110010";
        ram[164] = "0b00111110111000000010001110000101";
        ram[165] = "0b00111111001101110111011101111101";
        ram[166] = "0b00111110001101001110100000110010";
        ram[167] = "0b00111110101101010110010011111001";
        ram[168] = "0b00000000000000000000000000000000";
        ram[169] = "0b00111110111001001110111110001001";
        ram[170] = "0b10111110100010001000100010010100";
        ram[171] = "0b00111111000001010001111010111000";
        ram[172] = "0b00111100101101100000101011101001";
        ram[173] = "0b00111110100010100100110001100010";
        ram[174] = "0b00111110011101011100001010001111";
        ram[175] = "0b00111110100011010010001100001100";
        ram[176] = "0b00111101111101011100001010001111";
        ram[177] = "0b00111110010100011110010010110100";
        ram[178] = "0b10111101101000111101011100001010";
        ram[179] = "0b00000000000000000000000000000000";
        ram[180] = "0b00111101101000111101011100001010";
        for (unsigned i = 181; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_6jw) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_6jw_ram* meminst;


SC_CTOR(predict_ensemble_6jw) {
meminst = new predict_ensemble_6jw_ram("predict_ensemble_6jw_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_6jw() {
    delete meminst;
}


};//endmodule
#endif
