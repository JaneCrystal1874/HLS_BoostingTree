// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_dBI_H__
#define __predict_ensemble_dBI_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_dBI_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_dBI_ram) {
        ram[0] = "0b00111101010010110010010100101101";
        ram[1] = "0b00111000110010110110110001111010";
        ram[2] = "0b00111111011100010101000010101001";
        ram[3] = "0b00111111011111000101000100010001";
        ram[4] = "0b00111000101100000010100100101000";
        ram[5] = "0b00111111011011101000100000010110";
        ram[6] = "0b00111000101111101101011101000001";
        ram[7] = "0b00111111011110010011001100001001";
        ram[8] = "0b10111001000100001011010000011000";
        ram[9] = "0b00111101011001100000111001010010";
        ram[10] = "0b10111000110111000011001101110010";
        ram[11] = "0b10111000010100011011011100010111";
        ram[12] = "0b00111101100001000011111101100000";
        ram[13] = "0b00111000010111100100110001010001";
        ram[14] = "0b00111101100101111010010111110100";
        ram[15] = "0b10111000101111101101011101000001";
        ram[16] = "0b00111101101001111010010110110001";
        ram[17] = "0b00111000001010111111011101101010";
        ram[18] = "0b00111111011010000010011111111010";
        ram[19] = "0b00111101111010110111010011011110";
        ram[20] = "0b10111000010001010010000111011110";
        ram[21] = "0b00111110111010111011010000101101";
        ram[22] = "0b00111110001111001000110010010011";
        ram[23] = "0b00111101101000100100011110001000";
        ram[24] = "0b10111000101111101101011101000001";
        ram[25] = "0b00111110100010010111001001101001";
        ram[26] = "0b00111110101000000011110100010100";
        ram[27] = "0b00111100110101111000001111100000";
        ram[28] = "0b00110111011110111010100010000010";
        ram[29] = "0b00111110001101011010110101010100";
        ram[30] = "0b00111000110010110110110001111010";
        ram[31] = "0b00111111001100000000000000000000";
        ram[32] = "0b00111110101010100001111111010001";
        ram[33] = "0b10110110000001100011011110111101";
        ram[34] = "0b10110111010110100001101010010011";
        ram[35] = "0b10110110101001111100010110101100";
        ram[36] = "0b00110110100001100011011110111101";
        ram[37] = "0b10111000111110111010100010000010";
        ram[38] = "0b00111110000010110111111111100001";
        ram[39] = "0b00111000001100000010100100101000";
        ram[40] = "0b00111101110011000001011111101100";
        ram[41] = "0b10110111101110001000110010100100";
        ram[42] = "0b00111101111010010011111100101001";
        ram[43] = "0b10110111101001111100010110101100";
        ram[44] = "0b00111110001111000011111100111110";
        ram[45] = "0b10110111011010101110000110001011";
        ram[46] = "0b00111110101101100110111010101000";
        ram[47] = "0b00111111010100001001000010000010";
        ram[48] = "0b00111101100001100111100011000000";
        ram[49] = "0b00111110010100110010101011010000";
        ram[50] = "0b00110111011010101110000110001011";
        ram[51] = "0b00111111001001111001111010011101";
        ram[52] = "0b00111000101010011101111010001011";
        ram[53] = "0b10111000110001010010000111011110";
        ram[54] = "0b00111100010101010110001010011110";
        ram[55] = "0b00110111001001111100010110101100";
        ram[56] = "0b00111110100001001100111100000111";
        ram[57] = "0b00111111001010001110000110000010";
        ram[58] = "0b00111111001011111000100111100111";
        ram[59] = "0b00110111110110100001101010010011";
        ram[60] = "0b00111111011000001011100111101101";
        ram[61] = "0b10110110110010010101001110011100";
        ram[62] = "0b00111110011101010101111111111110";
        ram[63] = "0b00111101110111001100001000001101";
        ram[64] = "0b10110111011010101110000110001011";
        ram[65] = "0b00111000000111110110001000110000";
        ram[66] = "0b00110110100001100011011110111101";
        ram[67] = "0b00111111010101111010001001011001";
        ram[68] = "0b00111111011100010010100110111011";
        ram[69] = "0b00110110110010010101001110011100";
        ram[70] = "0b00111110101100000001101001111010";
        ram[71] = "0b00110111100101101111111010110101";
        ram[72] = "0b00111111010000010111010001100000";
        ram[73] = "0b00111110100101101010101101111010";
        ram[74] = "0b00110111111100110100010100000111";
        ram[75] = "0b10111000010001010010000111011110";
        ram[76] = "0b00110111100001100011011110111101";
        ram[77] = "0b00111110001101101001011000011100";
        ram[78] = "0b10110110100001100011011110111101";
        ram[79] = "0b00111111001011101001100100100000";
        ram[80] = "0b00111110111110110011000101111111";
        ram[81] = "0b00111110110010101011100010000100";
        ram[82] = "0b00111111011000101101000110111111";
        ram[83] = "0b00110101100001100011011110111101";
        ram[84] = "0b00111110100100111001100001000010";
        ram[85] = "0b00111101111111011011100001111000";
        ram[86] = "0b00111111001000100001001101001101";
        ram[87] = "0b10110101100001100011011110111101";
        ram[88] = "0b10110111000101101111111010110101";
        ram[89] = "0b00110110010010010101001110011100";
        ram[90] = "0b00110111101001111100010110101100";
        ram[91] = "0b00111110011011100011001001011101";
        ram[92] = "0b10110111000101101111111010110101";
        ram[93] = "0b00111110101001000100010111001100";
        ram[94] = "0b10000000000000000000000000000000";
        ram[95] = "0b10110110100001100011011110111101";
        ram[96] = "0b00111111001100101110100011000000";
        ram[97] = "0b00110111001110001000110010100100";
        ram[98] = "0b00110101100001100011011110111101";
        ram[99] = "0b10110111010010010101001110011100";
        ram[100] = "0b00111111010110110111101000101101";
        ram[101] = "0b10110110000001100011011110111101";
        ram[102] = "0b10000000000000000000000000000000";
        ram[103] = "0b00111111001110000010100011110110";
        ram[104] = "0b00110110010010010101001110011100";
        ram[105] = "0b00111111010011111011111000110100";
        ram[106] = "0b00110111001110001000110010100100";
        ram[107] = "0b00111111000111111000010110000011";
        ram[108] = "0b00110110010010010101001110011100";
        ram[109] = "0b00111111010001001001001101110101";
        ram[110] = "0b00110110111010101110000110001011";
        ram[111] = "0b00111110110011000001011101000100";
        ram[112] = "0b10110110000001100011011110111101";
        ram[113] = "0b00111111011000010000010101111101";
        ram[114] = "0b10110111000001100011011110111101";
        ram[115] = "0b00111111010011000100010000000111";
        ram[116] = "0b00111110111101001010000110101101";
        ram[117] = "0b00111111001101000101110100010000";
        ram[118] = "0b00110111100001100011011110111101";
        ram[119] = "0b10000000000000000000000000000000";
        ram[120] = "0b10110110010010010101001110011100";
        ram[121] = "0b00110110000001100011011110111101";
        ram[122] = "0b10000000000000000000000000000000";
        ram[123] = "0b00111111001001100101010110110000";
        ram[124] = "0b00111111000011100111001100001100";
        ram[125] = "0b00111111000110110011100000101110";
        ram[126] = "0b10110110100001100011011110111101";
        ram[127] = "0b00111110110001000111100100101101";
        ram[128] = "0b10110111010010010101001110011100";
        ram[129] = "0b00111111001010111100001101100001";
        ram[130] = "0b00110110000001100011011110111101";
        ram[131] = "0b10000000000000000000000000000000";
        ram[132] = "0b00110101100001100011011110111101";
        ram[133] = "0b00111111010001000001000000011111";
        ram[134] = "0b10110110000001100011011110111101";
        ram[135] = "0b00111111010000000100100110001000";
        ram[136] = "0b00110110100001100011011110111101";
        ram[137] = "0b00111111001101101110100011000000";
        ram[138] = "0b10110110010010010101001110011100";
        ram[139] = "0b00111111011001110111100000000011";
        ram[140] = "0b00111110111011110100000000111110";
        ram[141] = "0b00111110101100010000001010011011";
        ram[142] = "0b10110110000001100011011110111101";
        ram[143] = "0b10000000000000000000000000000000";
        ram[144] = "0b00110110010010010101001110011100";
        ram[145] = "0b00111110110101000101011111000001";
        ram[146] = "0b00111111001010010000011000010100";
        ram[147] = "0b00111110101101010010100000101000";
        ram[148] = "0b10110110000001100011011110111101";
        ram[149] = "0b00111111000111010010010111011101";
        ram[150] = "0b00111110111001111001100000001111";
        ram[151] = "0b00110101100001100011011110111101";
        ram[152] = "0b10110101100001100011011110111101";
        ram[153] = "0b00111111000010110101101101001111";
        ram[154] = "0b00111111000001000010111001000101";
        ram[155] = "0b00110101100001100011011110111101";
        ram[156] = "0b00111111001101101100110010100011";
        ram[157] = "0b00111110111101101000111110110000";
        ram[158] = "0b00110101100001100011011110111101";
        ram[159] = "0b00111110111000111000011001001101";
        ram[160] = "0b10110110000001100011011110111101";
        ram[161] = "0b00110101100001100011011110111101";
        ram[162] = "0b10000000000000000000000000000000";
        ram[163] = "0b00111110111011001000100110110001";
        ram[164] = "0b00111110111100100101000100111011";
        ram[165] = "0b00110101100001100011011110111101";
        ram[166] = "0b10110101100001100011011110111101";
        ram[167] = "0b00111111000011110111001100111011";
        ram[168] = "0b00110101100001100011011110111101";
        ram[169] = "0b10110101100001100011011110111101";
        ram[170] = "0b10000000000000000000000000000000";
        ram[171] = "0b00111110110101100001111000101110";
        ram[172] = "0b00111110110011001101111011000010";
        ram[173] = "0b00110101100001100011011110111101";
        ram[174] = "0b00111110110111011110001010001011";
        ram[175] = "0b00000000000000000000000000000000";
        ram[176] = "0b10110101100001100011011110111101";
        ram[177] = "0b10000000000000000000000000000000";
        for (unsigned i = 178; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_dBI) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_dBI_ram* meminst;


SC_CTOR(predict_ensemble_dBI) {
meminst = new predict_ensemble_dBI_ram("predict_ensemble_dBI_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_dBI() {
    delete meminst;
}


};//endmodule
#endif
