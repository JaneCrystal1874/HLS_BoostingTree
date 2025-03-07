// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_bAo_H__
#define __predict_ensemble_bAo_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_bAo_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_bAo_ram) {
        ram[0] = "0b00111100001110101000100000100111";
        ram[1] = "0b10111011000100100000001110100011";
        ram[2] = "0b00111100011001110100101011111101";
        ram[3] = "0b00111011010111010001111001010100";
        ram[4] = "0b00111101100000010001000000011011";
        ram[5] = "0b00111111011101000001100100111011";
        ram[6] = "0b00111101100100001111111000000100";
        ram[7] = "0b00111110101100111011111000000001";
        ram[8] = "0b00111011001110010001001011011100";
        ram[9] = "0b10111011000110001101010001111000";
        ram[10] = "0b00111101110100000010000111010001";
        ram[11] = "0b10111010101010101100100101101101";
        ram[12] = "0b00111110111011111100100001101101";
        ram[13] = "0b10111010011011100000011011011001";
        ram[14] = "0b00111110001001101111101111010010";
        ram[15] = "0b00111011000001101111000001001010";
        ram[16] = "0b00111101010111110111011100101001";
        ram[17] = "0b00111010101000100100010001100011";
        ram[18] = "0b00111110010110100010010010001001";
        ram[19] = "0b10111010101010111011010001001110";
        ram[20] = "0b00111010000110011001110111001011";
        ram[21] = "0b00111110010000111010000111010011";
        ram[22] = "0b00111101110001101100100101111110";
        ram[23] = "0b00111000111110011000111110100011";
        ram[24] = "0b10111010101010000100101111100100";
        ram[25] = "0b00111111001001011101000101110000";
        ram[26] = "0b00111101110100110000010110010110";
        ram[27] = "0b00111001011100000001111110111000";
        ram[28] = "0b10111010101110011011101010100001";
        ram[29] = "0b00111010010111110001010110100101";
        ram[30] = "0b00111111010111000010011100100000";
        ram[31] = "0b00111111011110000111011001111101";
        ram[32] = "0b00111010000111001100001100011010";
        ram[33] = "0b00111111011001001101000101000010";
        ram[34] = "0b00111010000010011110001101000011";
        ram[35] = "0b00111101111100101101001010111011";
        ram[36] = "0b00111110110111011111111011111100";
        ram[37] = "0b00111110111001111000001010110010";
        ram[38] = "0b00111101111110010110001010001101";
        ram[39] = "0b10111010100000010011110010101100";
        ram[40] = "0b00111001100000100000010111111111";
        ram[41] = "0b10111010000101011111001001000101";
        ram[42] = "0b10111000110100111100111111110110";
        ram[43] = "0b00111010000101001110010111010110";
        ram[44] = "0b00111110000011111100000100010110";
        ram[45] = "0b00111001110001111100000011110100";
        ram[46] = "0b00111110010111001000001111101101";
        ram[47] = "0b00111110111101100011111110111100";
        ram[48] = "0b00111111010101011101000101110000";
        ram[49] = "0b10111010001001111000001010010000";
        ram[50] = "0b00111110001100000011111001100100";
        ram[51] = "0b00111111010111000101000110111001";
        ram[52] = "0b00111110110011011001110101110111";
        ram[53] = "0b00111000100110110011000001110011";
        ram[54] = "0b10111001100010111111110000100010";
        ram[55] = "0b00111110000000000110100001010101";
        ram[56] = "0b00111001110100001010101010101000";
        ram[57] = "0b00110111110000001111000000100000";
        ram[58] = "0b00111010010000010111011001010111";
        ram[59] = "0b10111001110000111000111100110110";
        ram[60] = "0b00111111011110100011100001110110";
        ram[61] = "0b00111111011011100101110001011111";
        ram[62] = "0b00111001101011000111110110100010";
        ram[63] = "0b00111110100001101101101011101100";
        ram[64] = "0b00111110111001101011001011110010";
        ram[65] = "0b00111111001010111011100000011011";
        ram[66] = "0b00111110100110001010100010001111";
        ram[67] = "0b00111001001110011001100100010011";
        ram[68] = "0b10111001110011111001111000111000";
        ram[69] = "0b00111110011100000000000111010110";
        ram[70] = "0b10111001111010110110011111000011";
        ram[71] = "0b00111110011010111100110011110011";
        ram[72] = "0b00111110000001011001000000111010";
        ram[73] = "0b00111111001000010000100000111110";
        ram[74] = "0b00111110101100111111100001110111";
        ram[75] = "0b00111000001001111100010110101100";
        ram[76] = "0b00111001101011011000101000010001";
        ram[77] = "0b00111001100110111011011010101010";
        ram[78] = "0b00111110000100111010000101001101";
        ram[79] = "0b00111001001100010011010110011000";
        ram[80] = "0b00110111010110100001101010010011";
        ram[81] = "0b10111000011100110100010100000111";
        ram[82] = "0b10111001011001101010111111001101";
        ram[83] = "0b00111110111111101010101000001000";
        ram[84] = "0b00111110000110111101111100001001";
        ram[85] = "0b00110111101001111100010110101100";
        ram[86] = "0b00111110000010101110101100111110";
        ram[87] = "0b00111001111010100101101101010011";
        ram[88] = "0b00111111011010000101000101010101";
        ram[89] = "0b10111001110110011001010001011011";
        ram[90] = "0b10111001100101001110010111010110";
        ram[91] = "0b00111111011100000110110100011110";
        ram[92] = "0b00111101110001011101011010111111";
        ram[93] = "0b00111110101010010011011010100100";
        ram[94] = "0b10111001110011110001100000000001";
        ram[95] = "0b00111010000000100100100100011011";
        ram[96] = "0b10111000100101101111111010110101";
        ram[97] = "0b00111110110010110000001111100010";
        ram[98] = "0b00111110101111101010111001011100";
        ram[99] = "0b00111110110110100001001001010001";
        ram[100] = "0b00111110110101111101101001100010";
        ram[101] = "0b00111110110000111011100110101110";
        ram[102] = "0b00111110100010101010101101101001";
        ram[103] = "0b00111001110101100110111100001101";
        ram[104] = "0b00110111011110111010100010000010";
        ram[105] = "0b10111001001110011001100100010011";
        ram[106] = "0b00111111011000101000110100000000";
        ram[107] = "0b10111001110100100011110101001111";
        ram[108] = "0b00111110110100110110001110110010";
        ram[109] = "0b00111110001101110011001101100110";
        ram[110] = "0b00111111001000000110110011111101";
        ram[111] = "0b00111110101001100101100011100110";
        ram[112] = "0b00111001101100100100001000000111";
        ram[113] = "0b10111001001111011100101011010001";
        ram[114] = "0b00111110111111011111010000011011";
        ram[115] = "0b00111000000100101100110011110111";
        ram[116] = "0b10111001101000101000011101111111";
        ram[117] = "0b00111110110100010101101110111100";
        ram[118] = "0b00111111001000100011100000100010";
        ram[119] = "0b00111111010111101101010101111100";
        ram[120] = "0b00111001011101000101000101110110";
        ram[121] = "0b00111000100100001011010000011000";
        ram[122] = "0b10111000110110000000000110110100";
        ram[123] = "0b00111110111001101001110011001011";
        ram[124] = "0b00111110111001010011000001101010";
        ram[125] = "0b10111001101111110101110101111001";
        ram[126] = "0b00111111001100100000111100111101";
        ram[127] = "0b00111110111111101100010110110000";
        ram[128] = "0b10111001001000111001001111101110";
        ram[129] = "0b00111110111011100101010011111000";
        ram[130] = "0b00111110111001001100100010011011";
        ram[131] = "0b00111111010010100001111000001100";
        ram[132] = "0b00111111000100100011011000011010";
        ram[133] = "0b00111111000111100010011111110010";
        ram[134] = "0b00111001010001010010000111011110";
        ram[135] = "0b00111110101001011101000110000001";
        ram[136] = "0b00111001001011100001000001001001";
        ram[137] = "0b00111110110001001011110001101010";
        ram[138] = "0b00111110111010001110110001010011";
        ram[139] = "0b00110111001001111100010110101100";
        ram[140] = "0b10111001100011011000111011001001";
        ram[141] = "0b00111001101100001010111101100000";
        ram[142] = "0b00111001000110000000101100100100";
        ram[143] = "0b00111111000001110010111100010010";
        ram[144] = "0b00111111001010110001100000010001";
        ram[145] = "0b00111111001101011001100000101001";
        ram[146] = "0b10111001010111110101100011000001";
        ram[147] = "0b10111000110111100100110001010001";
        ram[148] = "0b00111111010100111110110001101000";
        ram[149] = "0b00111110110100101000110101100101";
        ram[150] = "0b00111001100110110011000001110011";
        ram[151] = "0b00111000010110100001101010010011";
        ram[152] = "0b00111110101110000010001100100001";
        ram[153] = "0b00111110111111001001011101110100";
        ram[154] = "0b10111001010011000111100011101010";
        ram[155] = "0b00111001110000110000100011111111";
        ram[156] = "0b00111111000110011000011110110101";
        ram[157] = "0b00111001000001110100010000101100";
        ram[158] = "0b00111111000001010010010000011000";
        ram[159] = "0b00111111001010111011000111010001";
        ram[160] = "0b10111000101100100100001000000111";
        ram[161] = "0b00111110101110010010100010111111";
        ram[162] = "0b10111001100000101000110000110111";
        ram[163] = "0b10111001101010000100101111100100";
        ram[164] = "0b10110110010010010101001110011100";
        ram[165] = "0b00111110110010001011011000110001";
        ram[166] = "0b00111001101110110010101110111011";
        ram[167] = "0b10111000111011001111101001101010";
        ram[168] = "0b00111000101000010111101100001111";
        ram[169] = "0b10110111110010010101001110011100";
        ram[170] = "0b10111001000011011000111011001001";
        ram[171] = "0b00111111000110100111000000101010";
        ram[172] = "0b00111001000011001000001001011010";
        ram[173] = "0b00111110101100011001101110110010";
        ram[174] = "0b00111110101010110000111100101000";
        ram[175] = "0b00111110101110111010101011011110";
        ram[176] = "0b00111110110011101100010010000010";
        ram[177] = "0b00111110100010111111001110011101";
        ram[178] = "0b10111000110101011110100011010101";
        ram[179] = "0b00111110101010000100010001101011";
        ram[180] = "0b00111001010100101100001110000111";
        ram[181] = "0b00111110111001100011011100110111";
        ram[182] = "0b00111000101001011010110011001101";
        ram[183] = "0b10110111010010010101001110011100";
        ram[184] = "0b10111001010000110000100011111111";
        ram[185] = "0b00111000110111100100110001010001";
        ram[186] = "0b10110111111010101110000110001011";
        ram[187] = "0b10111000001100000010100100101000";
        ram[188] = "0b00111000111001101010111111001101";
        ram[189] = "0b00111001000001110100010000101100";
        ram[190] = "0b10111000000010100110100101111011";
        ram[191] = "0b10111001001000010111101100001111";
        ram[192] = "0b00110110101001111100010110101100";
        ram[193] = "0b00000000000000000000000000000000";
        ram[194] = "0b00000000000000000000000000000000";


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


SC_MODULE(predict_ensemble_bAo) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_bAo_ram* meminst;


SC_CTOR(predict_ensemble_bAo) {
meminst = new predict_ensemble_bAo_ram("predict_ensemble_bAo_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_bAo() {
    delete meminst;
}


};//endmodule
#endif
