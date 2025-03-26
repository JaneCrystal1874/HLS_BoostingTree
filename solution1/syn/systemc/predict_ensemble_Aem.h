// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_Aem_H__
#define __predict_ensemble_Aem_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_Aem_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_Aem_ram) {
        ram[0] = "0b100";
        ram[1] = "0b010";
        ram[2] = "0b100";
        ram[3] = "0b010";
        ram[4] = "0b010";
        ram[5] = "0b000";
        ram[6] = "0b001";
        ram[7] = "0b010";
        ram[8] = "0b001";
        ram[9] = "0b000";
        ram[10] = "0b000";
        ram[11] = "0b010";
        ram[12] = "0b001";
        ram[13] = "0b010";
        ram[14] = "0b100";
        ram[15] = "0b000";
        ram[16] = "0b000";
        ram[17] = "0b011";
        ram[18] = "0b001";
        ram[19] = "0b000";
        ram[20] = "0b001";
        for (unsigned i = 21; i < 32 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[32] = "0b001";
        ram[33] = "0b000";
        ram[34] = "0b100";
        ram[35] = "0b100";
        ram[36] = "0b100";
        ram[37] = "0b100";
        ram[38] = "0b000";
        ram[39] = "0b000";
        ram[40] = "0b010";
        ram[41] = "0b100";
        ram[42] = "0b100";
        ram[43] = "0b010";
        ram[44] = "0b000";
        ram[45] = "0b001";
        ram[46] = "0b010";
        ram[47] = "0b000";
        ram[48] = "0b000";
        ram[49] = "0b011";
        ram[50] = "0b011";
        ram[51] = "0b001";
        ram[52] = "0b001";
        for (unsigned i = 53; i < 64 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[64] = "0b010";
        ram[65] = "0b010";
        ram[66] = "0b010";
        ram[67] = "0b001";
        ram[68] = "0b000";
        ram[69] = "0b000";
        ram[70] = "0b001";
        ram[71] = "0b001";
        ram[72] = "0b001";
        ram[73] = "0b000";
        ram[74] = "0b100";
        ram[75] = "0b011";
        ram[76] = "0b010";
        ram[77] = "0b001";
        ram[78] = "0b001";
        ram[79] = "0b010";
        ram[80] = "0b001";
        ram[81] = "0b000";
        ram[82] = "0b000";
        ram[83] = "0b000";
        ram[84] = "0b000";
        ram[85] = "0b001";
        for (unsigned i = 86; i < 96 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[96] = "0b010";
        ram[97] = "0b010";
        ram[98] = "0b010";
        ram[99] = "0b000";
        ram[100] = "0b000";
        ram[101] = "0b000";
        ram[102] = "0b001";
        ram[103] = "0b001";
        ram[104] = "0b001";
        ram[105] = "0b100";
        ram[106] = "0b010";
        ram[107] = "0b100";
        ram[108] = "0b010";
        ram[109] = "0b001";
        ram[110] = "0b100";
        ram[111] = "0b010";
        ram[112] = "0b011";
        ram[113] = "0b000";
        ram[114] = "0b000";
        ram[115] = "0b000";
        ram[116] = "0b001";
        for (unsigned i = 117; i < 128 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[128] = "0b001";
        ram[129] = "0b100";
        ram[130] = "0b001";
        ram[131] = "0b011";
        ram[132] = "0b100";
        ram[133] = "0b001";
        ram[134] = "0b100";
        ram[135] = "0b010";
        for (unsigned i = 136; i < 141 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[141] = "0b011";
        ram[142] = "0b001";
        ram[143] = "0b001";
        ram[144] = "0b000";
        ram[145] = "0b100";
        ram[146] = "0b001";
        ram[147] = "0b011";
        ram[148] = "0b001";
        for (unsigned i = 149; i < 160 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[160] = "0b011";
        ram[161] = "0b011";
        ram[162] = "0b100";
        ram[163] = "0b000";
        ram[164] = "0b000";
        ram[165] = "0b100";
        ram[166] = "0b100";
        ram[167] = "0b001";
        ram[168] = "0b011";
        ram[169] = "0b001";
        ram[170] = "0b100";
        ram[171] = "0b100";
        ram[172] = "0b000";
        ram[173] = "0b000";
        ram[174] = "0b000";
        ram[175] = "0b001";
        ram[176] = "0b000";
        ram[177] = "0b011";
        ram[178] = "0b100";
        ram[179] = "0b000";
        ram[180] = "0b000";
        ram[181] = "0b010";
        ram[182] = "0b000";
        ram[183] = "0b000";
        ram[184] = "0b000";
        ram[185] = "0b000";
        ram[186] = "0b001";
        for (unsigned i = 187; i < 192 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[192] = "0b011";
        ram[193] = "0b011";
        ram[194] = "0b000";
        ram[195] = "0b100";
        ram[196] = "0b010";
        ram[197] = "0b100";
        ram[198] = "0b001";
        ram[199] = "0b000";
        ram[200] = "0b010";
        ram[201] = "0b100";
        ram[202] = "0b000";
        ram[203] = "0b100";
        ram[204] = "0b001";
        ram[205] = "0b000";
        ram[206] = "0b100";
        ram[207] = "0b000";
        ram[208] = "0b000";
        ram[209] = "0b000";
        ram[210] = "0b000";
        ram[211] = "0b100";
        ram[212] = "0b010";
        ram[213] = "0b010";
        ram[214] = "0b001";
        for (unsigned i = 215; i < 224 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[224] = "0b011";
        ram[225] = "0b011";
        ram[226] = "0b100";
        ram[227] = "0b000";
        ram[228] = "0b100";
        ram[229] = "0b100";
        ram[230] = "0b010";
        ram[231] = "0b000";
        ram[232] = "0b100";
        ram[233] = "0b100";
        ram[234] = "0b100";
        ram[235] = "0b001";
        ram[236] = "0b000";
        ram[237] = "0b000";
        ram[238] = "0b000";
        ram[239] = "0b100";
        ram[240] = "0b000";
        ram[241] = "0b010";
        ram[242] = "0b100";
        ram[243] = "0b000";
        ram[244] = "0b000";
        ram[245] = "0b001";
        ram[246] = "0b000";
        ram[247] = "0b000";
        ram[248] = "0b010";
        for (unsigned i = 249; i < 256 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[256] = "0b001";
        ram[257] = "0b100";
        ram[258] = "0b001";
        ram[259] = "0b100";
        ram[260] = "0b010";
        ram[261] = "0b000";
        ram[262] = "0b001";
        ram[263] = "0b100";
        ram[264] = "0b001";
        ram[265] = "0b000";
        ram[266] = "0b001";
        ram[267] = "0b000";
        ram[268] = "0b001";
        ram[269] = "0b011";
        ram[270] = "0b000";
        ram[271] = "0b000";
        ram[272] = "0b001";
        ram[273] = "0b000";
        ram[274] = "0b000";
        ram[275] = "0b010";
        ram[276] = "0b010";
        ram[277] = "0b000";
        ram[278] = "0b100";
        for (unsigned i = 279; i < 288 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[288] = "0b010";
        ram[289] = "0b001";
        ram[290] = "0b010";
        ram[291] = "0b010";
        ram[292] = "0b100";
        ram[293] = "0b001";
        ram[294] = "0b010";
        ram[295] = "0b000";
        ram[296] = "0b100";
        ram[297] = "0b100";
        ram[298] = "0b000";
        ram[299] = "0b100";
        ram[300] = "0b001";
        ram[301] = "0b000";
        ram[302] = "0b011";
        for (unsigned i = 303; i < 310 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[310] = "0b100";
        ram[311] = "0b010";
        ram[312] = "0b010";
        for (unsigned i = 313; i < 320 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[320] = "0b001";
        ram[321] = "0b001";
        ram[322] = "0b001";
        ram[323] = "0b001";
        ram[324] = "0b010";
        ram[325] = "0b100";
        ram[326] = "0b001";
        ram[327] = "0b001";
        ram[328] = "0b000";
        ram[329] = "0b010";
        ram[330] = "0b100";
        ram[331] = "0b000";
        ram[332] = "0b000";
        ram[333] = "0b000";
        ram[334] = "0b011";
        ram[335] = "0b001";
        ram[336] = "0b010";
        ram[337] = "0b100";
        ram[338] = "0b000";
        ram[339] = "0b000";
        ram[340] = "0b000";
        ram[341] = "0b000";
        ram[342] = "0b001";
        for (unsigned i = 343; i < 352 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[352] = "0b010";
        ram[353] = "0b010";
        ram[354] = "0b000";
        ram[355] = "0b010";
        ram[356] = "0b001";
        ram[357] = "0b010";
        ram[358] = "0b011";
        ram[359] = "0b000";
        ram[360] = "0b000";
        ram[361] = "0b010";
        ram[362] = "0b001";
        ram[363] = "0b010";
        ram[364] = "0b001";
        ram[365] = "0b100";
        ram[366] = "0b000";
        ram[367] = "0b000";
        ram[368] = "0b010";
        ram[369] = "0b011";
        ram[370] = "0b010";
        ram[371] = "0b100";
        for (unsigned i = 372; i < 384 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[384] = "0b010";
        ram[385] = "0b000";
        for (unsigned i = 386; i < 391 ; i = i + 1) {
            ram[i] = "0b100";
        }
        ram[391] = "0b000";
        ram[392] = "0b100";
        ram[393] = "0b001";
        ram[394] = "0b000";
        ram[395] = "0b000";
        ram[396] = "0b000";
        ram[397] = "0b100";
        ram[398] = "0b100";
        ram[399] = "0b001";
        ram[400] = "0b000";
        ram[401] = "0b010";
        ram[402] = "0b011";
        ram[403] = "0b010";
        ram[404] = "0b100";
        for (unsigned i = 405; i < 416 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[416] = "0b010";
        ram[417] = "0b001";
        ram[418] = "0b010";
        ram[419] = "0b100";
        ram[420] = "0b000";
        ram[421] = "0b001";
        ram[422] = "0b010";
        ram[423] = "0b010";
        ram[424] = "0b011";
        ram[425] = "0b000";
        ram[426] = "0b000";
        ram[427] = "0b000";
        ram[428] = "0b010";
        ram[429] = "0b001";
        ram[430] = "0b001";
        ram[431] = "0b000";
        ram[432] = "0b000";
        ram[433] = "0b000";
        ram[434] = "0b010";
        ram[435] = "0b100";
        ram[436] = "0b000";
        ram[437] = "0b000";
        ram[438] = "0b000";
        ram[439] = "0b000";
        ram[440] = "0b010";
        ram[441] = "0b000";
        ram[442] = "0b000";
        ram[443] = "0b000";
        ram[444] = "0b010";
        ram[445] = "0b000";
        ram[446] = "0b000";
        ram[447] = "0b000";
        ram[448] = "0b001";
        ram[449] = "0b100";
        ram[450] = "0b100";
        ram[451] = "0b100";
        ram[452] = "0b011";
        ram[453] = "0b100";
        ram[454] = "0b100";
        ram[455] = "0b001";
        ram[456] = "0b000";
        ram[457] = "0b010";
        ram[458] = "0b000";
        ram[459] = "0b010";
        ram[460] = "0b000";
        ram[461] = "0b000";
        ram[462] = "0b001";
        ram[463] = "0b000";
        ram[464] = "0b010";
        ram[465] = "0b000";
        ram[466] = "0b000";
        ram[467] = "0b010";
        ram[468] = "0b000";
        ram[469] = "0b010";
        ram[470] = "0b100";
        for (unsigned i = 471; i < 480 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[480] = "0b010";
        ram[481] = "0b100";
        ram[482] = "0b010";
        ram[483] = "0b011";
        ram[484] = "0b100";
        ram[485] = "0b000";
        ram[486] = "0b001";
        ram[487] = "0b001";
        ram[488] = "0b001";
        ram[489] = "0b010";
        ram[490] = "0b100";
        ram[491] = "0b010";
        ram[492] = "0b001";
        for (unsigned i = 493; i < 500 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[500] = "0b001";
        ram[501] = "0b100";
        ram[502] = "0b010";
        for (unsigned i = 503; i < 512 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_Aem) {


static const unsigned DataWidth = 3;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_Aem_ram* meminst;


SC_CTOR(predict_ensemble_Aem) {
meminst = new predict_ensemble_Aem_ram("predict_ensemble_Aem_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_Aem() {
    delete meminst;
}


};//endmodule
#endif
