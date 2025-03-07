// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_cjv_H__
#define __predict_ensemble_cjv_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_cjv_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_cjv_ram) {
        ram[0] = "0b00111111011010101011110000011111";
        ram[1] = "0b00111101000010110010011101000110";
        ram[2] = "0b00111101110000110000000100100001";
        ram[3] = "0b00111010101111100101000100001001";
        ram[4] = "0b00111110000010111000111111011110";
        ram[5] = "0b10111010111000010101000000010010";
        ram[6] = "0b00111001100111100101010111000001";
        ram[7] = "0b10111010000101011010111100101001";
        ram[8] = "0b00111111011101110111111110111111";
        ram[9] = "0b00111101010100110010010100001011";
        ram[10] = "0b00111001110011100000101110010001";
        ram[11] = "0b10111010001000000010101110000100";
        ram[12] = "0b00111101011010000111010111010101";
        ram[13] = "0b00111001101011111010001011110000";
        ram[14] = "0b00111111011101100101011000010101";
        ram[15] = "0b00111111011011100101000000001101";
        ram[16] = "0b10111001001110111011000111110010";
        ram[17] = "0b00111110100010110011111000010100";
        ram[18] = "0b00111001011010111110110111111010";
        ram[19] = "0b00111110101110001100111001110000";
        ram[20] = "0b00111101110001011101000110000001";
        ram[21] = "0b00111001111010110110011111000011";
        ram[22] = "0b00111110111010111101010010101110";
        ram[23] = "0b10111001110100000010010001110000";
        ram[24] = "0b00111111011000000001100011100111";
        ram[25] = "0b00111110010000000001111011101111";
        ram[26] = "0b00111110000110000010001111001000";
        ram[27] = "0b00111111011010111101011100101100";
        ram[28] = "0b10111001001101000101101011100110";
        ram[29] = "0b10111001100000001111100110010000";
        ram[30] = "0b10110111100001100011011110111101";
        ram[31] = "0b00111111010011010001011101000000";
        ram[32] = "0b00111110100100101001100100110001";
        ram[33] = "0b00111111010101010111000100001001";
        ram[34] = "0b00111110111110000101011001100000";
        ram[35] = "0b00111101001010101101100100100111";
        ram[36] = "0b00111101111000100111110110001001";
        ram[37] = "0b00111110101000100010101100010111";
        ram[38] = "0b00111001000010110111010111101010";
        ram[39] = "0b00111101110101111001000011111011";
        ram[40] = "0b00111001011111001011010011110010";
        ram[41] = "0b10111001100001100011011110111101";
        ram[42] = "0b00111111011011010100110001000100";
        ram[43] = "0b00111000111001101010111111001101";
        ram[44] = "0b00111110111100111011001110000101";
        ram[45] = "0b00111000100111110110001000110000";
        ram[46] = "0b00111001001110001000110010100100";
        ram[47] = "0b00111111000010000001111011001101";
        ram[48] = "0b10111001010001110011101010111101";
        ram[49] = "0b00111000111101110111011011000101";
        ram[50] = "0b00111111010000000010010010100010";
        ram[51] = "0b10111001011010011101010100011011";
        ram[52] = "0b00111111000001111010110010000010";
        ram[53] = "0b00111000000001100011011110111101";
        ram[54] = "0b10111000011010101110000110001011";
        ram[55] = "0b00111101110101101001000110100111";
        ram[56] = "0b00111111000011101001100001111000";
        ram[57] = "0b00111111011010001001010011100110";
        ram[58] = "0b00111111010000000011001111000110";
        ram[59] = "0b00111111000000101001011100000111";
        ram[60] = "0b00111111000111100011001111001110";
        ram[61] = "0b00111000100111110110001000110000";
        ram[62] = "0b00111110100001100010111110011101";
        ram[63] = "0b10111000110111100100110001010001";
        ram[64] = "0b10111000010110100001101010010011";
        ram[65] = "0b00111111010011101000101110100000";
        ram[66] = "0b00111001000011101001101100111001";
        ram[67] = "0b00110110100001100011011110111101";
        ram[68] = "0b10111001000011101001101100111001";
        ram[69] = "0b00111110111001000000111000010111";
        ram[70] = "0b00111001000000100000010111111111";
        ram[71] = "0b10110111100011101001101100111001";
        ram[72] = "0b10111001000111010100100101010010";
        ram[73] = "0b00111110001011101001000111001001";
        ram[74] = "0b00111110010101001100011011100111";
        ram[75] = "0b00111111011001100011110110010010";
        ram[76] = "0b10111000110010110110110001111010";
        ram[77] = "0b00111000100110110011000001110011";
        ram[78] = "0b00111111000110000110111101011000";
        ram[79] = "0b10111000010100011011011100010111";
        ram[80] = "0b00110111001001111100010110101100";
        ram[81] = "0b00111000110111100100110001010001";
        ram[82] = "0b10110110101001111100010110101100";
        ram[83] = "0b00111111010111101101011001000101";
        ram[84] = "0b00111000100110110011000001110011";
        ram[85] = "0b00111111000000101111011110100001";
        ram[86] = "0b00111110001111000011101101001111";
        ram[87] = "0b00111110100101000101110100100000";
        ram[88] = "0b10111000100000100000010111111111";
        ram[89] = "0b10110111101100000010100100101000";
        ram[90] = "0b00111000011000100111111000001111";
        ram[91] = "0b10111000101111001011111001100010";
        ram[92] = "0b10110110111010101110000110001011";
        ram[93] = "0b00111111000010011001111000110000";
        ram[94] = "0b00111110000011101010101010110000";
        ram[95] = "0b00111110110100000011111001100100";
        ram[96] = "0b10110110110010010101001110011100";
        ram[97] = "0b00111000000100101100110011110111";
        ram[98] = "0b00111110011011100010101110001100";
        ram[99] = "0b00111000101000010111101100001111";
        ram[100] = "0b00111111000111100011000011001011";
        ram[101] = "0b00111111000000011111101000000001";
        ram[102] = "0b00111111001100011100000100101111";
        ram[103] = "0b00110110000001100011011110111101";
        ram[104] = "0b00111000001001111100010110101100";
        ram[105] = "0b00111110110010110101101011101010";
        ram[106] = "0b10111000100101001110010111010110";
        ram[107] = "0b00111101111101100010100001000110";
        ram[108] = "0b00111110111000111100100011100010";
        ram[109] = "0b00111110111001000110001011000011";
        ram[110] = "0b00110111011010101110000110001011";
        ram[111] = "0b10110111111110111010100010000010";
        ram[112] = "0b00111110000001001110001100110111";
        ram[113] = "0b00110110000001100011011110111101";
        ram[114] = "0b00111000001110001000110010100100";
        ram[115] = "0b10111000000011101001101100111001";
        ram[116] = "0b10110111000001100011011110111101";
        ram[117] = "0b00111000000110110011000001110011";
        ram[118] = "0b00111110101010111010001011100000";
        ram[119] = "0b00111111001011111001101011110010";
        ram[120] = "0b00111111001110000011111100001100";
        ram[121] = "0b10110110110010010101001110011100";
        ram[122] = "0b10111000000110110011000001110011";
        ram[123] = "0b00111110101100011101010000110000";
        ram[124] = "0b00111111010000101101001110100110";
        ram[125] = "0b00110111101001111100010110101100";
        ram[126] = "0b00111111011000100010100000010011";
        ram[127] = "0b00110110100001100011011110111101";
        ram[128] = "0b00110111111100110100010100000111";
        ram[129] = "0b00111111001010000011101001110101";
        ram[130] = "0b00110111100111110110001000110000";
        ram[131] = "0b00111111010101111000111010110000";
        ram[132] = "0b10111000000011101001101100111001";
        ram[133] = "0b00111111000001100111010011010001";
        ram[134] = "0b10110111110110100001101010010011";
        ram[135] = "0b00111111000000101010110000010001";
        ram[136] = "0b00111111000101011101000101110000";
        ram[137] = "0b00111111010000101000110011011111";
        ram[138] = "0b00111110110000001000001110111010";
        ram[139] = "0b00111111000011011001110010001101";
        ram[140] = "0b00111111001010111010010010100101";
        ram[141] = "0b00111111000010110000010100010000";
        ram[142] = "0b00111110110011010101000011001010";
        ram[143] = "0b10111000001010111111011101101010";
        ram[144] = "0b10110111000101101111111010110101";
        ram[145] = "0b00110111110100011011011100010111";
        ram[146] = "0b00110111011110111010100010000010";
        ram[147] = "0b00111111000111011000010001111111";
        ram[148] = "0b10110111001110001000110010100100";
        ram[149] = "0b00111110101110011100011001001100";
        ram[150] = "0b00111110110011100001000110011001";
        ram[151] = "0b00111000000101101111111010110101";
        ram[152] = "0b00111111000011010001011001000100";
        ram[153] = "0b00110111000101101111111010110101";
        ram[154] = "0b00000000000000000000000000000000";
        ram[155] = "0b00111110110011000001111001111001";
        ram[156] = "0b00111110100001000011011000010001";
        ram[157] = "0b00110110100001100011011110111101";
        ram[158] = "0b00111110111111100101110011110110";
        ram[159] = "0b00111111010010101001000010111100";
        ram[160] = "0b00110111110010010101001110011100";
        ram[161] = "0b10110111101110001000110010100100";
        ram[162] = "0b00111110011001010000100101111101";
        ram[163] = "0b10110111100001100011011110111101";
        ram[164] = "0b00111110111100011110000101001100";
        ram[165] = "0b00111110101101001000001010111111";
        ram[166] = "0b00111111000110111011001001111001";
        ram[167] = "0b00110110110010010101001110011100";
        ram[168] = "0b10110111100111110110001000110000";
        ram[169] = "0b10110111011110111010100010000010";
        ram[170] = "0b10110110010010010101001110011100";
        ram[171] = "0b00110111101110001000110010100100";
        ram[172] = "0b00111110000110000000101111101101";
        ram[173] = "0b10111000001000111001001111101110";
        ram[174] = "0b10110111011010101110000110001011";
        ram[175] = "0b10110111011010101110000110001011";
        ram[176] = "0b00111111001000011001010011000000";
        ram[177] = "0b00110111100101101111111010110101";
        ram[178] = "0b00111110110111000000110111110110";
        ram[179] = "0b00110111001110001000110010100100";
        ram[180] = "0b10110111001001111100010110101100";
        ram[181] = "0b00111110110100111010110101011100";
        ram[182] = "0b00111110111000100101101000000100";
        ram[183] = "0b00111110111001101100111101000010";
        ram[184] = "0b00110111010010010101001110011100";
        ram[185] = "0b10110111001110001000110010100100";
        ram[186] = "0b00110110100001100011011110111101";
        ram[187] = "0b00110111001001111100010110101100";
        ram[188] = "0b10110110010010010101001110011100";
        for (unsigned i = 189; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_cjv) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_cjv_ram* meminst;


SC_CTOR(predict_ensemble_cjv) {
meminst = new predict_ensemble_cjv_ram("predict_ensemble_cjv_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_cjv() {
    delete meminst;
}


};//endmodule
#endif
