// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_ibs_H__
#define __predict_ensemble_ibs_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_ibs_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 3;
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


   SC_CTOR(predict_ensemble_ibs_ram) {
        ram[0] = "0b010";
        ram[1] = "0b010";
        ram[2] = "0b010";
        ram[3] = "0b010";
        ram[4] = "0b000";
        ram[5] = "0b000";
        ram[6] = "0b100";
        ram[7] = "0b100";
        ram[8] = "0b000";
        ram[9] = "0b100";
        ram[10] = "0b010";
        ram[11] = "0b001";
        ram[12] = "0b100";
        ram[13] = "0b100";
        ram[14] = "0b010";
        ram[15] = "0b000";
        ram[16] = "0b100";
        ram[17] = "0b000";
        ram[18] = "0b001";
        for (unsigned i = 19; i < 24 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[24] = "0b010";
        for (unsigned i = 25; i < 32 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[32] = "0b001";
        ram[33] = "0b001";
        ram[34] = "0b001";
        ram[35] = "0b100";
        ram[36] = "0b000";
        ram[37] = "0b000";
        ram[38] = "0b010";
        ram[39] = "0b100";
        ram[40] = "0b001";
        ram[41] = "0b010";
        ram[42] = "0b001";
        ram[43] = "0b100";
        ram[44] = "0b100";
        ram[45] = "0b000";
        ram[46] = "0b000";
        ram[47] = "0b010";
        ram[48] = "0b100";
        ram[49] = "0b010";
        ram[50] = "0b100";
        for (unsigned i = 51; i < 64 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[64] = "0b010";
        ram[65] = "0b010";
        ram[66] = "0b000";
        ram[67] = "0b001";
        ram[68] = "0b010";
        ram[69] = "0b001";
        ram[70] = "0b001";
        ram[71] = "0b000";
        ram[72] = "0b010";
        ram[73] = "0b010";
        ram[74] = "0b000";
        ram[75] = "0b000";
        ram[76] = "0b001";
        ram[77] = "0b000";
        ram[78] = "0b000";
        ram[79] = "0b010";
        ram[80] = "0b001";
        ram[81] = "0b000";
        ram[82] = "0b100";
        ram[83] = "0b001";
        ram[84] = "0b000";
        ram[85] = "0b000";
        ram[86] = "0b000";
        ram[87] = "0b011";
        ram[88] = "0b010";
        for (unsigned i = 89; i < 96 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[96] = "0b001";
        ram[97] = "0b100";
        ram[98] = "0b001";
        ram[99] = "0b001";
        ram[100] = "0b000";
        ram[101] = "0b001";
        ram[102] = "0b001";
        ram[103] = "0b100";
        ram[104] = "0b000";
        ram[105] = "0b011";
        ram[106] = "0b000";
        ram[107] = "0b000";
        ram[108] = "0b100";
        ram[109] = "0b100";
        ram[110] = "0b000";
        ram[111] = "0b001";
        ram[112] = "0b011";
        ram[113] = "0b010";
        ram[114] = "0b100";
        for (unsigned i = 115; i < 122 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[122] = "0b010";
        for (unsigned i = 123; i < 128 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[128] = "0b010";
        ram[129] = "0b010";
        ram[130] = "0b010";
        ram[131] = "0b010";
        ram[132] = "0b100";
        ram[133] = "0b000";
        ram[134] = "0b100";
        ram[135] = "0b100";
        ram[136] = "0b000";
        ram[137] = "0b000";
        ram[138] = "0b000";
        ram[139] = "0b010";
        ram[140] = "0b100";
        ram[141] = "0b100";
        ram[142] = "0b100";
        ram[143] = "0b000";
        ram[144] = "0b100";
        ram[145] = "0b001";
        ram[146] = "0b100";
        ram[147] = "0b100";
        for (unsigned i = 148; i < 160 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[160] = "0b100";
        ram[161] = "0b010";
        ram[162] = "0b100";
        ram[163] = "0b000";
        ram[164] = "0b000";
        ram[165] = "0b000";
        ram[166] = "0b001";
        ram[167] = "0b000";
        ram[168] = "0b010";
        ram[169] = "0b001";
        ram[170] = "0b010";
        ram[171] = "0b000";
        ram[172] = "0b000";
        ram[173] = "0b010";
        ram[174] = "0b010";
        for (unsigned i = 175; i < 181 ; i = i + 1) {
            ram[i] = "0b001";
        }
        for (unsigned i = 181; i < 192 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[192] = "0b001";
        ram[193] = "0b100";
        ram[194] = "0b010";
        ram[195] = "0b100";
        ram[196] = "0b001";
        ram[197] = "0b000";
        ram[198] = "0b100";
        ram[199] = "0b001";
        ram[200] = "0b000";
        ram[201] = "0b000";
        ram[202] = "0b100";
        ram[203] = "0b000";
        ram[204] = "0b000";
        ram[205] = "0b100";
        ram[206] = "0b000";
        ram[207] = "0b011";
        ram[208] = "0b010";
        ram[209] = "0b010";
        ram[210] = "0b000";
        ram[211] = "0b000";
        ram[212] = "0b010";
        ram[213] = "0b010";
        ram[214] = "0b011";
        for (unsigned i = 215; i < 224 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[224] = "0b010";
        ram[225] = "0b001";
        ram[226] = "0b010";
        ram[227] = "0b001";
        ram[228] = "0b011";
        ram[229] = "0b000";
        ram[230] = "0b001";
        ram[231] = "0b001";
        ram[232] = "0b000";
        ram[233] = "0b000";
        ram[234] = "0b000";
        ram[235] = "0b010";
        ram[236] = "0b001";
        ram[237] = "0b010";
        ram[238] = "0b010";
        ram[239] = "0b100";
        ram[240] = "0b100";
        ram[241] = "0b010";
        ram[242] = "0b100";
        for (unsigned i = 243; i < 256 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[256] = "0b011";
        ram[257] = "0b001";
        ram[258] = "0b100";
        ram[259] = "0b001";
        ram[260] = "0b001";
        ram[261] = "0b100";
        ram[262] = "0b001";
        ram[263] = "0b001";
        ram[264] = "0b011";
        ram[265] = "0b000";
        ram[266] = "0b100";
        ram[267] = "0b010";
        ram[268] = "0b000";
        ram[269] = "0b010";
        ram[270] = "0b001";
        ram[271] = "0b000";
        ram[272] = "0b000";
        ram[273] = "0b000";
        ram[274] = "0b100";
        ram[275] = "0b000";
        ram[276] = "0b000";
        ram[277] = "0b010";
        for (unsigned i = 278; i < 288 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[288] = "0b010";
        ram[289] = "0b010";
        ram[290] = "0b010";
        ram[291] = "0b010";
        ram[292] = "0b000";
        ram[293] = "0b000";
        ram[294] = "0b011";
        ram[295] = "0b001";
        ram[296] = "0b000";
        ram[297] = "0b010";
        ram[298] = "0b001";
        ram[299] = "0b000";
        ram[300] = "0b001";
        ram[301] = "0b100";
        ram[302] = "0b010";
        ram[303] = "0b001";
        ram[304] = "0b001";
        ram[305] = "0b000";
        ram[306] = "0b000";
        ram[307] = "0b010";
        for (unsigned i = 308; i < 314 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[314] = "0b100";
        for (unsigned i = 315; i < 320 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[320] = "0b001";
        ram[321] = "0b000";
        ram[322] = "0b001";
        ram[323] = "0b100";
        ram[324] = "0b001";
        ram[325] = "0b010";
        ram[326] = "0b001";
        ram[327] = "0b010";
        ram[328] = "0b010";
        ram[329] = "0b010";
        ram[330] = "0b010";
        ram[331] = "0b000";
        ram[332] = "0b000";
        ram[333] = "0b000";
        ram[334] = "0b000";
        ram[335] = "0b010";
        ram[336] = "0b010";
        ram[337] = "0b000";
        ram[338] = "0b100";
        ram[339] = "0b000";
        ram[340] = "0b000";
        ram[341] = "0b001";
        ram[342] = "0b000";
        ram[343] = "0b100";
        for (unsigned i = 344; i < 352 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[352] = "0b010";
        ram[353] = "0b010";
        ram[354] = "0b000";
        ram[355] = "0b100";
        ram[356] = "0b000";
        ram[357] = "0b100";
        ram[358] = "0b100";
        ram[359] = "0b001";
        ram[360] = "0b000";
        ram[361] = "0b000";
        ram[362] = "0b100";
        ram[363] = "0b001";
        ram[364] = "0b000";
        ram[365] = "0b100";
        ram[366] = "0b100";
        ram[367] = "0b001";
        ram[368] = "0b001";
        ram[369] = "0b100";
        ram[370] = "0b001";
        ram[371] = "0b000";
        ram[372] = "0b100";
        for (unsigned i = 373; i < 384 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[384] = "0b001";
        ram[385] = "0b001";
        ram[386] = "0b001";
        ram[387] = "0b001";
        ram[388] = "0b000";
        ram[389] = "0b100";
        ram[390] = "0b100";
        ram[391] = "0b001";
        ram[392] = "0b100";
        ram[393] = "0b000";
        ram[394] = "0b000";
        ram[395] = "0b000";
        ram[396] = "0b100";
        ram[397] = "0b011";
        ram[398] = "0b000";
        ram[399] = "0b000";
        ram[400] = "0b100";
        ram[401] = "0b001";
        ram[402] = "0b011";
        for (unsigned i = 403; i < 409 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[409] = "0b001";
        ram[410] = "0b100";
        for (unsigned i = 411; i < 416 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[416] = "0b100";
        ram[417] = "0b100";
        ram[418] = "0b001";
        ram[419] = "0b010";
        ram[420] = "0b000";
        ram[421] = "0b001";
        ram[422] = "0b001";
        ram[423] = "0b010";
        ram[424] = "0b011";
        ram[425] = "0b001";
        ram[426] = "0b100";
        ram[427] = "0b100";
        ram[428] = "0b100";
        ram[429] = "0b000";
        ram[430] = "0b000";
        ram[431] = "0b001";
        for (unsigned i = 432; i < 439 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[439] = "0b100";
        ram[440] = "0b100";
        for (unsigned i = 441; i < 448 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[448] = "0b011";
        ram[449] = "0b011";
        ram[450] = "0b011";
        ram[451] = "0b010";
        ram[452] = "0b000";
        ram[453] = "0b010";
        ram[454] = "0b010";
        ram[455] = "0b000";
        ram[456] = "0b000";
        ram[457] = "0b000";
        ram[458] = "0b010";
        ram[459] = "0b001";
        ram[460] = "0b010";
        ram[461] = "0b000";
        ram[462] = "0b000";
        ram[463] = "0b001";
        ram[464] = "0b001";
        ram[465] = "0b001";
        ram[466] = "0b010";
        ram[467] = "0b000";
        ram[468] = "0b000";
        ram[469] = "0b100";
        ram[470] = "0b000";
        ram[471] = "0b100";
        for (unsigned i = 472; i < 480 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[480] = "0b010";
        ram[481] = "0b010";
        ram[482] = "0b001";
        ram[483] = "0b100";
        ram[484] = "0b000";
        ram[485] = "0b010";
        ram[486] = "0b001";
        ram[487] = "0b001";
        ram[488] = "0b001";
        ram[489] = "0b100";
        ram[490] = "0b100";
        ram[491] = "0b000";
        ram[492] = "0b001";
        ram[493] = "0b000";
        ram[494] = "0b011";
        ram[495] = "0b011";
        ram[496] = "0b000";
        ram[497] = "0b000";
        ram[498] = "0b100";
        ram[499] = "0b001";
        for (unsigned i = 500; i < 512 ; i = i + 1) {
            ram[i] = "0b000";
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


SC_MODULE(predict_ensemble_ibs) {


static const unsigned DataWidth = 3;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_ibs_ram* meminst;


SC_CTOR(predict_ensemble_ibs) {
meminst = new predict_ensemble_ibs_ram("predict_ensemble_ibs_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_ibs() {
    delete meminst;
}


};//endmodule
#endif
