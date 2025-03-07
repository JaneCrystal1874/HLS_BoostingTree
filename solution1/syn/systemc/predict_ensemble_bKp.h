// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_bKp_H__
#define __predict_ensemble_bKp_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_bKp_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_bKp_ram) {
        ram[0] = "0b00111101001110110100110000111100";
        ram[1] = "0b00111010101001100001000101110111";
        ram[2] = "0b00111100001110101000100000100111";
        ram[3] = "0b10111010100101010000011101100100";
        ram[4] = "0b00111100011110101010110011011010";
        ram[5] = "0b00111010110010010011001000001110";
        ram[6] = "0b00111101100001000010011101000010";
        ram[7] = "0b00111111000010001001010111010001";
        ram[8] = "0b00111101110000111101011100001010";
        ram[9] = "0b00111111000101001010001001000100";
        ram[10] = "0b10111011000001100100100010000100";
        ram[11] = "0b00111111001000111000000111011000";
        ram[12] = "0b00111101110011111110100100110010";
        ram[13] = "0b10111001110100111100111111110110";
        ram[14] = "0b00111001111001011010001101011101";
        ram[15] = "0b10111001101011010000001111011010";
        ram[16] = "0b00111111001010101010111110111100";
        ram[17] = "0b10111010000101100011010101100001";
        ram[18] = "0b00111111010110111010001011110000";
        ram[19] = "0b00111011000010100100011111101101";
        ram[20] = "0b10111001010011000111100011101010";
        ram[21] = "0b00111101110100000011011101010000";
        ram[22] = "0b00111110100100000001000001100010";
        ram[23] = "0b00111001111010101110000110001011";
        ram[24] = "0b00111101110111111101011100011011";
        ram[25] = "0b10111010100001110110010110111010";
        ram[26] = "0b00111110011101100000111100011011";
        ram[27] = "0b10111001111011001111101001101010";
        ram[28] = "0b00111101111100010111101111011001";
        ram[29] = "0b00111001100110000000101100100100";
        ram[30] = "0b10111001100101000101111110011110";
        ram[31] = "0b00111001111000100111111000001111";
        ram[32] = "0b00111111011110000111011001111101";
        ram[33] = "0b00111111011100001100111011110110";
        ram[34] = "0b00111001111001000001000010110110";
        ram[35] = "0b00111101111100110111110000010011";
        ram[36] = "0b10111010010111110001010110100101";
        ram[37] = "0b00111111001000100110110110011100";
        ram[38] = "0b00111101111001110001010110000011";
        ram[39] = "0b00111010000001111100101001100100";
        ram[40] = "0b00111000001001111100010110101100";
        ram[41] = "0b10111001111100101011111011001111";
        ram[42] = "0b00111110000011000001100011111000";
        ram[43] = "0b00111010000011011101000111100101";
        ram[44] = "0b00111110010100100110111011011011";
        ram[45] = "0b10111001110011101001000111001001";
        ram[46] = "0b00111111011001011111001100001110";
        ram[47] = "0b00111111011101111000000101100010";
        ram[48] = "0b00111001110001101011010010000101";
        ram[49] = "0b00111111011011111000101011000010";
        ram[50] = "0b10111001100110100010010000000011";
        ram[51] = "0b00111110010110100010010010001001";
        ram[52] = "0b00111001110101001101110001100110";
        ram[53] = "0b00111111000101001011000100000011";
        ram[54] = "0b00111111010110001100101101001011";
        ram[55] = "0b00111001100011110010000101110001";
        ram[56] = "0b10111010010000110100110000011011";
        ram[57] = "0b00111110010001011011001010010010";
        ram[58] = "0b00111010000010111011100100000110";
        ram[59] = "0b10111001001110101010010110000011";
        ram[60] = "0b00111111010111011000101001000100";
        ram[61] = "0b00111110110000101100101011111111";
        ram[62] = "0b10111001011000010111000110011111";
        ram[63] = "0b00111111000010101010011100100110";
        ram[64] = "0b00111111010011011101001110101010";
        ram[65] = "0b00111111010101000101110111111011";
        ram[66] = "0b00111001110000000110100111101000";
        ram[67] = "0b00111110001011001100100100100001";
        ram[68] = "0b00111110111101001101011101001001";
        ram[69] = "0b00111110010101010110011110011001";
        ram[70] = "0b00111001010010010101001110011100";
        ram[71] = "0b00111111000110110010001000001000";
        ram[72] = "0b00111110001111000000001111111111";
        ram[73] = "0b10111001101010100110010011000011";
        ram[74] = "0b00111110101111010010101101001110";
        ram[75] = "0b10111001001010111111011101101010";
        ram[76] = "0b00111110111001110111011000111110";
        ram[77] = "0b00111110110011011110110011100101";
        ram[78] = "0b00111111000111101010111100100101";
        ram[79] = "0b00111111000111000011000010110001";
        ram[80] = "0b00111111011010101101111001110110";
        ram[81] = "0b00111000101001111100010110101100";
        ram[82] = "0b10111001001001111100010110101100";
        ram[83] = "0b00111110100000101010110010111000";
        ram[84] = "0b00111110111111011000101000010001";
        ram[85] = "0b00111110110100001000001101010110";
        ram[86] = "0b00111110110110101100111110110111";
        ram[87] = "0b00111001111011011000000010100001";
        ram[88] = "0b00111000100010000101000010011100";
        ram[89] = "0b00111110001101111010110011000101";
        ram[90] = "0b00111111000001111001001001001011";
        ram[91] = "0b00111101111111001011101111000011";
        ram[92] = "0b00111001000101011111001001000101";
        ram[93] = "0b00110111111110111010100010000010";
        ram[94] = "0b00111001001100100100001000000111";
        ram[95] = "0b10111001001101010110011101010101";
        ram[96] = "0b00110111011110111010100010000010";
        ram[97] = "0b00111110100001100111010111111111";
        ram[98] = "0b10111001011110001000001100110100";
        ram[99] = "0b00111001100001000001111011011110";
        ram[100] = "0b00111111001100000000000000000000";
        ram[101] = "0b00111000110011111001111000111000";
        ram[102] = "0b10111000110010110110110001111010";
        ram[103] = "0b00111111001101110101001011101011";
        ram[104] = "0b10111000000011101001101100111001";
        ram[105] = "0b00111001000001110100010000101100";
        ram[106] = "0b00111110001101101110010111001101";
        ram[107] = "0b10111000111110111010100010000010";
        ram[108] = "0b00111110101111100010110101100010";
        ram[109] = "0b00111000110100011011011100010111";
        ram[110] = "0b10110111111000100111111000001111";
        ram[111] = "0b10111001101001110011111101110101";
        ram[112] = "0b10111000111011110001001101001001";
        ram[113] = "0b10111001001000101000011101111111";
        ram[114] = "0b00111111000010100010111010010000";
        ram[115] = "0b00111001011011001111101001101010";
        ram[116] = "0b00110101100001100011011110111101";
        ram[117] = "0b00111111010100010100010110000100";
        ram[118] = "0b00111110110001011110001000100110";
        ram[119] = "0b00111110110011111110011111100010";
        ram[120] = "0b10111001000000001111100110010000";
        ram[121] = "0b00111110110011110001010001010101";
        ram[122] = "0b00111110101110100001010011001111";
        ram[123] = "0b00111110111001110000011000101101";
        ram[124] = "0b00111110101101011110100111000000";
        ram[125] = "0b00111111000010110010110000110000";
        ram[126] = "0b00111001000110100010010000000011";
        ram[127] = "0b00111110011110010001111001100100";
        ram[128] = "0b00111110111000000010011111111010";
        ram[129] = "0b00111111001000011100001011010010";
        ram[130] = "0b10111001010000011111110010001111";
        ram[131] = "0b10111000100010000101000010011100";
        ram[132] = "0b00111110110101111100001011101100";
        ram[133] = "0b10110111001110001000110010100100";
        ram[134] = "0b00111110101010100111011001010011";
        ram[135] = "0b10111000000101101111111010110101";
        ram[136] = "0b10111001001100010011010110011000";
        ram[137] = "0b00111110111110100110011100011111";
        ram[138] = "0b00111110110111011101110011101000";
        ram[139] = "0b10111000101000010111101100001111";
        ram[140] = "0b00111000110001010010000111011110";
        ram[141] = "0b00111110110000011000111001010100";
        ram[142] = "0b00111110111100101000000011110001";
        ram[143] = "0b00111000110100011011011100010111";
        ram[144] = "0b00111000001000111001001111101110";
        ram[145] = "0b00111001010010010101001110011100";
        ram[146] = "0b00111000011010101110000110001011";
        ram[147] = "0b00111000111100010010110000101000";
        ram[148] = "0b00111111000010001111001000101000";
        ram[149] = "0b00111111001010110001111001111110";
        ram[150] = "0b10111000101100000010100100101000";
        ram[151] = "0b00111111001011111001101011110010";
        ram[152] = "0b00111110111000011110101100100000";
        ram[153] = "0b00111111000000110010111101000101";
        ram[154] = "0b00111110110101000011100100110111";
        ram[155] = "0b00111110101000000000000000000000";
        ram[156] = "0b00111000101001111100010110101100";
        ram[157] = "0b00111000101111001011111001100010";
        ram[158] = "0b10111000100010000101000010011100";
        ram[159] = "0b00111000001100000010100100101000";
        ram[160] = "0b00111001001010011101111010001011";
        ram[161] = "0b00111111000110110011010110001111";
        ram[162] = "0b10111000111011001111101001101010";
        ram[163] = "0b10111000100001000001111011011110";
        ram[164] = "0b00111111001000000001110001010000";
        ram[165] = "0b10111000101011100001000001001001";
        ram[166] = "0b00111110111110010111111001010110";
        ram[167] = "0b00110110010010010101001110011100";
        ram[168] = "0b10111000101001011010110011001101";
        ram[169] = "0b00111111000011101100010100011001";
        ram[170] = "0b00111111001110001000000000011111";
        ram[171] = "0b00111000100111010100100101010010";
        ram[172] = "0b00111111000111000010110100101000";
        ram[173] = "0b00111110111100010100010000100100";
        ram[174] = "0b00111111001101000101010111011010";
        ram[175] = "0b00111000111000100111111000001111";
        ram[176] = "0b00110110010010010101001110011100";
        ram[177] = "0b10111000011101110111011011000101";
        ram[178] = "0b00110111110010010101001110011100";
        ram[179] = "0b10110111100001100011011110111101";
        ram[180] = "0b00111000100111110110001000110000";
        ram[181] = "0b00111111001110111110001010010011";
        ram[182] = "0b00111000010010010101001110011100";
        ram[183] = "0b10110111011010101110000110001011";
        ram[184] = "0b10111000101000010111101100001111";
        for (unsigned i = 185; i < 195 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_bKp) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_bKp_ram* meminst;


SC_CTOR(predict_ensemble_bKp) {
meminst = new predict_ensemble_bKp_ram("predict_ensemble_bKp_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_bKp() {
    delete meminst;
}


};//endmodule
#endif
