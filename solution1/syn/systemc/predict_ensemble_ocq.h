// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_ocq_H__
#define __predict_ensemble_ocq_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_ocq_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_ocq_ram) {
        ram[0] = "0b00001";
        ram[1] = "0b00011";
        ram[2] = "0b00101";
        ram[3] = "0b00111";
        ram[4] = "0b01001";
        ram[5] = "0b01011";
        ram[6] = "0b01101";
        ram[7] = "0b00000";
        ram[8] = "0b01111";
        ram[9] = "0b10001";
        ram[10] = "0b10011";
        ram[11] = "0b10101";
        ram[12] = "0b10111";
        ram[13] = "0b11001";
        ram[14] = "0b00000";
        ram[15] = "0b00000";
        ram[16] = "0b00000";
        ram[17] = "0b00000";
        ram[18] = "0b11011";
        ram[19] = "0b00000";
        ram[20] = "0b00000";
        ram[21] = "0b00000";
        ram[22] = "0b00000";
        ram[23] = "0b11101";
        for (unsigned i = 24; i < 32 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[32] = "0b00001";
        ram[33] = "0b00011";
        ram[34] = "0b00101";
        ram[35] = "0b00111";
        ram[36] = "0b00000";
        ram[37] = "0b01001";
        ram[38] = "0b01011";
        ram[39] = "0b01101";
        ram[40] = "0b00000";
        ram[41] = "0b00000";
        ram[42] = "0b01111";
        ram[43] = "0b10001";
        ram[44] = "0b10011";
        ram[45] = "0b10101";
        ram[46] = "0b00000";
        ram[47] = "0b00000";
        ram[48] = "0b00000";
        ram[49] = "0b10111";
        ram[50] = "0b00000";
        ram[51] = "0b00000";
        ram[52] = "0b11001";
        ram[53] = "0b11011";
        ram[54] = "0b00000";
        ram[55] = "0b00000";
        ram[56] = "0b00000";
        ram[57] = "0b11101";
        for (unsigned i = 58; i < 64 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[64] = "0b00001";
        ram[65] = "0b00011";
        ram[66] = "0b00101";
        ram[67] = "0b00111";
        ram[68] = "0b00000";
        ram[69] = "0b00000";
        ram[70] = "0b01001";
        ram[71] = "0b01011";
        ram[72] = "0b00000";
        ram[73] = "0b01101";
        ram[74] = "0b01111";
        ram[75] = "0b10001";
        ram[76] = "0b10011";
        ram[77] = "0b00000";
        ram[78] = "0b00000";
        ram[79] = "0b10101";
        ram[80] = "0b10111";
        ram[81] = "0b11001";
        ram[82] = "0b11011";
        ram[83] = "0b00000";
        ram[84] = "0b00000";
        ram[85] = "0b11101";
        for (unsigned i = 86; i < 96 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[96] = "0b00001";
        ram[97] = "0b00011";
        ram[98] = "0b00101";
        ram[99] = "0b00111";
        ram[100] = "0b01001";
        ram[101] = "0b00000";
        ram[102] = "0b01011";
        ram[103] = "0b00000";
        ram[104] = "0b00000";
        ram[105] = "0b01101";
        ram[106] = "0b00000";
        ram[107] = "0b01111";
        ram[108] = "0b10001";
        ram[109] = "0b10011";
        ram[110] = "0b10101";
        ram[111] = "0b10111";
        ram[112] = "0b11001";
        ram[113] = "0b11011";
        for (unsigned i = 114; i < 121 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[121] = "0b11101";
        for (unsigned i = 122; i < 128 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[128] = "0b00001";
        ram[129] = "0b00011";
        ram[130] = "0b00000";
        ram[131] = "0b00101";
        ram[132] = "0b00111";
        ram[133] = "0b01001";
        ram[134] = "0b01011";
        ram[135] = "0b00000";
        ram[136] = "0b01101";
        ram[137] = "0b01111";
        ram[138] = "0b10001";
        ram[139] = "0b10011";
        ram[140] = "0b10101";
        ram[141] = "0b10111";
        ram[142] = "0b11001";
        ram[143] = "0b00000";
        ram[144] = "0b11011";
        for (unsigned i = 145; i < 151 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[151] = "0b11101";
        for (unsigned i = 152; i < 160 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[160] = "0b00001";
        ram[161] = "0b00011";
        ram[162] = "0b00101";
        ram[163] = "0b00111";
        ram[164] = "0b00000";
        ram[165] = "0b01001";
        ram[166] = "0b01011";
        ram[167] = "0b01101";
        ram[168] = "0b01111";
        ram[169] = "0b10001";
        ram[170] = "0b00000";
        ram[171] = "0b10011";
        ram[172] = "0b10101";
        ram[173] = "0b10111";
        ram[174] = "0b00000";
        ram[175] = "0b00000";
        ram[176] = "0b11001";
        ram[177] = "0b00000";
        ram[178] = "0b00000";
        ram[179] = "0b11011";
        ram[180] = "0b00000";
        ram[181] = "0b00000";
        ram[182] = "0b11101";
        for (unsigned i = 183; i < 192 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[192] = "0b00001";
        ram[193] = "0b00011";
        ram[194] = "0b00101";
        ram[195] = "0b00111";
        ram[196] = "0b01001";
        ram[197] = "0b00000";
        ram[198] = "0b01011";
        ram[199] = "0b00000";
        ram[200] = "0b00000";
        ram[201] = "0b01101";
        ram[202] = "0b01111";
        ram[203] = "0b10001";
        ram[204] = "0b10011";
        ram[205] = "0b00000";
        ram[206] = "0b00000";
        ram[207] = "0b00000";
        ram[208] = "0b00000";
        ram[209] = "0b10101";
        ram[210] = "0b10111";
        ram[211] = "0b11001";
        ram[212] = "0b11011";
        ram[213] = "0b00000";
        ram[214] = "0b00000";
        ram[215] = "0b11101";
        for (unsigned i = 216; i < 224 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[224] = "0b00001";
        ram[225] = "0b00011";
        ram[226] = "0b00101";
        ram[227] = "0b00111";
        ram[228] = "0b01001";
        ram[229] = "0b01011";
        ram[230] = "0b01101";
        ram[231] = "0b01111";
        ram[232] = "0b10001";
        ram[233] = "0b10011";
        ram[234] = "0b00000";
        ram[235] = "0b10101";
        ram[236] = "0b00000";
        ram[237] = "0b00000";
        ram[238] = "0b10111";
        ram[239] = "0b11001";
        ram[240] = "0b11011";
        for (unsigned i = 241; i < 248 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[248] = "0b11101";
        for (unsigned i = 249; i < 256 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[256] = "0b00001";
        ram[257] = "0b00000";
        ram[258] = "0b00011";
        ram[259] = "0b00101";
        ram[260] = "0b00111";
        ram[261] = "0b01001";
        ram[262] = "0b01011";
        ram[263] = "0b01101";
        ram[264] = "0b01111";
        ram[265] = "0b10001";
        ram[266] = "0b10011";
        ram[267] = "0b00000";
        ram[268] = "0b10101";
        ram[269] = "0b00000";
        ram[270] = "0b00000";
        ram[271] = "0b00000";
        ram[272] = "0b00000";
        ram[273] = "0b10111";
        ram[274] = "0b00000";
        ram[275] = "0b00000";
        ram[276] = "0b00000";
        ram[277] = "0b00000";
        ram[278] = "0b11001";
        ram[279] = "0b00000";
        ram[280] = "0b00000";
        ram[281] = "0b11011";
        ram[282] = "0b11101";
        for (unsigned i = 283; i < 288 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[288] = "0b00001";
        ram[289] = "0b00000";
        ram[290] = "0b00011";
        ram[291] = "0b00101";
        ram[292] = "0b00111";
        ram[293] = "0b00000";
        ram[294] = "0b00000";
        ram[295] = "0b01001";
        ram[296] = "0b01011";
        ram[297] = "0b01101";
        ram[298] = "0b00000";
        ram[299] = "0b01111";
        ram[300] = "0b10001";
        ram[301] = "0b10011";
        ram[302] = "0b10101";
        ram[303] = "0b00000";
        ram[304] = "0b00000";
        ram[305] = "0b00000";
        ram[306] = "0b10111";
        ram[307] = "0b00000";
        ram[308] = "0b11001";
        ram[309] = "0b00000";
        ram[310] = "0b11011";
        ram[311] = "0b11101";
        for (unsigned i = 312; i < 320 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[320] = "0b00001";
        ram[321] = "0b00011";
        ram[322] = "0b00101";
        ram[323] = "0b00111";
        ram[324] = "0b00000";
        ram[325] = "0b01001";
        ram[326] = "0b01011";
        ram[327] = "0b01101";
        ram[328] = "0b01111";
        ram[329] = "0b00000";
        ram[330] = "0b00000";
        ram[331] = "0b10001";
        ram[332] = "0b10011";
        ram[333] = "0b10101";
        ram[334] = "0b00000";
        ram[335] = "0b00000";
        ram[336] = "0b10111";
        ram[337] = "0b11001";
        ram[338] = "0b00000";
        ram[339] = "0b11011";
        ram[340] = "0b11101";
        for (unsigned i = 341; i < 352 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[352] = "0b00001";
        ram[353] = "0b00011";
        ram[354] = "0b00000";
        ram[355] = "0b00101";
        ram[356] = "0b00111";
        ram[357] = "0b01001";
        ram[358] = "0b00000";
        ram[359] = "0b00000";
        ram[360] = "0b01011";
        ram[361] = "0b01101";
        ram[362] = "0b00000";
        ram[363] = "0b01111";
        ram[364] = "0b10001";
        ram[365] = "0b10011";
        ram[366] = "0b10101";
        ram[367] = "0b00000";
        ram[368] = "0b00000";
        ram[369] = "0b10111";
        ram[370] = "0b11001";
        ram[371] = "0b00000";
        ram[372] = "0b00000";
        ram[373] = "0b00000";
        ram[374] = "0b11011";
        ram[375] = "0b00000";
        ram[376] = "0b00000";
        ram[377] = "0b11101";
        for (unsigned i = 378; i < 384 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[384] = "0b00001";
        ram[385] = "0b00011";
        ram[386] = "0b00101";
        ram[387] = "0b00111";
        ram[388] = "0b01001";
        ram[389] = "0b01011";
        ram[390] = "0b01101";
        ram[391] = "0b01111";
        for (unsigned i = 392; i < 398 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[398] = "0b10001";
        ram[399] = "0b10011";
        ram[400] = "0b00000";
        ram[401] = "0b10101";
        ram[402] = "0b10111";
        ram[403] = "0b00000";
        ram[404] = "0b00000";
        ram[405] = "0b11001";
        ram[406] = "0b11011";
        ram[407] = "0b11101";
        for (unsigned i = 408; i < 416 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[416] = "0b00001";
        ram[417] = "0b00011";
        ram[418] = "0b00101";
        ram[419] = "0b00111";
        ram[420] = "0b01001";
        ram[421] = "0b01011";
        ram[422] = "0b01101";
        ram[423] = "0b01111";
        ram[424] = "0b10001";
        ram[425] = "0b00000";
        ram[426] = "0b10011";
        ram[427] = "0b00000";
        ram[428] = "0b10101";
        ram[429] = "0b10111";
        ram[430] = "0b11001";
        ram[431] = "0b00000";
        ram[432] = "0b00000";
        ram[433] = "0b11011";
        ram[434] = "0b11101";
        for (unsigned i = 435; i < 448 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[448] = "0b00001";
        ram[449] = "0b00011";
        ram[450] = "0b00101";
        ram[451] = "0b00111";
        ram[452] = "0b00000";
        ram[453] = "0b01001";
        ram[454] = "0b01011";
        ram[455] = "0b01101";
        ram[456] = "0b01111";
        ram[457] = "0b00000";
        ram[458] = "0b10001";
        ram[459] = "0b00000";
        ram[460] = "0b10011";
        ram[461] = "0b10101";
        ram[462] = "0b00000";
        ram[463] = "0b10111";
        ram[464] = "0b11001";
        ram[465] = "0b00000";
        ram[466] = "0b00000";
        ram[467] = "0b11011";
        ram[468] = "0b11101";
        for (unsigned i = 469; i < 480 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[480] = "0b00001";
        ram[481] = "0b00011";
        ram[482] = "0b00101";
        ram[483] = "0b00111";
        ram[484] = "0b01001";
        ram[485] = "0b01011";
        ram[486] = "0b01101";
        ram[487] = "0b01111";
        for (unsigned i = 488; i < 493 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[493] = "0b10001";
        ram[494] = "0b10011";
        ram[495] = "0b10101";
        ram[496] = "0b10111";
        ram[497] = "0b00000";
        ram[498] = "0b00000";
        ram[499] = "0b11001";
        ram[500] = "0b11011";
        ram[501] = "0b11101";
        for (unsigned i = 502; i < 512 ; i = i + 1) {
            ram[i] = "0b00000";
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


SC_MODULE(predict_ensemble_ocq) {


static const unsigned DataWidth = 5;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_ocq_ram* meminst;


SC_CTOR(predict_ensemble_ocq) {
meminst = new predict_ensemble_ocq_ram("predict_ensemble_ocq_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_ocq() {
    delete meminst;
}


};//endmodule
#endif
