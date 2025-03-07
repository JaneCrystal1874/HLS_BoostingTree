// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_WhU_H__
#define __predict_ensemble_WhU_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_WhU_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_WhU_ram) {
        ram[0] = "0b00111100111101011001000000111010";
        ram[1] = "0b10111100001110011010010110101001";
        ram[2] = "0b00111100010100011010011001010000";
        ram[3] = "0b00111100100100001110101010011110";
        ram[4] = "0b00111111010101011101000101110000";
        ram[5] = "0b00111111011010111111011000001010";
        ram[6] = "0b00111110110110000100111000011110";
        ram[7] = "0b00111101110011000001011111101100";
        ram[8] = "0b10111011110110110100100010010001";
        ram[9] = "0b00111110100101000010100011010100";
        ram[10] = "0b00111111010111101000101110100000";
        ram[11] = "0b00111111000001111010110000111111";
        ram[12] = "0b00111111011101000001100100111011";
        ram[13] = "0b00111101100010100000010001001011";
        ram[14] = "0b00111010101001011010110011001101";
        ram[15] = "0b10111100100110000000011011110010";
        ram[16] = "0b10111011100100000011111010100111";
        ram[17] = "0b00111110111110010101001111011111";
        ram[18] = "0b00111111000101010110001001101011";
        ram[19] = "0b00111111010011000011101100111111";
        ram[20] = "0b00111110111111101010101000001000";
        ram[21] = "0b00111010011010100001100000110111";
        ram[22] = "0b10111011100011010101110001110100";
        ram[23] = "0b00111111011010100110001000100100";
        ram[24] = "0b00111100111100000110100100011111";
        ram[25] = "0b10111100100000001110110011111010";
        ram[26] = "0b00111011011111111101101001000000";
        ram[27] = "0b00111111011100101010010000110011";
        ram[28] = "0b00111110111000111111111011000001";
        ram[29] = "0b10111100000100101001011001110000";
        ram[30] = "0b00111010001110110110111011010110";
        ram[31] = "0b00111111001001000101110100010000";
        ram[32] = "0b00111110111101110110110111011011";
        ram[33] = "0b00111110101010110100011111000111";
        ram[34] = "0b00111011100101010111110011010100";
        ram[35] = "0b00111110011000101111100010111110";
        ram[36] = "0b00111111010111110000111000001011";
        ram[37] = "0b00111011000010000101000010011100";
        ram[38] = "0b00111100010001111011110011000011";
        ram[39] = "0b10111100000010101010110010010111";
        ram[40] = "0b10111010011000010010111010000100";
        ram[41] = "0b00111110101001001011101110000000";
        ram[42] = "0b00111110100010101010001011100100";
        ram[43] = "0b00111011000101110011000100001010";
        ram[44] = "0b00111011110110010100000001111001";
        ram[45] = "0b00111010110100110010100000110001";
        ram[46] = "0b10111010111101101100111011111111";
        ram[47] = "0b00111110101011011111001110110110";
        ram[48] = "0b00111110111001111110001000011110";
        ram[49] = "0b00111110100000001001100000101101";
        ram[50] = "0b00111110000000100000100100100100";
        ram[51] = "0b00111110100110101000000000101000";
        ram[52] = "0b00111110110010101100100000011101";
        ram[53] = "0b10111011000101111100100000001000";
        ram[54] = "0b10111011101100110011010101001100";
        ram[55] = "0b00111110100100010000011010001010";
        ram[56] = "0b00111011110010011001011010110111";
        ram[57] = "0b00111101111101111010110101001011";
        ram[58] = "0b00111110000001111110011011110111";
        ram[59] = "0b00111110000010001001111010111010";
        ram[60] = "0b00111011100110100011110100101110";
        ram[61] = "0b00111111000011011101100000110000";
        ram[62] = "0b00111110010100101111010110011001";
        ram[63] = "0b00111011010111000010001010101011";
        ram[64] = "0b10111010010111011000001011111101";
        ram[65] = "0b10111010010011100100111010101101";
        ram[66] = "0b00111100000101000000101110111011";
        ram[67] = "0b10111011101101111010000111000010";
        ram[68] = "0b00111110101000101101001000010011";
        ram[69] = "0b00111011000011000110000011001100";
        ram[70] = "0b00111110110001011101011010011101";
        ram[71] = "0b10111011010011001000100110110001";
        ram[72] = "0b10111100000101111110100110010110";
        ram[73] = "0b00111011010100001110110111000100";
        ram[74] = "0b00111111000010000111011010001110";
        ram[75] = "0b00111110101111111000101000101011";
        ram[76] = "0b00111110101011001111010110010000";
        ram[77] = "0b10111011001001101111110001011001";
        ram[78] = "0b00111110000001010001011110100100";
        ram[79] = "0b10111010101010001011000010001110";
        ram[80] = "0b00111010110000001100111010010010";
        ram[81] = "0b10111010010110010101000101000000";
        ram[82] = "0b10111011100000111010000100001010";
        ram[83] = "0b00111011100110000100111001000000";
        ram[84] = "0b00111110101011111001001111111111";
        ram[85] = "0b00111110011100010000000111110011";
        ram[86] = "0b00111010111100010010110000101000";
        ram[87] = "0b00111011100001110011101111001001";
        ram[88] = "0b00111111011001100011110110010010";
        ram[89] = "0b00111110010011100110110101011001";
        ram[90] = "0b10111011000010110101010001011100";
        ram[91] = "0b00111111010011111011010111100001";
        ram[92] = "0b00111011011000011001001100101101";
        ram[93] = "0b10111010010110001000011111101100";
        ram[94] = "0b00111011001000011010110101100100";
        ram[95] = "0b00111111011000100100000011001000";
        ram[96] = "0b00111110101110010001001111101000";
        ram[97] = "0b00111111010100000010101111011000";
        ram[98] = "0b00111011010110101110001111100111";
        ram[99] = "0b00111111010111100010101101011010";
        ram[100] = "0b10111011011111010101110010111000";
        ram[101] = "0b00111110111111000001110100101010";
        ram[102] = "0b10111011011000001010100001001100";
        ram[103] = "0b10111011001001011110111111101001";
        ram[104] = "0b10111010100111111110100001101000";
        ram[105] = "0b00111110101001100010000111111011";
        ram[106] = "0b00111101110101011001010111111111";
        ram[107] = "0b00111110101001011110100111100010";
        ram[108] = "0b00111110110000110111111110111111";
        ram[109] = "0b00111011001010011110111101010010";
        ram[110] = "0b00111110110110100010111001111111";
        ram[111] = "0b10111011001011011111111110000010";
        ram[112] = "0b00111010100001110010001010011111";
        ram[113] = "0b00111011010100100010110010001000";
        ram[114] = "0b00111110110100011111010111100000";
        ram[115] = "0b00111111000010010011101011000101";
        ram[116] = "0b00111110000100000000000001000011";
        ram[117] = "0b10111010101001110001110111100111";
        ram[118] = "0b00111110101100101010001110001100";
        ram[119] = "0b10111011001110001011111011111001";
        ram[120] = "0b00111110101111101011000111000100";
        ram[121] = "0b00111010110110001000011111101100";
        ram[122] = "0b00111110000111111010010011000110";
        ram[123] = "0b00111110000101110100010110111111";
        ram[124] = "0b00111111000000001111000010000100";
        ram[125] = "0b00111001101001010010011010010110";
        ram[126] = "0b00111110111111001011100111001011";
        ram[127] = "0b10111011001001101110101110010010";
        ram[128] = "0b00111110001010110110111101011101";
        ram[129] = "0b00111010101110010011010001101010";
        ram[130] = "0b00111011010011011010011011100111";
        ram[131] = "0b10111010100000011100001011100011";
        ram[132] = "0b00111110101100110111011101011100";
        ram[133] = "0b00111110101111001010101011111100";
        ram[134] = "0b10111011000011011001111110010000";
        ram[135] = "0b00111011010000101101011010101010";
        ram[136] = "0b00111110100010001101001100101000";
        ram[137] = "0b10111001011001111011110000111100";
        ram[138] = "0b00111110111001011101000110000001";
        ram[139] = "0b10111010101100000100101010110110";
        ram[140] = "0b10111000110101011110100011010101";
        ram[141] = "0b00111110110111111100010010100000";
        ram[142] = "0b00111111001001101111101111110100";
        ram[143] = "0b00111111001101001000111010101100";
        ram[144] = "0b00111111000100110010000101100000";
        ram[145] = "0b10111001110101101111010101000101";
        ram[146] = "0b10111011001111110011101111101011";
        ram[147] = "0b00111110101100110110010101100111";
        ram[148] = "0b00111111001010111011001111001000";
        ram[149] = "0b00111011010010000001010011010111";
        ram[150] = "0b00111010101000111111100010011000";
        ram[151] = "0b10111001111001111011110000111100";
        ram[152] = "0b00111010101111000011100000101010";
        ram[153] = "0b00111110111100101110011100101110";
        ram[154] = "0b00111110111100010111010001100000";
        ram[155] = "0b10111011010011001101110110010100";
        ram[156] = "0b00111111001000100110111001110110";
        ram[157] = "0b00111111001100100000101111000100";
        ram[158] = "0b10111010111010100001100000110111";
        ram[159] = "0b00111011001110010110011010111110";
        ram[160] = "0b00111111001011010001011101000000";
        ram[161] = "0b00111110111100100101000111100011";
        ram[162] = "0b10111010110010111010111110010110";
        ram[163] = "0b00111010100101100101011011101111";
        ram[164] = "0b10111010001101111100001101010000";
        ram[165] = "0b00111110000010001100101100001000";
        ram[166] = "0b00111111000010011100011001011100";
        ram[167] = "0b10111010100101110100000111010001";
        ram[168] = "0b00111110111111001000010101011110";
        ram[169] = "0b10111010111111100110100100100111";
        ram[170] = "0b00111111001011001011000011010001";
        ram[171] = "0b00111010000101100111100001111101";
        ram[172] = "0b00111011001101110000101011000100";
        ram[173] = "0b00111111000010100010111010010000";
        ram[174] = "0b10111010001111010100010010011010";
        ram[175] = "0b00111110111001000010001010001010";
        ram[176] = "0b00111111000010110001011111011111";
        ram[177] = "0b00111001110000110000100011111111";
        ram[178] = "0b00111010101101111100001101010000";
        ram[179] = "0b00111110111101000110010011011100";
        ram[180] = "0b10111011001100111000000011001011";
        ram[181] = "0b00111110101001011110010101101101";
        ram[182] = "0b00111111000101111110011000001100";
        ram[183] = "0b10111010010000000010011011001100";
        ram[184] = "0b00111010101010100100001100110101";
        ram[185] = "0b00111001101111110101110101111001";
        ram[186] = "0b00111011000001000100000001101100";
        ram[187] = "0b10111010101101010110011101010101";
        ram[188] = "0b00111111011001110111100000000011";
        ram[189] = "0b00111111001000111110110011001100";
        ram[190] = "0b10111010010000100011111110101011";
        ram[191] = "0b00111111000111000110001111110001";
        ram[192] = "0b10111001100111110110001000110000";
        ram[193] = "0b00111010110011100000101110010001";
        ram[194] = "0b00111001100111101101101111111001";


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


SC_MODULE(predict_ensemble_WhU) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_WhU_ram* meminst;


SC_CTOR(predict_ensemble_WhU) {
meminst = new predict_ensemble_WhU_ram("predict_ensemble_WhU_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_WhU() {
    delete meminst;
}


};//endmodule
#endif
