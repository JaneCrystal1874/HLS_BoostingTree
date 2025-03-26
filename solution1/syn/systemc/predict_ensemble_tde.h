// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_tde_H__
#define __predict_ensemble_tde_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_tde_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 5;
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


   SC_CTOR(predict_ensemble_tde_ram) {
        ram[0] = "0b00010";
        ram[1] = "0b00100";
        ram[2] = "0b00110";
        ram[3] = "0b01000";
        ram[4] = "0b01010";
        ram[5] = "0b01100";
        ram[6] = "0b00000";
        ram[7] = "0b01110";
        ram[8] = "0b00000";
        ram[9] = "0b00000";
        ram[10] = "0b10000";
        ram[11] = "0b10010";
        ram[12] = "0b00000";
        ram[13] = "0b00000";
        ram[14] = "0b10100";
        ram[15] = "0b10110";
        ram[16] = "0b11000";
        ram[17] = "0b11010";
        ram[18] = "0b11100";
        for (unsigned i = 19; i < 24 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[24] = "0b11110";
        for (unsigned i = 25; i < 32 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[32] = "0b00010";
        ram[33] = "0b00100";
        ram[34] = "0b00110";
        ram[35] = "0b01000";
        ram[36] = "0b01010";
        ram[37] = "0b01100";
        ram[38] = "0b01110";
        ram[39] = "0b10000";
        ram[40] = "0b00000";
        ram[41] = "0b00000";
        ram[42] = "0b00000";
        ram[43] = "0b10010";
        ram[44] = "0b10100";
        ram[45] = "0b10110";
        ram[46] = "0b11000";
        ram[47] = "0b00000";
        ram[48] = "0b00000";
        ram[49] = "0b11010";
        ram[50] = "0b11100";
        ram[51] = "0b00000";
        ram[52] = "0b00000";
        ram[53] = "0b11110";
        for (unsigned i = 54; i < 64 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[64] = "0b00010";
        ram[65] = "0b00100";
        ram[66] = "0b00110";
        ram[67] = "0b01000";
        ram[68] = "0b00000";
        ram[69] = "0b01010";
        ram[70] = "0b01100";
        ram[71] = "0b00000";
        ram[72] = "0b01110";
        ram[73] = "0b10000";
        ram[74] = "0b10010";
        ram[75] = "0b00000";
        ram[76] = "0b10100";
        ram[77] = "0b10110";
        ram[78] = "0b00000";
        ram[79] = "0b11000";
        ram[80] = "0b00000";
        ram[81] = "0b11010";
        ram[82] = "0b11100";
        ram[83] = "0b11110";
        for (unsigned i = 84; i < 96 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[96] = "0b00010";
        ram[97] = "0b00100";
        ram[98] = "0b00110";
        ram[99] = "0b01000";
        ram[100] = "0b01010";
        ram[101] = "0b01100";
        ram[102] = "0b01110";
        ram[103] = "0b10000";
        ram[104] = "0b00000";
        ram[105] = "0b10010";
        ram[106] = "0b10100";
        ram[107] = "0b00000";
        ram[108] = "0b00000";
        ram[109] = "0b10110";
        ram[110] = "0b11000";
        ram[111] = "0b00000";
        ram[112] = "0b00000";
        ram[113] = "0b11010";
        ram[114] = "0b11100";
        for (unsigned i = 115; i < 120 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[120] = "0b11110";
        for (unsigned i = 121; i < 128 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[128] = "0b00010";
        ram[129] = "0b00100";
        ram[130] = "0b00110";
        ram[131] = "0b01000";
        ram[132] = "0b01010";
        ram[133] = "0b01100";
        ram[134] = "0b01110";
        ram[135] = "0b10000";
        ram[136] = "0b10010";
        ram[137] = "0b10100";
        ram[138] = "0b10110";
        ram[139] = "0b00000";
        ram[140] = "0b00000";
        ram[141] = "0b00000";
        ram[142] = "0b11000";
        ram[143] = "0b11010";
        ram[144] = "0b11100";
        for (unsigned i = 145; i < 152 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[152] = "0b11110";
        for (unsigned i = 153; i < 160 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[160] = "0b00010";
        ram[161] = "0b00100";
        ram[162] = "0b00110";
        ram[163] = "0b01000";
        ram[164] = "0b01010";
        ram[165] = "0b01100";
        ram[166] = "0b01110";
        ram[167] = "0b10000";
        ram[168] = "0b00000";
        ram[169] = "0b10010";
        ram[170] = "0b00000";
        ram[171] = "0b10100";
        ram[172] = "0b00000";
        ram[173] = "0b00000";
        ram[174] = "0b10110";
        ram[175] = "0b11000";
        for (unsigned i = 176; i < 182 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[182] = "0b11010";
        ram[183] = "0b00000";
        ram[184] = "0b11100";
        ram[185] = "0b11110";
        for (unsigned i = 186; i < 192 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[192] = "0b00010";
        ram[193] = "0b00100";
        ram[194] = "0b00110";
        ram[195] = "0b01000";
        ram[196] = "0b01010";
        ram[197] = "0b01100";
        ram[198] = "0b01110";
        ram[199] = "0b10000";
        ram[200] = "0b00000";
        ram[201] = "0b10010";
        ram[202] = "0b10100";
        ram[203] = "0b10110";
        ram[204] = "0b11000";
        ram[205] = "0b11010";
        ram[206] = "0b11100";
        for (unsigned i = 207; i < 214 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[214] = "0b11110";
        for (unsigned i = 215; i < 224 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[224] = "0b00010";
        ram[225] = "0b00000";
        ram[226] = "0b00100";
        ram[227] = "0b00110";
        ram[228] = "0b01000";
        ram[229] = "0b01010";
        ram[230] = "0b01100";
        ram[231] = "0b00000";
        ram[232] = "0b01110";
        ram[233] = "0b10000";
        ram[234] = "0b00000";
        ram[235] = "0b00000";
        ram[236] = "0b00000";
        ram[237] = "0b10010";
        ram[238] = "0b10100";
        ram[239] = "0b10110";
        ram[240] = "0b11000";
        ram[241] = "0b11010";
        ram[242] = "0b11100";
        ram[243] = "0b00000";
        ram[244] = "0b11110";
        for (unsigned i = 245; i < 256 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[256] = "0b00010";
        ram[257] = "0b00100";
        ram[258] = "0b00110";
        ram[259] = "0b01000";
        ram[260] = "0b01010";
        ram[261] = "0b01100";
        ram[262] = "0b01110";
        ram[263] = "0b10000";
        ram[264] = "0b10010";
        ram[265] = "0b10100";
        ram[266] = "0b10110";
        ram[267] = "0b00000";
        ram[268] = "0b00000";
        ram[269] = "0b11000";
        ram[270] = "0b11010";
        ram[271] = "0b11100";
        for (unsigned i = 272; i < 278 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[278] = "0b11110";
        for (unsigned i = 279; i < 288 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[288] = "0b00010";
        ram[289] = "0b00100";
        ram[290] = "0b00110";
        ram[291] = "0b01000";
        ram[292] = "0b00000";
        ram[293] = "0b01010";
        ram[294] = "0b01100";
        ram[295] = "0b01110";
        ram[296] = "0b00000";
        ram[297] = "0b00000";
        ram[298] = "0b00000";
        ram[299] = "0b00000";
        ram[300] = "0b10000";
        ram[301] = "0b10010";
        ram[302] = "0b10100";
        ram[303] = "0b00000";
        ram[304] = "0b10110";
        ram[305] = "0b00000";
        ram[306] = "0b00000";
        ram[307] = "0b00000";
        ram[308] = "0b00000";
        ram[309] = "0b11000";
        ram[310] = "0b11010";
        ram[311] = "0b11100";
        ram[312] = "0b00000";
        ram[313] = "0b00000";
        ram[314] = "0b11110";
        for (unsigned i = 315; i < 320 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[320] = "0b00010";
        ram[321] = "0b00100";
        ram[322] = "0b00110";
        ram[323] = "0b01000";
        ram[324] = "0b00000";
        ram[325] = "0b00000";
        ram[326] = "0b01010";
        ram[327] = "0b01100";
        ram[328] = "0b01110";
        ram[329] = "0b10000";
        ram[330] = "0b10010";
        ram[331] = "0b10100";
        ram[332] = "0b10110";
        ram[333] = "0b00000";
        ram[334] = "0b11000";
        ram[335] = "0b11010";
        ram[336] = "0b11100";
        ram[337] = "0b00000";
        ram[338] = "0b11110";
        for (unsigned i = 339; i < 352 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[352] = "0b00010";
        ram[353] = "0b00100";
        ram[354] = "0b00110";
        ram[355] = "0b01000";
        ram[356] = "0b00000";
        ram[357] = "0b00000";
        ram[358] = "0b01010";
        ram[359] = "0b01100";
        ram[360] = "0b00000";
        ram[361] = "0b01110";
        ram[362] = "0b10000";
        ram[363] = "0b10010";
        ram[364] = "0b00000";
        ram[365] = "0b00000";
        ram[366] = "0b10100";
        ram[367] = "0b00000";
        ram[368] = "0b10110";
        ram[369] = "0b11000";
        ram[370] = "0b11010";
        ram[371] = "0b11100";
        ram[372] = "0b11110";
        for (unsigned i = 373; i < 384 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[384] = "0b00010";
        ram[385] = "0b00000";
        ram[386] = "0b00100";
        ram[387] = "0b00110";
        ram[388] = "0b01000";
        ram[389] = "0b01010";
        ram[390] = "0b00000";
        ram[391] = "0b00000";
        ram[392] = "0b01100";
        ram[393] = "0b01110";
        ram[394] = "0b10000";
        ram[395] = "0b10010";
        ram[396] = "0b10100";
        ram[397] = "0b10110";
        ram[398] = "0b11000";
        ram[399] = "0b00000";
        ram[400] = "0b11010";
        ram[401] = "0b00000";
        ram[402] = "0b11100";
        ram[403] = "0b11110";
        for (unsigned i = 404; i < 416 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[416] = "0b00010";
        ram[417] = "0b00100";
        ram[418] = "0b00110";
        ram[419] = "0b01000";
        ram[420] = "0b01010";
        ram[421] = "0b00000";
        ram[422] = "0b01100";
        ram[423] = "0b01110";
        ram[424] = "0b00000";
        ram[425] = "0b00000";
        ram[426] = "0b00000";
        ram[427] = "0b10000";
        ram[428] = "0b10010";
        ram[429] = "0b10100";
        ram[430] = "0b10110";
        ram[431] = "0b00000";
        ram[432] = "0b11000";
        ram[433] = "0b11010";
        ram[434] = "0b11100";
        for (unsigned i = 435; i < 440 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[440] = "0b11110";
        for (unsigned i = 441; i < 448 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[448] = "0b00010";
        ram[449] = "0b00100";
        ram[450] = "0b00110";
        ram[451] = "0b01000";
        ram[452] = "0b01010";
        ram[453] = "0b01100";
        ram[454] = "0b01110";
        ram[455] = "0b10000";
        ram[456] = "0b00000";
        ram[457] = "0b00000";
        ram[458] = "0b00000";
        ram[459] = "0b10010";
        ram[460] = "0b10100";
        ram[461] = "0b00000";
        ram[462] = "0b10110";
        ram[463] = "0b00000";
        ram[464] = "0b00000";
        ram[465] = "0b11000";
        ram[466] = "0b11010";
        ram[467] = "0b00000";
        ram[468] = "0b11100";
        ram[469] = "0b11110";
        for (unsigned i = 470; i < 480 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[480] = "0b00010";
        ram[481] = "0b00100";
        ram[482] = "0b00110";
        ram[483] = "0b00000";
        ram[484] = "0b00000";
        ram[485] = "0b00000";
        ram[486] = "0b01000";
        ram[487] = "0b00000";
        ram[488] = "0b01010";
        ram[489] = "0b01100";
        ram[490] = "0b01110";
        ram[491] = "0b00000";
        ram[492] = "0b00000";
        ram[493] = "0b00000";
        ram[494] = "0b10000";
        ram[495] = "0b00000";
        ram[496] = "0b10010";
        ram[497] = "0b10100";
        ram[498] = "0b10110";
        ram[499] = "0b11000";
        ram[500] = "0b00000";
        ram[501] = "0b11010";
        ram[502] = "0b11100";
        ram[503] = "0b00000";
        ram[504] = "0b00000";
        ram[505] = "0b00000";
        ram[506] = "0b00000";
        ram[507] = "0b11110";
        ram[508] = "0b00000";
        ram[509] = "0b00000";
        ram[510] = "0b00000";
        ram[511] = "0b00000";


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


SC_MODULE(predict_ensemble_tde) {


static const unsigned DataWidth = 5;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_tde_ram* meminst;


SC_CTOR(predict_ensemble_tde) {
meminst = new predict_ensemble_tde_ram("predict_ensemble_tde_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_tde() {
    delete meminst;
}


};//endmodule
#endif
