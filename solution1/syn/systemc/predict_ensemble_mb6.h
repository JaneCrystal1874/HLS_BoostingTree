// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_mb6_H__
#define __predict_ensemble_mb6_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_mb6_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 32;
  static const unsigned AddressRange = 512;
  static const unsigned AddressWidth = 9;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(predict_ensemble_mb6_ram) {
        ram[0] = "0b00111110000000111011000110001110";
        ram[1] = "0b00111110000000100011001001001101";
        ram[2] = "0b00111110000001001001000111110011";
        ram[3] = "0b00111101111111110100100100000110";
        ram[4] = "0b10111111011011011101011100100011";
        ram[5] = "0b00111111001010000100011011011000";
        ram[6] = "0b00111110110011110110110100110011";
        ram[7] = "0b00111110001011001000010100111100";
        ram[8] = "0b00111110101101110111000001111010";
        ram[9] = "0b00111110101111111001100100111101";
        ram[10] = "0b00111110000111001111111110101000";
        ram[11] = "0b00111110101100001100001100101011";
        ram[12] = "0b00111110001111101111010000010111";
        ram[13] = "0b00111110101101110100001000010100";
        ram[14] = "0b00111110010111000111101000111010";
        ram[15] = "0b10111110111101011001000101000111";
        ram[16] = "0b00111110111001001110100010010110";
        ram[17] = "0b10111100111000000100110000000110";
        ram[18] = "0b00111110111011010100010111101001";
        ram[19] = "0b00111111000000000110010100110000";
        ram[20] = "0b00111100111000110010000110100011";
        ram[21] = "0b00111101001101110101110110011010";
        ram[22] = "0b10111110100011111100101010100111";
        ram[23] = "0b10111110100000100111011100111110";
        ram[24] = "0b00111110100000111101101100111100";
        ram[25] = "0b10111110011000000100000111001100";
        ram[26] = "0b10111011000001110001000111011000";
        ram[27] = "0b10111111101100100010101001011110";
        ram[28] = "0b10111110100110100110111100011110";
        ram[29] = "0b00111111011111010000000111100010";
        ram[30] = "0b00111110001101010011011000001101";
        ram[31] = "0b00000000000000000000000000000000";
        ram[32] = "0b00111110100100001011101010000100";
        ram[33] = "0b00111110100011000010101111011000";
        ram[34] = "0b00111110100101110001100011101100";
        ram[35] = "0b00111110000111010101001001111110";
        ram[36] = "0b10111111010100011001000110101100";
        ram[37] = "0b00111111011000010011000100110011";
        ram[38] = "0b00111110001101110100001100100000";
        ram[39] = "0b00111101101110001011000111011101";
        ram[40] = "0b00111110010101101111110010011100";
        ram[41] = "0b00111110001011110111101000001011";
        ram[42] = "0b00111111000000110001010011011011";
        ram[43] = "0b00111101101101001110100011111011";
        ram[44] = "0b00111101110001110000100001101000";
        ram[45] = "0b10111101101111110001011010110001";
        ram[46] = "0b10111111010000010000100011100110";
        ram[47] = "0b00111110001010011011101011100100";
        ram[48] = "0b00111110100110100110110011000010";
        ram[49] = "0b00111110010101101011110000011111";
        ram[50] = "0b00111110100111000101000100110011";
        ram[51] = "0b10111101001100111110101010110011";
        ram[52] = "0b10111111001101010011001100011010";
        ram[53] = "0b00111110101000101010110111100110";
        ram[54] = "0b00111100110010100011010000000001";
        ram[55] = "0b00111101111100111110011100001000";
        ram[56] = "0b10111110111001111001001011010001";
        ram[57] = "0b00111111111110001010000100111000";
        ram[58] = "0b00111100101011000111110110100010";
        ram[59] = "0b10111110111101110101010100110111";
        ram[60] = "0b10111101010110110101111110100010";
        ram[61] = "0b00111111000001101100111100010000";
        ram[62] = "0b00111010001100101100100000111111";
        ram[63] = "0b00000000000000000000000000000000";
        ram[64] = "0b00111110111011011111000101111100";
        ram[65] = "0b00111110110101011100010011101011";
        ram[66] = "0b10111110100011010010101001000001";
        ram[67] = "0b00111111001110110000011010110011";
        ram[68] = "0b00111110110110100010000000110110";
        ram[69] = "0b00111111001110001110111000011000";
        ram[70] = "0b00111111001110110111000000110111";
        ram[71] = "0b00111111000101101000001000011111";
        ram[72] = "0b00111110111000110100110001111111";
        ram[73] = "0b00111110110000101101000111010000";
        ram[74] = "0b00111110111110011010111000001100";
        ram[75] = "0b10111111001010101000000111111110";
        ram[76] = "0b00111111001111001000011110111010";
        ram[77] = "0b10111110100000000000010110100011";
        ram[78] = "0b00111110110000011001110100000010";
        ram[79] = "0b00111110101111111110100101010011";
        ram[80] = "0b00111111000110001010010111001110";
        ram[81] = "0b00111110100010001101001100000111";
        ram[82] = "0b00111111000111101001101110101110";
        ram[83] = "0b00111110111000111011001110100111";
        ram[84] = "0b00111110101110100001100010011100";
        ram[85] = "0b10111111000110010101111001001010";
        ram[86] = "0b00111100110011011111010010000000";
        ram[87] = "0b00111111001111001011001101110000";
        ram[88] = "0b00111110010110101100010001110010";
        ram[89] = "0b00111100110100100100100111100100";
        ram[90] = "0b10111101000001110011001001011001";
        ram[91] = "0b10111101101101011111111111100111";
        ram[92] = "0b10111110101100001001010010100011";
        ram[93] = "0b10111101100100000111111100100100";
        ram[94] = "0b00111110101100100010000101000010";
        ram[95] = "0b00000000000000000000000000000000";
        ram[96] = "0b00111110101101101101010111110001";
        ram[97] = "0b00111110010001010110110111100011";
        ram[98] = "0b00111110111000111011001110100111";
        ram[99] = "0b00111110101100101110010001101101";
        ram[100] = "0b10111111010101001011011011001000";
        ram[101] = "0b00111110110111111110111000101101";
        ram[102] = "0b00111110111001100010101011000011";
        ram[103] = "0b00111110001101001001010010010010";
        ram[104] = "0b10111111001100001010111100011101";
        ram[105] = "0b00111111001110100000111111010100";
        ram[106] = "0b00111111001111110111010001000111";
        ram[107] = "0b10111110111100001011001010000101";
        ram[108] = "0b00111110101001111001000000010001";
        ram[109] = "0b00111110001010111001110111000011";
        ram[110] = "0b00111111000011000111010011111011";
        ram[111] = "0b00111110110001000101111111000000";
        ram[112] = "0b00111111001111110101011100011101";
        ram[113] = "0b00111110001111011000100101001000";
        ram[114] = "0b00111110101010011110001110101000";
        ram[115] = "0b10111100101110011011110010111010";
        ram[116] = "0b10111111000110111001011111111111";
        ram[117] = "0b00111110101101000101001000111111";
        ram[118] = "0b00111111010100111101111100011010";
        ram[119] = "0b10111110010011010001100001001100";
        ram[120] = "0b00111110101010010000000000111111";
        ram[121] = "0b10111110011110001000111111001001";
        ram[122] = "0b00111110011011010000100000001011";
        ram[123] = "0b00111111001001111011100001001110";
        ram[124] = "0b00111100110000011111011001000101";
        ram[125] = "0b00111111000001110000111001011110";
        ram[126] = "0b10111110010110001000000010010101";
        ram[127] = "0b00000000000000000000000000000000";
        ram[128] = "0b00111110001011111011001101110100";
        ram[129] = "0b00111110001011001000011010001100";
        ram[130] = "0b00111110001100101110101000010000";
        ram[131] = "0b00111110001010100001110101110101";
        ram[132] = "0b00111111000001110101001111010110";
        ram[133] = "0b10111111000110101110101001100100";
        ram[134] = "0b00111101100010111000010110100101";
        ram[135] = "0b00111101111010010000011000000011";
        ram[136] = "0b10111111001011110110011101001101";
        ram[137] = "0b00111111001010010110101100110011";
        ram[138] = "0b00111110100110101110111110110011";
        ram[139] = "0b00111110010010111100010011010010";
        ram[140] = "0b00111110001001101101001010101010";
        ram[141] = "0b00111101110111010011010101100101";
        ram[142] = "0b00111101111100000101010100110010";
        ram[143] = "0b00111110101111011001010001001011";
        ram[144] = "0b00111101010011111011010101001010";
        ram[145] = "0b00111110111011011101000001010011";
        ram[146] = "0b00111110001111101100001111011011";
        ram[147] = "0b00111101110110100000010010001110";
        ram[148] = "0b10111110110000011101101110101001";
        ram[149] = "0b00111111001001100011100000000000";
        ram[150] = "0b00111101100000000000100101110000";
        ram[151] = "0b10111110011101001111001001101011";
        ram[152] = "0b00111110011101010011100100110010";
        ram[153] = "0b10111110000001001010100000111011";
        ram[154] = "0b10111110110011010101111100110101";
        ram[155] = "0b00111110101100001111000100001011";
        ram[156] = "0b10111100111100100001100100100010";
        ram[157] = "0b10111011110110000010001101000010";
        ram[158] = "0b00111111010100001010001110000011";
        ram[159] = "0b00000000000000000000000000000000";
        ram[160] = "0b00111100011110110010111011100000";
        ram[161] = "0b00111101110001001001111001000101";
        ram[162] = "0b00111100100100111110000111001010";
        ram[163] = "0b10111100110111011010101011010110";
        ram[164] = "0b00111110110000010001111101001111";
        ram[165] = "0b10111110100000001000101011110000";
        ram[166] = "0b00111101100110101011011001001010";
        ram[167] = "0b00111110011010001011011100011100";
        ram[168] = "0b00111101000100000011110110011011";
        ram[169] = "0b00111110011010001011100101111000";
        ram[170] = "0b00111110011001001000110011111000";
        ram[171] = "0b00111101010011110100111010000111";
        ram[172] = "0b00111110100111100010111010010000";
        ram[173] = "0b00111110010111111010001001101010";
        ram[174] = "0b00111110011011100011110001010011";
        ram[175] = "0b00111111001100011011101001101111";
        ram[176] = "0b00111111001010101011011010101110";
        ram[177] = "0b00111111001001110000010100100001";
        ram[178] = "0b00111111001001011110010000111111";
        ram[179] = "0b00111111001011110101100000011001";
        ram[180] = "0b00111111001100101100010101111110";
        ram[181] = "0b10111110000010011000010001011110";
        ram[182] = "0b10111111100000000011111001111101";
        ram[183] = "0b00111101111111010011001011000110";
        ram[184] = "0b00111110110111100010000010001010";
        ram[185] = "0b00111101011011101000010010101101";
        ram[186] = "0b10111101100100101110111110010001";
        ram[187] = "0b10111100010010000110000001010111";
        ram[188] = "0b10111111010100010000100101001010";
        ram[189] = "0b00111111010101010110101111011011";
        ram[190] = "0b00111100100011100111110111011101";
        ram[191] = "0b00000000000000000000000000000000";
        ram[192] = "0b00111111010000001000011011100000";
        ram[193] = "0b00111110101110100101010111110011";
        ram[194] = "0b00111101111101011100101101111001";
        ram[195] = "0b00111110101101110100001000010100";
        ram[196] = "0b00111111000010000111001000001000";
        ram[197] = "0b10111010110101100110111100001101";
        ram[198] = "0b00111111000111110110100111101100";
        ram[199] = "0b00111111001100100010101101111100";
        ram[200] = "0b10111110101111011011101110011101";
        ram[201] = "0b10111110100011011100000011011011";
        ram[202] = "0b00111110110010100000111011101001";
        ram[203] = "0b10111101100011010010101100101100";
        ram[204] = "0b10111110101110010100010010101010";
        ram[205] = "0b00111110101101011111110000111011";
        ram[206] = "0b10111110101101101101000100111001";
        ram[207] = "0b00111111001101110110110000110111";
        ram[208] = "0b00111110011011100010010111001000";
        ram[209] = "0b00111110110101000110101100100111";
        ram[210] = "0b00111110101011110001101100100110";
        ram[211] = "0b10111110001001000101101000011101";
        ram[212] = "0b00111110010101001110110101110000";
        ram[213] = "0b00111110001001001000001111001011";
        ram[214] = "0b00111111001101001100100010011011";
        ram[215] = "0b10111011111101111110001111010010";
        ram[216] = "0b10111110100001010100110001110111";
        ram[217] = "0b10111101100001000010000101111101";
        ram[218] = "0b00111110101100010110100100011010";
        ram[219] = "0b10111101010000001111011001101010";
        ram[220] = "0b00111110001001011111101001100110";
        ram[221] = "0b00111110110111001011000100100101";
        ram[222] = "0b10111101000010101101101111000110";
        ram[223] = "0b00000000000000000000000000000000";
        ram[224] = "0b00111101100100111010000011000111";
        ram[225] = "0b00111110100110011001001110010010";
        ram[226] = "0b00111101100110100111100001101100";
        ram[227] = "0b00111110011111001111000010110111";
        ram[228] = "0b00111111001111001011001101110000";
        ram[229] = "0b01000000000010100100110110100101";
        ram[230] = "0b00111111000011111001100001000010";
        ram[231] = "0b00111110001110100000110001101011";
        ram[232] = "0b01000000100000001100111101101010";
        ram[233] = "0b10111110111111110101110101010111";
        ram[234] = "0b11000000100110000011101001011010";
        ram[235] = "0b00111110001111100010000100010000";
        ram[236] = "0b00111111000101111010000111110101";
        ram[237] = "0b00111101001010101111000101000101";
        ram[238] = "0b00111101011011101010000011111101";
        ram[239] = "0b00111110001101011011011010000000";
        ram[240] = "0b00111101001001101010010001000100";
        ram[241] = "0b00111110011010101011101000111000";
        ram[242] = "0b00111110101000101000001100001010";
        ram[243] = "0b10111111110111110001100001000100";
        ram[244] = "0b00111110101111000101100111011010";
        ram[245] = "0b10111110100110000010000110001110";
        ram[246] = "0b11000000100000110111001011101001";
        ram[247] = "0b10111010100100111001011001001010";
        ram[248] = "0b00111111111011001000001100010010";
        ram[249] = "0b11000000100000010010111101101100";
        ram[250] = "0b10111110111000010101110001000010";
        ram[251] = "0b01000000011010101101111110101101";
        ram[252] = "0b00111110001111111101100100110100";
        ram[253] = "0b10111111110011010011100100111011";
        ram[254] = "0b00111101110110111010100110001111";
        ram[255] = "0b00000000000000000000000000000000";
        ram[256] = "0b00111111010000011111101010111001";
        ram[257] = "0b00111110011110000110100000110100";
        ram[258] = "0b00111101000011101001111101101011";
        ram[259] = "0b00111110010111000000011111101110";
        ram[260] = "0b00111110100000111100110001101100";
        ram[261] = "0b00111100111111110000111011010100";
        ram[262] = "0b00111110010011100111001101100000";
        ram[263] = "0b00111110010101111010000000110000";
        ram[264] = "0b00111111001110100000111111010100";
        ram[265] = "0b10111110111101001110011000011001";
        ram[266] = "0b00111101100101000100000110111100";
        ram[267] = "0b00111110000110011001110101000101";
        ram[268] = "0b00111111010011111110010110101000";
        ram[269] = "0b00111101101001111100110100000011";
        ram[270] = "0b00111110010110000001110010110100";
        ram[271] = "0b00111101010011000110100100101111";
        ram[272] = "0b10111111001010111101001111010100";
        ram[273] = "0b10111110010111001100001110100000";
        ram[274] = "0b00111101111010101110000001111110";
        ram[275] = "0b10111110101000010110000011111010";
        ram[276] = "0b00111100010101001011011010100110";
        ram[277] = "0b00111110000100100001101101111110";
        ram[278] = "0b00111110000100011011101100000110";
        ram[279] = "0b00111110010100001001100001001110";
        ram[280] = "0b10111110100110101110100011100010";
        ram[281] = "0b00111110101001011010111101001011";
        ram[282] = "0b10111101000011101011100010010101";
        ram[283] = "0b00111110100101011111101101010000";
        ram[284] = "0b00111111011101000010000111110011";
        ram[285] = "0b10111101001101001110000100011110";
        ram[286] = "0b10111111001000100001001100011011";
        ram[287] = "0b00000000000000000000000000000000";
        ram[288] = "0b00111101100111000000100011111010";
        ram[289] = "0b00111101100101000111110110000000";
        ram[290] = "0b00111101100111101101000001110000";
        ram[291] = "0b00111101100100011111010001101111";
        ram[292] = "0b10111110101100101000110000010101";
        ram[293] = "0b00111110110001101100000101111111";
        ram[294] = "0b00111111010001001001111001010110";
        ram[295] = "0b00111101100110001110110000010000";
        ram[296] = "0b00111110110111011110101100010000";
        ram[297] = "0b00111101110011001111100011010111";
        ram[298] = "0b00111110000010101100011110010111";
        ram[299] = "0b10111110101111010000110011100101";
        ram[300] = "0b00111101110001101101000111100001";
        ram[301] = "0b00111101111111001101101110111110";
        ram[302] = "0b00111101110011100010010111001000";
        ram[303] = "0b00111101111000110110111000101111";
        ram[304] = "0b00111110000110110001010011101100";
        ram[305] = "0b00111110011000001010110100000100";
        ram[306] = "0b10111101101111111100110000011000";
        ram[307] = "0b00111101110010001110110101011111";
        ram[308] = "0b10111110010010110111000110111001";
        ram[309] = "0b10111111001000000010101110010101";
        ram[310] = "0b10111100010100010001001110000011";
        ram[311] = "0b00111101111010001011111100111100";
        ram[312] = "0b00111111000111001101111101101010";
        ram[313] = "0b10111111000000111001111010001100";
        ram[314] = "0b00111101001101010111111001100111";
        ram[315] = "0b00111101101000111101001011011000";
        ram[316] = "0b00111111010010010000111101110011";
        ram[317] = "0b10111110001100010100110001100110";
        ram[318] = "0b00111101101101111000001111100000";
        ram[319] = "0b00000000000000000000000000000000";
        ram[320] = "0b00111101001001111111100000000001";
        ram[321] = "0b00111110100101100111011100001100";
        ram[322] = "0b00111110100000010101101100010100";
        ram[323] = "0b00111110000100101100110001110001";
        ram[324] = "0b00111110100010011001110010011101";
        ram[325] = "0b00111101110000110110100011110001";
        ram[326] = "0b00111110010101101111110010011100";
        ram[327] = "0b00111110000010111010011110111001";
        ram[328] = "0b00111101110000101011001001111101";
        ram[329] = "0b00111101101100001101000111111010";
        ram[330] = "0b00111101110001111110100001000111";
        ram[331] = "0b10111110010010001010000111100000";
        ram[332] = "0b10111111010000100001110100000000";
        ram[333] = "0b00111111000001011110000110110001";
        ram[334] = "0b00111110000101110000111000101100";
        ram[335] = "0b00111101101000110000000000010101";
        ram[336] = "0b00111101111001001011001100111110";
        ram[337] = "0b10111100010110101111100011011111";
        ram[338] = "0b00111101011000010101001000101010";
        ram[339] = "0b00111111001010000001110010100100";
        ram[340] = "0b10111010100101111100100000001000";
        ram[341] = "0b00111110101101000110110101100001";
        ram[342] = "0b00111110101111100111010010001110";
        ram[343] = "0b00111110100000101100100110001110";
        ram[344] = "0b00111011101000011010010100000001";
        ram[345] = "0b10111111000010110111100010001001";
        ram[346] = "0b10111101101111010100111100010110";
        ram[347] = "0b00111110001001001110100001110101";
        ram[348] = "0b10111110000110010100001111100001";
        ram[349] = "0b10111111000001000100001110010001";
        ram[350] = "0b00111101100110001001001011101111";
        ram[351] = "0b00000000000000000000000000000000";
        ram[352] = "0b00111110111100000010000010000001";
        ram[353] = "0b00111110111000001101110101000000";
        ram[354] = "0b00111110010111101010111000011001";
        ram[355] = "0b00111101001001001100101001001111";
        ram[356] = "0b10111110100011011001100001111100";
        ram[357] = "0b00111101000101111011111110100101";
        ram[358] = "0b00111101001010100011110111110111";
        ram[359] = "0b00111110001110001011111000101111";
        ram[360] = "0b00111110110111100000101110110011";
        ram[361] = "0b10111110101111110001000101110011";
        ram[362] = "0b00111101101010001001011001010111";
        ram[363] = "0b00111110000011111110101110001110";
        ram[364] = "0b10111110100100101011011001101011";
        ram[365] = "0b00111101100110010011111011100110";
        ram[366] = "0b00111101101110100101101010001010";
        ram[367] = "0b00111110000010100101110010100011";
        ram[368] = "0b00111110000111001110011011000001";
        ram[369] = "0b00111101100100101100000111110100";
        ram[370] = "0b00111110001000001001100100011000";
        ram[371] = "0b00111110100010111011011100110001";
        ram[372] = "0b00111101101111101010010001100110";
        ram[373] = "0b00111100110111000011100110111101";
        ram[374] = "0b10111111000000001011001111000100";
        ram[375] = "0b00111110111111001100010001001000";
        ram[376] = "0b10111100101100101101101100011111";
        ram[377] = "0b10111100111111000001001101110111";
        ram[378] = "0b00111110101111111001110011101001";
        ram[379] = "0b10111111010000101111111001010000";
        ram[380] = "0b00111100000010010011011101001100";
        ram[381] = "0b10111110110010101111110101110110";
        ram[382] = "0b00111100000011000110100100101111";
        ram[383] = "0b00000000000000000000000000000000";
        ram[384] = "0b00111111000100011111111011101011";
        ram[385] = "0b00111111000011111100001111010111";
        ram[386] = "0b00111111000101001001110111110001";
        ram[387] = "0b00111111000001111111001000011011";
        ram[388] = "0b00111111000011010101001000011010";
        ram[389] = "0b00111110101100000111001101011000";
        ram[390] = "0b00111110100100110010000110000001";
        ram[391] = "0b00111111000001010000111101100010";
        ram[392] = "0b00111110101000000101000110000111";
        ram[393] = "0b10111111000100001110101110001001";
        ram[394] = "0b10111110001011100000010001111101";
        ram[395] = "0b00111110101010110011110011100110";
        ram[396] = "0b00111110101000011111111011101011";
        ram[397] = "0b00111111010000011111101010111001";
        ram[398] = "0b00111110101000001001101110010101";
        ram[399] = "0b10111111000010101100001010101101";
        ram[400] = "0b00111110101100010100101101011010";
        ram[401] = "0b00111111001000010011100011001110";
        ram[402] = "0b00111111001110100000111111010100";
        ram[403] = "0b00111100111001101111001011101001";
        ram[404] = "0b10111100111000011101010000110000";
        ram[405] = "0b00111110001101000001011111001010";
        ram[406] = "0b10111101101100100001000111001011";
        ram[407] = "0b10111110111000001101100100110000";
        ram[408] = "0b10111010111110010000100101101100";
        ram[409] = "0b00111111000110111100111000100001";
        ram[410] = "0b00111110101110010101011000011001";
        ram[411] = "0b10111110110111101011011011100001";
        ram[412] = "0b10111101011010010111100011010101";
        ram[413] = "0b00111110001001110101000101001000";
        ram[414] = "0b10111100100100100111011011111011";
        ram[415] = "0b00000000000000000000000000000000";
        ram[416] = "0b00111101110010110011101000100110";
        ram[417] = "0b00111101110010000011101100011101";
        ram[418] = "0b00111110010100000010101010111011";
        ram[419] = "0b00111101111011101101100010010000";
        ram[420] = "0b01000000010100111111111011110100";
        ram[421] = "0b00111110001111100000010111001101";
        ram[422] = "0b00111110010101111001110111010100";
        ram[423] = "0b00111101111010110100000011110110";
        ram[424] = "0b00111111001111110101011100011101";
        ram[425] = "0b00111110001011111100000000001001";
        ram[426] = "0b00111101111100111010110001001111";
        ram[427] = "0b00111101111111110110000100100100";
        ram[428] = "0b00111101110101010101100110110100";
        ram[429] = "0b10111100001001110100110000001010";
        ram[430] = "0b11000000101101100101011101111110";
        ram[431] = "0b00111110000010110001110011001001";
        ram[432] = "0b00111110100101110101011111010110";
        ram[433] = "0b11000000001000111000110110100100";
        ram[434] = "0b00111111101001111101110111110100";
        ram[435] = "0b11000000101011001000111100101100";
        ram[436] = "0b10111111101010001011111100111100";
        ram[437] = "0b00111110100110101001001110001110";
        ram[438] = "0b01000000101000101010100111000101";
        ram[439] = "0b00111101110011111011111000110100";
        ram[440] = "0b00111101110111011100111100000011";
        ram[441] = "0b01000000011001100011111000011101";
        ram[442] = "0b00111111011010100011100100011101";
        ram[443] = "0b10111111000001011011110000010010";
        ram[444] = "0b11000000100001101001001100111010";
        ram[445] = "0b01000000001010011010101000000100";
        ram[446] = "0b10111101111000110001000011011100";
        ram[447] = "0b00000000000000000000000000000000";
        ram[448] = "0b00111110111101010111000101101101";
        ram[449] = "0b00111110110011011101101100010010";
        ram[450] = "0b00111111001011111000000101010010";
        ram[451] = "0b00111101110001110010011011010000";
        ram[452] = "0b11000000001101110001100101110010";
        ram[453] = "0b00111101100101011010010010101101";
        ram[454] = "0b00111110011010001010001101110010";
        ram[455] = "0b10111111101100100010010101000010";
        ram[456] = "0b00111111100001010100111111111000";
        ram[457] = "0b10111110001100001101111010001111";
        ram[458] = "0b00111101110111001111001111011100";
        ram[459] = "0b00111110001000110001111100000100";
        ram[460] = "0b00111110100100100010010100010000";
        ram[461] = "0b01000000010000001101001011111010";
        ram[462] = "0b00111111110101101011001001011011";
        ram[463] = "0b00111110000110000110000101100011";
        ram[464] = "0b00111110001010111110110001101000";
        ram[465] = "0b00111111000001000100000111101110";
        ram[466] = "0b00111110100101111000100111000110";
        ram[467] = "0b10111101010001001100110011101110";
        ram[468] = "0b01000000000111110110100011111001";
        ram[469] = "0b00111101011101000111111010001101";
        ram[470] = "0b10111110001110011110101001010111";
        ram[471] = "0b00111101111001100110011011101101";
        ram[472] = "0b00111110100010100111011000010000";
        ram[473] = "0b10111111110000011010010100100010";
        ram[474] = "0b00111110001010111100101011011010";
        ram[475] = "0b11000000101000001000010001101000";
        ram[476] = "0b10111111001101110010110100011011";
        ram[477] = "0b00111111001100001101000101100011";
        ram[478] = "0b01000000011001101011100110110010";
        ram[479] = "0b00000000000000000000000000000000";
        ram[480] = "0b00111101110100110111110110100110";
        ram[481] = "0b00111101110011011101110001100010";
        ram[482] = "0b00111111000101101011111100100011";
        ram[483] = "0b00111101100100010110100011111001";
        ram[484] = "0b01000000010011001000111111111100";
        ram[485] = "0b00111101111000001010000101111011";
        ram[486] = "0b00111111000101111010000111110101";
        ram[487] = "0b00111101111100001111101101100101";
        ram[488] = "0b00111111000000000001100000001101";
        ram[489] = "0b00111101101101111110001111010010";
        ram[490] = "0b00111101000101110000101101001010";
        ram[491] = "0b01000000010001000010000111101010";
        ram[492] = "0b00111111001110110111000000110111";
        ram[493] = "0b00111110100010000000111000101000";
        ram[494] = "0b00111111001111110101011100011101";
        ram[495] = "0b00111111001101110110110000110111";
        ram[496] = "0b10111111010010100010100100110000";
        ram[497] = "0b11000000011110101001011110011110";
        ram[498] = "0b00111101111011010110110100111011";
        ram[499] = "0b00111110000111111100000011010011";
        ram[500] = "0b10111110111000010000010011010101";
        ram[501] = "0b00111101001100111110110111011001";
        ram[502] = "0b00111111011001101111101000001101";
        ram[503] = "0b11000000010010101001000000110110";
        ram[504] = "0b00111110011000100100000001110100";
        ram[505] = "0b00111101110001011010000010111110";
        ram[506] = "0b00111111110010011100111011100001";
        ram[507] = "0b00111111100101100010111101100010";
        ram[508] = "0b11000000000101001011001100110001";
        ram[509] = "0b10111100001101011010111010100011";
        ram[510] = "0b01000000011000110001110011110011";
        ram[511] = "0b00000000000000000000000000000000";


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


SC_MODULE(predict_ensemble_mb6) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_mb6_ram* meminst;


SC_CTOR(predict_ensemble_mb6) {
meminst = new predict_ensemble_mb6_ram("predict_ensemble_mb6_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_mb6() {
    delete meminst;
}


};//endmodule
#endif
