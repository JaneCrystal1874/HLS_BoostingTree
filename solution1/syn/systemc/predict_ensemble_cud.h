// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_cud_H__
#define __predict_ensemble_cud_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_cud_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 1;
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


   SC_CTOR(predict_ensemble_cud_ram) {
        for (unsigned i = 0; i < 7 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[7] = "0b1";
        for (unsigned i = 8; i < 14 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[14] = "0b1";
        ram[15] = "0b1";
        ram[16] = "0b1";
        ram[17] = "0b1";
        ram[18] = "0b0";
        ram[19] = "0b1";
        ram[20] = "0b1";
        ram[21] = "0b1";
        ram[22] = "0b1";
        ram[23] = "0b0";
        for (unsigned i = 24; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 31; i < 36 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[36] = "0b1";
        ram[37] = "0b0";
        ram[38] = "0b0";
        ram[39] = "0b0";
        ram[40] = "0b1";
        ram[41] = "0b1";
        ram[42] = "0b0";
        ram[43] = "0b0";
        ram[44] = "0b0";
        ram[45] = "0b0";
        ram[46] = "0b1";
        ram[47] = "0b1";
        ram[48] = "0b1";
        ram[49] = "0b0";
        ram[50] = "0b1";
        ram[51] = "0b1";
        ram[52] = "0b0";
        ram[53] = "0b0";
        ram[54] = "0b1";
        ram[55] = "0b1";
        ram[56] = "0b1";
        ram[57] = "0b0";
        for (unsigned i = 58; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 68 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[68] = "0b1";
        ram[69] = "0b1";
        ram[70] = "0b0";
        ram[71] = "0b0";
        ram[72] = "0b1";
        ram[73] = "0b0";
        ram[74] = "0b0";
        ram[75] = "0b0";
        ram[76] = "0b0";
        ram[77] = "0b1";
        ram[78] = "0b1";
        ram[79] = "0b0";
        ram[80] = "0b0";
        ram[81] = "0b0";
        ram[82] = "0b0";
        ram[83] = "0b1";
        ram[84] = "0b1";
        ram[85] = "0b0";
        for (unsigned i = 86; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 95; i < 101 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[101] = "0b1";
        ram[102] = "0b0";
        ram[103] = "0b1";
        ram[104] = "0b1";
        ram[105] = "0b0";
        ram[106] = "0b1";
        for (unsigned i = 107; i < 114 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 114; i < 121 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[121] = "0b0";
        for (unsigned i = 122; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[127] = "0b0";
        ram[128] = "0b0";
        ram[129] = "0b0";
        ram[130] = "0b1";
        ram[131] = "0b0";
        ram[132] = "0b0";
        ram[133] = "0b0";
        ram[134] = "0b0";
        ram[135] = "0b1";
        for (unsigned i = 136; i < 143 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[143] = "0b1";
        ram[144] = "0b0";
        for (unsigned i = 145; i < 151 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[151] = "0b0";
        for (unsigned i = 152; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 159; i < 164 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[164] = "0b1";
        for (unsigned i = 165; i < 170 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[170] = "0b1";
        ram[171] = "0b0";
        ram[172] = "0b0";
        ram[173] = "0b0";
        ram[174] = "0b1";
        ram[175] = "0b1";
        ram[176] = "0b0";
        ram[177] = "0b1";
        ram[178] = "0b1";
        ram[179] = "0b0";
        ram[180] = "0b1";
        ram[181] = "0b1";
        ram[182] = "0b0";
        for (unsigned i = 183; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 197 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[197] = "0b1";
        ram[198] = "0b0";
        ram[199] = "0b1";
        ram[200] = "0b1";
        ram[201] = "0b0";
        ram[202] = "0b0";
        ram[203] = "0b0";
        ram[204] = "0b0";
        ram[205] = "0b1";
        ram[206] = "0b1";
        ram[207] = "0b1";
        ram[208] = "0b1";
        ram[209] = "0b0";
        ram[210] = "0b0";
        ram[211] = "0b0";
        ram[212] = "0b0";
        ram[213] = "0b1";
        ram[214] = "0b1";
        ram[215] = "0b0";
        for (unsigned i = 216; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 223; i < 234 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[234] = "0b1";
        ram[235] = "0b0";
        ram[236] = "0b1";
        ram[237] = "0b1";
        ram[238] = "0b0";
        ram[239] = "0b0";
        ram[240] = "0b0";
        for (unsigned i = 241; i < 248 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[248] = "0b0";
        for (unsigned i = 249; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[255] = "0b0";
        ram[256] = "0b0";
        ram[257] = "0b1";
        for (unsigned i = 258; i < 267 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[267] = "0b1";
        ram[268] = "0b0";
        ram[269] = "0b1";
        ram[270] = "0b1";
        ram[271] = "0b1";
        ram[272] = "0b1";
        ram[273] = "0b0";
        ram[274] = "0b1";
        ram[275] = "0b1";
        ram[276] = "0b1";
        ram[277] = "0b1";
        ram[278] = "0b0";
        ram[279] = "0b1";
        ram[280] = "0b1";
        ram[281] = "0b0";
        ram[282] = "0b0";
        ram[283] = "0b1";
        ram[284] = "0b1";
        ram[285] = "0b1";
        ram[286] = "0b1";
        ram[287] = "0b0";
        ram[288] = "0b0";
        ram[289] = "0b1";
        ram[290] = "0b0";
        ram[291] = "0b0";
        ram[292] = "0b0";
        ram[293] = "0b1";
        ram[294] = "0b1";
        ram[295] = "0b0";
        ram[296] = "0b0";
        ram[297] = "0b0";
        ram[298] = "0b1";
        ram[299] = "0b0";
        ram[300] = "0b0";
        ram[301] = "0b0";
        ram[302] = "0b0";
        ram[303] = "0b1";
        ram[304] = "0b1";
        ram[305] = "0b1";
        ram[306] = "0b0";
        ram[307] = "0b1";
        ram[308] = "0b0";
        ram[309] = "0b1";
        ram[310] = "0b0";
        ram[311] = "0b0";
        for (unsigned i = 312; i < 319 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 319; i < 324 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[324] = "0b1";
        ram[325] = "0b0";
        ram[326] = "0b0";
        ram[327] = "0b0";
        ram[328] = "0b0";
        ram[329] = "0b1";
        ram[330] = "0b1";
        ram[331] = "0b0";
        ram[332] = "0b0";
        ram[333] = "0b0";
        ram[334] = "0b1";
        ram[335] = "0b1";
        ram[336] = "0b0";
        ram[337] = "0b0";
        ram[338] = "0b1";
        ram[339] = "0b0";
        ram[340] = "0b0";
        for (unsigned i = 341; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[351] = "0b0";
        ram[352] = "0b0";
        ram[353] = "0b0";
        ram[354] = "0b1";
        ram[355] = "0b0";
        ram[356] = "0b0";
        ram[357] = "0b0";
        ram[358] = "0b1";
        ram[359] = "0b1";
        ram[360] = "0b0";
        ram[361] = "0b0";
        ram[362] = "0b1";
        ram[363] = "0b0";
        ram[364] = "0b0";
        ram[365] = "0b0";
        ram[366] = "0b0";
        ram[367] = "0b1";
        ram[368] = "0b1";
        ram[369] = "0b0";
        ram[370] = "0b0";
        ram[371] = "0b1";
        ram[372] = "0b1";
        ram[373] = "0b1";
        ram[374] = "0b0";
        ram[375] = "0b1";
        ram[376] = "0b1";
        ram[377] = "0b0";
        for (unsigned i = 378; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 383; i < 392 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 392; i < 398 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[398] = "0b0";
        ram[399] = "0b0";
        ram[400] = "0b1";
        ram[401] = "0b0";
        ram[402] = "0b0";
        ram[403] = "0b1";
        ram[404] = "0b1";
        ram[405] = "0b0";
        ram[406] = "0b0";
        ram[407] = "0b0";
        for (unsigned i = 408; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 425 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[425] = "0b1";
        ram[426] = "0b0";
        ram[427] = "0b1";
        ram[428] = "0b0";
        ram[429] = "0b0";
        ram[430] = "0b0";
        ram[431] = "0b1";
        ram[432] = "0b1";
        ram[433] = "0b0";
        ram[434] = "0b0";
        for (unsigned i = 435; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 447; i < 452 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[452] = "0b1";
        ram[453] = "0b0";
        ram[454] = "0b0";
        ram[455] = "0b0";
        ram[456] = "0b0";
        ram[457] = "0b1";
        ram[458] = "0b0";
        ram[459] = "0b1";
        ram[460] = "0b0";
        ram[461] = "0b0";
        ram[462] = "0b1";
        ram[463] = "0b0";
        ram[464] = "0b0";
        ram[465] = "0b1";
        ram[466] = "0b1";
        ram[467] = "0b0";
        ram[468] = "0b0";
        for (unsigned i = 469; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 479; i < 488 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 488; i < 493 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[493] = "0b0";
        ram[494] = "0b0";
        ram[495] = "0b0";
        ram[496] = "0b0";
        ram[497] = "0b1";
        ram[498] = "0b1";
        ram[499] = "0b0";
        ram[500] = "0b0";
        ram[501] = "0b0";
        for (unsigned i = 502; i < 511 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[511] = "0b0";


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


SC_MODULE(predict_ensemble_cud) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_cud_ram* meminst;


SC_CTOR(predict_ensemble_cud) {
meminst = new predict_ensemble_cud_ram("predict_ensemble_cud_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_cud() {
    delete meminst;
}


};//endmodule
#endif
