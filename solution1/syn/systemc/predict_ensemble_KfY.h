// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_KfY_H__
#define __predict_ensemble_KfY_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_KfY_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_KfY_ram) {
        ram[0] = "0b00001";
        ram[1] = "0b00011";
        ram[2] = "0b00101";
        ram[3] = "0b00111";
        ram[4] = "0b01001";
        ram[5] = "0b00000";
        ram[6] = "0b01011";
        ram[7] = "0b01101";
        ram[8] = "0b00000";
        ram[9] = "0b01111";
        ram[10] = "0b10001";
        ram[11] = "0b10011";
        ram[12] = "0b00000";
        ram[13] = "0b00000";
        ram[14] = "0b10101";
        ram[15] = "0b00000";
        ram[16] = "0b00000";
        ram[17] = "0b10111";
        ram[18] = "0b00000";
        ram[19] = "0b11001";
        ram[20] = "0b00000";
        ram[21] = "0b11011";
        ram[22] = "0b11101";
        for (unsigned i = 23; i < 32 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[32] = "0b00001";
        ram[33] = "0b00011";
        ram[34] = "0b00000";
        ram[35] = "0b00101";
        ram[36] = "0b00111";
        ram[37] = "0b01001";
        ram[38] = "0b00000";
        ram[39] = "0b00000";
        ram[40] = "0b01011";
        ram[41] = "0b01101";
        ram[42] = "0b00000";
        ram[43] = "0b00000";
        ram[44] = "0b01111";
        ram[45] = "0b10001";
        ram[46] = "0b00000";
        ram[47] = "0b10011";
        ram[48] = "0b10101";
        ram[49] = "0b00000";
        ram[50] = "0b00000";
        ram[51] = "0b10111";
        ram[52] = "0b11001";
        ram[53] = "0b11011";
        ram[54] = "0b11101";
        for (unsigned i = 55; i < 64 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[64] = "0b00001";
        ram[65] = "0b00011";
        ram[66] = "0b00101";
        ram[67] = "0b00111";
        ram[68] = "0b01001";
        ram[69] = "0b01011";
        ram[70] = "0b01101";
        ram[71] = "0b01111";
        ram[72] = "0b10001";
        ram[73] = "0b00000";
        ram[74] = "0b10011";
        ram[75] = "0b10101";
        ram[76] = "0b10111";
        ram[77] = "0b00000";
        ram[78] = "0b11001";
        for (unsigned i = 79; i < 85 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[85] = "0b11011";
        ram[86] = "0b00000";
        ram[87] = "0b00000";
        ram[88] = "0b11101";
        for (unsigned i = 89; i < 96 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[96] = "0b00001";
        ram[97] = "0b00011";
        ram[98] = "0b00101";
        ram[99] = "0b00111";
        ram[100] = "0b00000";
        ram[101] = "0b01001";
        ram[102] = "0b01011";
        ram[103] = "0b01101";
        ram[104] = "0b01111";
        ram[105] = "0b10001";
        ram[106] = "0b00000";
        ram[107] = "0b00000";
        ram[108] = "0b10011";
        ram[109] = "0b10101";
        ram[110] = "0b10111";
        ram[111] = "0b00000";
        ram[112] = "0b11001";
        ram[113] = "0b00000";
        ram[114] = "0b00000";
        ram[115] = "0b00000";
        ram[116] = "0b11011";
        ram[117] = "0b00000";
        ram[118] = "0b00000";
        ram[119] = "0b00000";
        ram[120] = "0b11101";
        for (unsigned i = 121; i < 128 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[128] = "0b00001";
        ram[129] = "0b00011";
        ram[130] = "0b00101";
        ram[131] = "0b00111";
        ram[132] = "0b01001";
        ram[133] = "0b01011";
        ram[134] = "0b01101";
        ram[135] = "0b01111";
        ram[136] = "0b10001";
        ram[137] = "0b10011";
        ram[138] = "0b00000";
        ram[139] = "0b00000";
        ram[140] = "0b00000";
        ram[141] = "0b00000";
        ram[142] = "0b10101";
        ram[143] = "0b10111";
        ram[144] = "0b11001";
        ram[145] = "0b11011";
        ram[146] = "0b00000";
        ram[147] = "0b00000";
        ram[148] = "0b00000";
        ram[149] = "0b00000";
        ram[150] = "0b11101";
        for (unsigned i = 151; i < 160 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[160] = "0b00001";
        ram[161] = "0b00011";
        ram[162] = "0b00000";
        ram[163] = "0b00101";
        ram[164] = "0b00111";
        ram[165] = "0b01001";
        ram[166] = "0b01011";
        ram[167] = "0b01101";
        ram[168] = "0b01111";
        ram[169] = "0b10001";
        ram[170] = "0b00000";
        ram[171] = "0b00000";
        ram[172] = "0b00000";
        ram[173] = "0b10011";
        ram[174] = "0b10101";
        ram[175] = "0b00000";
        ram[176] = "0b10111";
        ram[177] = "0b00000";
        ram[178] = "0b00000";
        ram[179] = "0b11001";
        ram[180] = "0b11011";
        ram[181] = "0b00000";
        ram[182] = "0b00000";
        ram[183] = "0b00000";
        ram[184] = "0b11101";
        for (unsigned i = 185; i < 192 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[192] = "0b00001";
        ram[193] = "0b00011";
        ram[194] = "0b00101";
        ram[195] = "0b00111";
        ram[196] = "0b00000";
        ram[197] = "0b00000";
        ram[198] = "0b01001";
        ram[199] = "0b01011";
        ram[200] = "0b01101";
        ram[201] = "0b01111";
        ram[202] = "0b10001";
        ram[203] = "0b00000";
        ram[204] = "0b00000";
        ram[205] = "0b10011";
        ram[206] = "0b10101";
        ram[207] = "0b10111";
        ram[208] = "0b11001";
        for (unsigned i = 209; i < 215 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[215] = "0b11011";
        ram[216] = "0b11101";
        for (unsigned i = 217; i < 224 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[224] = "0b00001";
        ram[225] = "0b00011";
        ram[226] = "0b00101";
        ram[227] = "0b00111";
        ram[228] = "0b01001";
        ram[229] = "0b00000";
        ram[230] = "0b01011";
        ram[231] = "0b01101";
        ram[232] = "0b01111";
        ram[233] = "0b10001";
        ram[234] = "0b10011";
        ram[235] = "0b10101";
        ram[236] = "0b10111";
        ram[237] = "0b11001";
        ram[238] = "0b00000";
        ram[239] = "0b00000";
        ram[240] = "0b11011";
        for (unsigned i = 241; i < 248 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[248] = "0b11101";
        for (unsigned i = 249; i < 256 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[256] = "0b00001";
        ram[257] = "0b00011";
        ram[258] = "0b00101";
        ram[259] = "0b00111";
        ram[260] = "0b00000";
        ram[261] = "0b00000";
        ram[262] = "0b01001";
        ram[263] = "0b01011";
        ram[264] = "0b00000";
        ram[265] = "0b01101";
        ram[266] = "0b00000";
        ram[267] = "0b01111";
        ram[268] = "0b10001";
        ram[269] = "0b10011";
        ram[270] = "0b00000";
        ram[271] = "0b10101";
        ram[272] = "0b10111";
        ram[273] = "0b00000";
        ram[274] = "0b11001";
        ram[275] = "0b00000";
        ram[276] = "0b00000";
        ram[277] = "0b11011";
        ram[278] = "0b11101";
        for (unsigned i = 279; i < 288 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[288] = "0b00001";
        ram[289] = "0b00011";
        ram[290] = "0b00101";
        ram[291] = "0b00111";
        ram[292] = "0b01001";
        ram[293] = "0b00000";
        ram[294] = "0b01011";
        ram[295] = "0b01101";
        ram[296] = "0b00000";
        ram[297] = "0b00000";
        ram[298] = "0b00000";
        ram[299] = "0b01111";
        ram[300] = "0b10001";
        ram[301] = "0b10011";
        ram[302] = "0b00000";
        ram[303] = "0b10101";
        ram[304] = "0b10111";
        ram[305] = "0b11001";
        ram[306] = "0b11011";
        for (unsigned i = 307; i < 315 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[315] = "0b11101";
        ram[316] = "0b00000";
        ram[317] = "0b00000";
        ram[318] = "0b00000";
        ram[319] = "0b00000";
        ram[320] = "0b00001";
        ram[321] = "0b00011";
        ram[322] = "0b00101";
        ram[323] = "0b00111";
        ram[324] = "0b00000";
        ram[325] = "0b01001";
        ram[326] = "0b01011";
        ram[327] = "0b00000";
        ram[328] = "0b01101";
        ram[329] = "0b00000";
        ram[330] = "0b00000";
        ram[331] = "0b01111";
        ram[332] = "0b10001";
        ram[333] = "0b10011";
        ram[334] = "0b10101";
        ram[335] = "0b10111";
        ram[336] = "0b00000";
        ram[337] = "0b11001";
        ram[338] = "0b11011";
        for (unsigned i = 339; i < 348 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[348] = "0b11101";
        ram[349] = "0b00000";
        ram[350] = "0b00000";
        ram[351] = "0b00000";
        ram[352] = "0b00001";
        ram[353] = "0b00011";
        ram[354] = "0b00101";
        ram[355] = "0b00111";
        ram[356] = "0b00000";
        ram[357] = "0b00000";
        ram[358] = "0b01001";
        ram[359] = "0b01011";
        ram[360] = "0b01101";
        ram[361] = "0b01111";
        ram[362] = "0b10001";
        ram[363] = "0b10011";
        ram[364] = "0b10101";
        ram[365] = "0b00000";
        ram[366] = "0b10111";
        ram[367] = "0b00000";
        ram[368] = "0b11001";
        ram[369] = "0b00000";
        ram[370] = "0b11011";
        ram[371] = "0b11101";
        for (unsigned i = 372; i < 384 ; i = i + 1) {
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
        ram[392] = "0b00000";
        ram[393] = "0b10001";
        ram[394] = "0b00000";
        ram[395] = "0b10011";
        ram[396] = "0b10101";
        ram[397] = "0b00000";
        ram[398] = "0b10111";
        ram[399] = "0b00000";
        ram[400] = "0b00000";
        ram[401] = "0b00000";
        ram[402] = "0b11001";
        ram[403] = "0b00000";
        ram[404] = "0b00000";
        ram[405] = "0b00000";
        ram[406] = "0b11011";
        ram[407] = "0b00000";
        ram[408] = "0b11101";
        for (unsigned i = 409; i < 416 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[416] = "0b00001";
        ram[417] = "0b00011";
        ram[418] = "0b00101";
        ram[419] = "0b00000";
        ram[420] = "0b00111";
        ram[421] = "0b00000";
        ram[422] = "0b01001";
        ram[423] = "0b01011";
        ram[424] = "0b00000";
        ram[425] = "0b01101";
        ram[426] = "0b01111";
        ram[427] = "0b00000";
        ram[428] = "0b10001";
        ram[429] = "0b10011";
        ram[430] = "0b10101";
        ram[431] = "0b10111";
        ram[432] = "0b11001";
        for (unsigned i = 433; i < 438 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[438] = "0b11011";
        ram[439] = "0b00000";
        ram[440] = "0b00000";
        ram[441] = "0b11101";
        for (unsigned i = 442; i < 448 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[448] = "0b00001";
        ram[449] = "0b00011";
        ram[450] = "0b00101";
        ram[451] = "0b00111";
        ram[452] = "0b00000";
        ram[453] = "0b00000";
        ram[454] = "0b01001";
        ram[455] = "0b01011";
        ram[456] = "0b01101";
        ram[457] = "0b01111";
        ram[458] = "0b10001";
        ram[459] = "0b10011";
        ram[460] = "0b10101";
        ram[461] = "0b10111";
        ram[462] = "0b11001";
        ram[463] = "0b11011";
        ram[464] = "0b00000";
        ram[465] = "0b00000";
        ram[466] = "0b11101";
        for (unsigned i = 467; i < 480 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[480] = "0b00001";
        ram[481] = "0b00011";
        ram[482] = "0b00101";
        ram[483] = "0b00000";
        ram[484] = "0b00000";
        ram[485] = "0b00111";
        ram[486] = "0b01001";
        ram[487] = "0b01011";
        ram[488] = "0b00000";
        ram[489] = "0b00000";
        ram[490] = "0b01101";
        ram[491] = "0b00000";
        ram[492] = "0b00000";
        ram[493] = "0b00000";
        ram[494] = "0b01111";
        ram[495] = "0b10001";
        ram[496] = "0b10011";
        ram[497] = "0b00000";
        ram[498] = "0b00000";
        ram[499] = "0b00000";
        ram[500] = "0b10101";
        ram[501] = "0b00000";
        ram[502] = "0b10111";
        ram[503] = "0b11001";
        ram[504] = "0b11011";
        ram[505] = "0b00000";
        ram[506] = "0b00000";
        ram[507] = "0b00000";
        ram[508] = "0b11101";
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


SC_MODULE(predict_ensemble_KfY) {


static const unsigned DataWidth = 5;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_KfY_ram* meminst;


SC_CTOR(predict_ensemble_KfY) {
meminst = new predict_ensemble_KfY_ram("predict_ensemble_KfY_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_KfY() {
    delete meminst;
}


};//endmodule
#endif
