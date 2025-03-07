// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_cIz_H__
#define __predict_ensemble_cIz_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_cIz_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_cIz_ram) {
        ram[0] = "0b00111101001110110100110000111100";
        ram[1] = "0b00111010000001011011000110000101";
        ram[2] = "0b00111101011010000111010111010101";
        ram[3] = "0b00111110110001111101011110000000";
        ram[4] = "0b00111101100000010001000000011011";
        ram[5] = "0b00111000110111000011001101110010";
        ram[6] = "0b10111010000101101111111010110101";
        ram[7] = "0b00111001111101111111110011111100";
        ram[8] = "0b00111101100100001111111000000100";
        ram[9] = "0b10111010000001110100010000101100";
        ram[10] = "0b00111101001010101101100100100111";
        ram[11] = "0b00111001010111010011111111100010";
        ram[12] = "0b00111111011010101011110000011111";
        ram[13] = "0b00111111010111011000110110001011";
        ram[14] = "0b00111111001110101110111110100010";
        ram[15] = "0b00111111010100111000101100100110";
        ram[16] = "0b00111110110110100010111001111111";
        ram[17] = "0b10111010001110101010010110000011";
        ram[18] = "0b00111000110111000011001101110010";
        ram[19] = "0b00111111011100101110111100001011";
        ram[20] = "0b00111110010000011100010111000101";
        ram[21] = "0b00111001111110101001110000010011";
        ram[22] = "0b10111000010001010010000111011110";
        ram[23] = "0b00111111011010100101011010111101";
        ram[24] = "0b10111000111010001100100010101100";
        ram[25] = "0b10111001100011111010011110101000";
        ram[26] = "0b10111000001010111111011101101010";
        ram[27] = "0b00111110001011101100101001101000";
        ram[28] = "0b00111001010000011111110010001111";
        ram[29] = "0b00111000110010010101001110011100";
        ram[30] = "0b00111111010010000011110010001110";
        ram[31] = "0b00111101110001101100100101111110";
        ram[32] = "0b00111110000110000000101111101101";
        ram[33] = "0b00111110111001110001111100010101";
        ram[34] = "0b00111110100011011010001101011101";
        ram[35] = "0b00111110001101110000001010100011";
        ram[36] = "0b10111001001010011101111010001011";
        ram[37] = "0b10111000111110011000111110100011";
        ram[38] = "0b00110111011010101110000110001011";
        ram[39] = "0b00111110000000010001110000101010";
        ram[40] = "0b00111110001111101011110111010011";
        ram[41] = "0b00110111100001100011011110111101";
        ram[42] = "0b00111110110010111111111100000100";
        ram[43] = "0b00111110011011000001111010111101";
        ram[44] = "0b00111000101010111111011101101010";
        ram[45] = "0b00111110111100100101110010100011";
        ram[46] = "0b00111110010100010100111111001110";
        ram[47] = "0b10110111110000001111000000100000";
        ram[48] = "0b00111110111010001110110001010011";
        ram[49] = "0b00111110001011101110000001101110";
        ram[50] = "0b10111000011101110111011011000101";
        ram[51] = "0b10111000101111101101011101000001";
        ram[52] = "0b00111110101101111001111011100000";
        ram[53] = "0b00111000011010101110000110001011";
        ram[54] = "0b00111110011000100111000110111101";
        ram[55] = "0b00110110000001100011011110111101";
        ram[56] = "0b10110110010010010101001110011100";
        ram[57] = "0b00111000010100011011011100010111";
        ram[58] = "0b10110110000001100011011110111101";
        ram[59] = "0b10111000000111110110001000110000";
        ram[60] = "0b00110110000001100011011110111101";
        ram[61] = "0b10111000010101011110100011010101";
        ram[62] = "0b00111111011101000100000110111100";
        ram[63] = "0b00111111011000100100000010010110";
        ram[64] = "0b10111000000110110011000001110011";
        ram[65] = "0b00111110011100001100011100111011";
        ram[66] = "0b00111000001111001011111001100010";
        ram[67] = "0b00111000000111110110001000110000";
        ram[68] = "0b00111110001101001100011001100001";
        ram[69] = "0b00111110010111101000100101100101";
        ram[70] = "0b00111110100010101011000000100001";
        ram[71] = "0b00111000011011110001001101001001";
        ram[72] = "0b00111110100111100110110101011001";
        ram[73] = "0b00111110101111110100101110100101";
        ram[74] = "0b00111110100100101110111111110110";
        ram[75] = "0b00111111000100110110111000111111";
        ram[76] = "0b00111110000011101010101010110000";
        ram[77] = "0b00111110111101000000000010111001";
        ram[78] = "0b10111000101010011101111010001011";
        ram[79] = "0b00111000001110001000110010100100";
        ram[80] = "0b00111110101100110111011101011100";
        ram[81] = "0b00111110011100100100101000100111";
        ram[82] = "0b00111000000100101100110011110111";
        ram[83] = "0b10110111111110111010100010000010";
        ram[84] = "0b00110110010010010101001110011100";
        ram[85] = "0b00000000000000000000000000000000";
        ram[86] = "0b10110111100111110110001000110000";
        ram[87] = "0b00111111000101111001011000111010";
        ram[88] = "0b00111111010001101101110001111111";
        ram[89] = "0b00110111100111110110001000110000";
        ram[90] = "0b00111110011110010110111110101000";
        ram[91] = "0b00111111000011110110011100101100";
        ram[92] = "0b10111000011100110100010100000111";
        ram[93] = "0b00111111010000001001000111110011";
        ram[94] = "0b00111000100111010100100101010010";
        ram[95] = "0b00110110000001100011011110111101";
        ram[96] = "0b10110110101001111100010110101100";
        ram[97] = "0b00111110110111110000100101110100";
        ram[98] = "0b00110111111110111010100010000010";
        ram[99] = "0b00111110011000101001101110101110";
        ram[100] = "0b10110111110110100001101010010011";
        ram[101] = "0b10110111111010101110000110001011";
        ram[102] = "0b10110101100001100011011110111101";
        ram[103] = "0b10110111110010010101001110011100";
        ram[104] = "0b00111110110100101100101101100100";
        ram[105] = "0b00111110110110111001001100100101";
        ram[106] = "0b00111111011000111001110010100110";
        ram[107] = "0b00111110101110101100001100100010";
        ram[108] = "0b00111110110010011111101010111001";
        ram[109] = "0b00111111011000101110100100100101";
        ram[110] = "0b10110111101110001000110010100100";
        ram[111] = "0b00110111010110100001101010010011";
        ram[112] = "0b00111000000111110110001000110000";
        ram[113] = "0b00111110101011110001010001010101";
        ram[114] = "0b00111110111101000110011100010111";
        ram[115] = "0b00111101110111111101011100011011";
        ram[116] = "0b00110111110010010101001110011100";
        ram[117] = "0b00111111010101110111111011100101";
        ram[118] = "0b00110111011010101110000110001011";
        ram[119] = "0b00111110111100110101000000001001";
        ram[120] = "0b10110110110010010101001110011100";
        ram[121] = "0b10110111101100000010100100101000";
        ram[122] = "0b00111111011100111001110011101001";
        ram[123] = "0b10110110010010010101001110011100";
        ram[124] = "0b00110110010010010101001110011100";
        ram[125] = "0b00110110100001100011011110111101";
        ram[126] = "0b00111110111111001000010101011110";
        ram[127] = "0b00111110101111111111101111001110";
        ram[128] = "0b00111111000111010101011011100010";
        ram[129] = "0b10110110000001100011011110111101";
        ram[130] = "0b00110110000001100011011110111101";
        ram[131] = "0b10110111011010101110000110001011";
        ram[132] = "0b00111111011011101100000101011101";
        ram[133] = "0b10110110010010010101001110011100";
        ram[134] = "0b00110111110000001111000000100000";
        ram[135] = "0b00111110110011100111001110100011";
        ram[136] = "0b00111111001100000000000000000000";
        ram[137] = "0b00111110101000000000000000000000";
        ram[138] = "0b00111111011010110101101011011001";
        ram[139] = "0b10110111111000100111111000001111";
        ram[140] = "0b00110110010010010101001110011100";
        ram[141] = "0b10110101100001100011011110111101";
        ram[142] = "0b10110111100101101111111010110101";
        ram[143] = "0b00111111001010010000101000100100";
        ram[144] = "0b00110110111010101110000110001011";
        ram[145] = "0b00111110101100110001110100101110";
        ram[146] = "0b00111110111100010101111000111001";
        ram[147] = "0b00110111000001100011011110111101";
        ram[148] = "0b00111110110011100001111011010110";
        ram[149] = "0b00111111001100010001100101001000";
        ram[150] = "0b00110110010010010101001110011100";
        ram[151] = "0b00111111000010011010111001100000";
        ram[152] = "0b00111110001011100001110010011011";
        ram[153] = "0b10110111100001100011011110111101";
        ram[154] = "0b10110110100001100011011110111101";
        ram[155] = "0b10110101100001100011011110111101";
        ram[156] = "0b10110111000001100011011110111101";
        ram[157] = "0b00110110110010010101001110011100";
        ram[158] = "0b00111110111000000000000000000000";
        ram[159] = "0b00111111000110011110011110010110";
        ram[160] = "0b00111111001010100010111010010000";
        ram[161] = "0b00111111000111001100011010100100";
        ram[162] = "0b00110110110010010101001110011100";
        ram[163] = "0b00111111001110010001000010100001";
        ram[164] = "0b00111111000100100000110100110101";
        ram[165] = "0b10110101100001100011011110111101";
        ram[166] = "0b00110101100001100011011110111101";
        ram[167] = "0b00111111010001100101001101110110";
        ram[168] = "0b00110110100001100011011110111101";
        ram[169] = "0b00000000000000000000000000000000";
        ram[170] = "0b00110110100001100011011110111101";
        ram[171] = "0b00111111001101101001110001000101";
        ram[172] = "0b00111110111110111110100000110110";
        ram[173] = "0b00111111001000000010001011111111";
        ram[174] = "0b00111111001110111100101011001001";
        ram[175] = "0b10110110110010010101001110011100";
        ram[176] = "0b10110110010010010101001110011100";
        ram[177] = "0b00111110111110100010111001111111";
        ram[178] = "0b10110110110010010101001110011100";
        ram[179] = "0b00110110101001111100010110101100";
        ram[180] = "0b00000000000000000000000000000000";
        ram[181] = "0b10110110000001100011011110111101";
        ram[182] = "0b00111111001011001011000011010001";
        ram[183] = "0b00111111000101011101000101110000";
        ram[184] = "0b10110101100001100011011110111101";
        ram[185] = "0b00110110000001100011011110111101";
        ram[186] = "0b10110101100001100011011110111101";
        for (unsigned i = 187; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_cIz) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_cIz_ram* meminst;


SC_CTOR(predict_ensemble_cIz) {
meminst = new predict_ensemble_cIz_ram("predict_ensemble_cIz_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_cIz() {
    delete meminst;
}


};//endmodule
#endif
