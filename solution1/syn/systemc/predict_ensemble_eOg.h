// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_eOg_H__
#define __predict_ensemble_eOg_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_eOg_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_eOg_ram) {
        ram[0] = "0b0";
        ram[1] = "0b0";
        ram[2] = "0b0";
        ram[3] = "0b0";
        ram[4] = "0b1";
        ram[5] = "0b1";
        ram[6] = "0b0";
        ram[7] = "0b0";
        ram[8] = "0b1";
        for (unsigned i = 9; i < 15 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[15] = "0b1";
        ram[16] = "0b0";
        ram[17] = "0b1";
        ram[18] = "0b0";
        for (unsigned i = 19; i < 24 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[24] = "0b0";
        for (unsigned i = 25; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 31; i < 36 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[36] = "0b1";
        ram[37] = "0b1";
        for (unsigned i = 38; i < 45 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[45] = "0b1";
        ram[46] = "0b1";
        ram[47] = "0b0";
        ram[48] = "0b0";
        ram[49] = "0b0";
        ram[50] = "0b0";
        for (unsigned i = 51; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[63] = "0b0";
        ram[64] = "0b0";
        ram[65] = "0b0";
        ram[66] = "0b1";
        ram[67] = "0b0";
        ram[68] = "0b0";
        ram[69] = "0b0";
        ram[70] = "0b0";
        ram[71] = "0b1";
        ram[72] = "0b0";
        ram[73] = "0b0";
        ram[74] = "0b1";
        ram[75] = "0b1";
        ram[76] = "0b0";
        ram[77] = "0b1";
        ram[78] = "0b1";
        ram[79] = "0b0";
        ram[80] = "0b0";
        ram[81] = "0b1";
        ram[82] = "0b0";
        ram[83] = "0b0";
        ram[84] = "0b1";
        ram[85] = "0b1";
        ram[86] = "0b1";
        ram[87] = "0b0";
        ram[88] = "0b0";
        for (unsigned i = 89; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 95; i < 100 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[100] = "0b1";
        ram[101] = "0b0";
        ram[102] = "0b0";
        ram[103] = "0b0";
        ram[104] = "0b1";
        ram[105] = "0b0";
        ram[106] = "0b1";
        ram[107] = "0b1";
        ram[108] = "0b0";
        ram[109] = "0b0";
        ram[110] = "0b1";
        ram[111] = "0b0";
        ram[112] = "0b0";
        ram[113] = "0b0";
        ram[114] = "0b0";
        for (unsigned i = 115; i < 122 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[122] = "0b0";
        ram[123] = "0b1";
        ram[124] = "0b1";
        ram[125] = "0b1";
        ram[126] = "0b1";
        for (unsigned i = 127; i < 133 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[133] = "0b1";
        ram[134] = "0b0";
        ram[135] = "0b0";
        ram[136] = "0b1";
        ram[137] = "0b1";
        ram[138] = "0b1";
        ram[139] = "0b0";
        ram[140] = "0b0";
        ram[141] = "0b0";
        ram[142] = "0b0";
        ram[143] = "0b1";
        ram[144] = "0b0";
        ram[145] = "0b0";
        ram[146] = "0b0";
        ram[147] = "0b0";
        for (unsigned i = 148; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[159] = "0b0";
        ram[160] = "0b0";
        ram[161] = "0b0";
        ram[162] = "0b0";
        ram[163] = "0b1";
        ram[164] = "0b1";
        ram[165] = "0b1";
        ram[166] = "0b0";
        ram[167] = "0b1";
        ram[168] = "0b0";
        ram[169] = "0b0";
        ram[170] = "0b0";
        ram[171] = "0b1";
        ram[172] = "0b1";
        for (unsigned i = 173; i < 181 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 181; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 197 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[197] = "0b1";
        ram[198] = "0b0";
        ram[199] = "0b0";
        ram[200] = "0b1";
        ram[201] = "0b1";
        ram[202] = "0b0";
        ram[203] = "0b1";
        ram[204] = "0b1";
        ram[205] = "0b0";
        ram[206] = "0b1";
        ram[207] = "0b0";
        ram[208] = "0b0";
        ram[209] = "0b0";
        ram[210] = "0b1";
        ram[211] = "0b1";
        ram[212] = "0b0";
        ram[213] = "0b0";
        ram[214] = "0b0";
        for (unsigned i = 215; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 223; i < 229 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[229] = "0b1";
        ram[230] = "0b0";
        ram[231] = "0b0";
        ram[232] = "0b1";
        ram[233] = "0b1";
        ram[234] = "0b1";
        for (unsigned i = 235; i < 243 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 243; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 255; i < 265 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[265] = "0b1";
        ram[266] = "0b0";
        ram[267] = "0b0";
        ram[268] = "0b1";
        ram[269] = "0b0";
        ram[270] = "0b0";
        ram[271] = "0b1";
        ram[272] = "0b1";
        ram[273] = "0b1";
        ram[274] = "0b0";
        ram[275] = "0b1";
        ram[276] = "0b1";
        ram[277] = "0b0";
        for (unsigned i = 278; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 292 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[292] = "0b1";
        ram[293] = "0b1";
        ram[294] = "0b0";
        ram[295] = "0b0";
        ram[296] = "0b1";
        ram[297] = "0b0";
        ram[298] = "0b0";
        ram[299] = "0b1";
        for (unsigned i = 300; i < 305 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[305] = "0b1";
        ram[306] = "0b1";
        ram[307] = "0b0";
        for (unsigned i = 308; i < 314 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[314] = "0b0";
        ram[315] = "0b1";
        ram[316] = "0b1";
        ram[317] = "0b1";
        ram[318] = "0b1";
        ram[319] = "0b0";
        ram[320] = "0b0";
        ram[321] = "0b1";
        for (unsigned i = 322; i < 331 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[331] = "0b1";
        ram[332] = "0b1";
        ram[333] = "0b1";
        ram[334] = "0b1";
        ram[335] = "0b0";
        ram[336] = "0b0";
        ram[337] = "0b1";
        ram[338] = "0b0";
        ram[339] = "0b1";
        ram[340] = "0b1";
        ram[341] = "0b0";
        ram[342] = "0b1";
        ram[343] = "0b0";
        for (unsigned i = 344; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[351] = "0b0";
        ram[352] = "0b0";
        ram[353] = "0b0";
        ram[354] = "0b1";
        ram[355] = "0b0";
        ram[356] = "0b1";
        ram[357] = "0b0";
        ram[358] = "0b0";
        ram[359] = "0b0";
        ram[360] = "0b1";
        ram[361] = "0b1";
        ram[362] = "0b0";
        ram[363] = "0b0";
        ram[364] = "0b1";
        for (unsigned i = 365; i < 371 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[371] = "0b1";
        ram[372] = "0b0";
        for (unsigned i = 373; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 383; i < 388 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[388] = "0b1";
        ram[389] = "0b0";
        ram[390] = "0b0";
        ram[391] = "0b0";
        ram[392] = "0b0";
        ram[393] = "0b1";
        ram[394] = "0b1";
        ram[395] = "0b1";
        ram[396] = "0b0";
        ram[397] = "0b0";
        ram[398] = "0b1";
        ram[399] = "0b1";
        ram[400] = "0b0";
        ram[401] = "0b0";
        ram[402] = "0b0";
        for (unsigned i = 403; i < 409 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[409] = "0b0";
        ram[410] = "0b0";
        ram[411] = "0b1";
        ram[412] = "0b1";
        ram[413] = "0b1";
        ram[414] = "0b1";
        for (unsigned i = 415; i < 420 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[420] = "0b1";
        for (unsigned i = 421; i < 429 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[429] = "0b1";
        ram[430] = "0b1";
        ram[431] = "0b0";
        for (unsigned i = 432; i < 439 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[439] = "0b0";
        ram[440] = "0b0";
        for (unsigned i = 441; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 447; i < 452 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[452] = "0b1";
        ram[453] = "0b0";
        ram[454] = "0b0";
        ram[455] = "0b1";
        ram[456] = "0b1";
        ram[457] = "0b1";
        ram[458] = "0b0";
        ram[459] = "0b0";
        ram[460] = "0b0";
        ram[461] = "0b1";
        ram[462] = "0b1";
        ram[463] = "0b0";
        ram[464] = "0b0";
        ram[465] = "0b0";
        ram[466] = "0b0";
        ram[467] = "0b1";
        ram[468] = "0b1";
        ram[469] = "0b0";
        ram[470] = "0b1";
        ram[471] = "0b0";
        for (unsigned i = 472; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 479; i < 484 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[484] = "0b1";
        for (unsigned i = 485; i < 491 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[491] = "0b1";
        ram[492] = "0b0";
        ram[493] = "0b1";
        ram[494] = "0b0";
        ram[495] = "0b0";
        ram[496] = "0b1";
        ram[497] = "0b1";
        ram[498] = "0b0";
        ram[499] = "0b0";
        for (unsigned i = 500; i < 511 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_eOg) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_eOg_ram* meminst;


SC_CTOR(predict_ensemble_eOg) {
meminst = new predict_ensemble_eOg_ram("predict_ensemble_eOg_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_eOg() {
    delete meminst;
}


};//endmodule
#endif
