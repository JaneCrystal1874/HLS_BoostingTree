// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_vdy_H__
#define __predict_ensemble_vdy_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_vdy_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_vdy_ram) {
        for (unsigned i = 0; i < 10 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[10] = "0b1";
        ram[11] = "0b0";
        ram[12] = "0b0";
        ram[13] = "0b0";
        ram[14] = "0b0";
        ram[15] = "0b1";
        ram[16] = "0b1";
        ram[17] = "0b0";
        for (unsigned i = 18; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[31] = "0b0";
        ram[32] = "0b0";
        ram[33] = "0b0";
        ram[34] = "0b1";
        ram[35] = "0b0";
        ram[36] = "0b0";
        ram[37] = "0b0";
        ram[38] = "0b0";
        ram[39] = "0b1";
        for (unsigned i = 40; i < 45 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[45] = "0b1";
        ram[46] = "0b1";
        ram[47] = "0b0";
        ram[48] = "0b1";
        ram[49] = "0b1";
        ram[50] = "0b0";
        ram[51] = "0b1";
        ram[52] = "0b1";
        ram[53] = "0b0";
        ram[54] = "0b0";
        for (unsigned i = 55; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 68 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[68] = "0b1";
        for (unsigned i = 69; i < 78 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[78] = "0b1";
        ram[79] = "0b1";
        ram[80] = "0b0";
        ram[81] = "0b0";
        for (unsigned i = 82; i < 95 ; i = i + 1) {
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
        ram[107] = "0b0";
        ram[108] = "0b0";
        ram[109] = "0b1";
        ram[110] = "0b1";
        ram[111] = "0b0";
        ram[112] = "0b0";
        ram[113] = "0b0";
        ram[114] = "0b1";
        ram[115] = "0b0";
        ram[116] = "0b0";
        for (unsigned i = 117; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 137 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[137] = "0b1";
        ram[138] = "0b1";
        ram[139] = "0b0";
        ram[140] = "0b1";
        ram[141] = "0b1";
        ram[142] = "0b0";
        ram[143] = "0b0";
        ram[144] = "0b0";
        ram[145] = "0b0";
        ram[146] = "0b1";
        ram[147] = "0b1";
        ram[148] = "0b1";
        ram[149] = "0b1";
        ram[150] = "0b0";
        for (unsigned i = 151; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 159; i < 169 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[169] = "0b1";
        ram[170] = "0b0";
        ram[171] = "0b1";
        ram[172] = "0b0";
        ram[173] = "0b0";
        ram[174] = "0b0";
        ram[175] = "0b1";
        ram[176] = "0b0";
        for (unsigned i = 177; i < 185 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[185] = "0b0";
        for (unsigned i = 186; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 203 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[203] = "0b1";
        ram[204] = "0b0";
        ram[205] = "0b1";
        ram[206] = "0b0";
        ram[207] = "0b1";
        ram[208] = "0b0";
        for (unsigned i = 209; i < 217 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[217] = "0b0";
        for (unsigned i = 218; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 223; i < 228 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[228] = "0b1";
        ram[229] = "0b0";
        ram[230] = "0b0";
        ram[231] = "0b0";
        ram[232] = "0b0";
        ram[233] = "0b1";
        ram[234] = "0b1";
        ram[235] = "0b0";
        ram[236] = "0b0";
        ram[237] = "0b0";
        for (unsigned i = 238; i < 245 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[245] = "0b0";
        ram[246] = "0b1";
        ram[247] = "0b0";
        ram[248] = "0b1";
        ram[249] = "0b0";
        ram[250] = "0b0";
        ram[251] = "0b1";
        ram[252] = "0b1";
        ram[253] = "0b1";
        ram[254] = "0b1";
        for (unsigned i = 255; i < 265 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[265] = "0b1";
        for (unsigned i = 266; i < 272 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 272; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 294 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[294] = "0b1";
        ram[295] = "0b0";
        ram[296] = "0b0";
        ram[297] = "0b1";
        for (unsigned i = 298; i < 303 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[303] = "0b1";
        ram[304] = "0b1";
        ram[305] = "0b0";
        ram[306] = "0b0";
        for (unsigned i = 307; i < 319 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[319] = "0b0";
        ram[320] = "0b0";
        ram[321] = "0b0";
        ram[322] = "0b0";
        ram[323] = "0b1";
        for (unsigned i = 324; i < 329 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[329] = "0b1";
        ram[330] = "0b0";
        ram[331] = "0b0";
        ram[332] = "0b0";
        ram[333] = "0b0";
        ram[334] = "0b1";
        ram[335] = "0b1";
        ram[336] = "0b0";
        ram[337] = "0b0";
        ram[338] = "0b1";
        ram[339] = "0b1";
        ram[340] = "0b1";
        ram[341] = "0b1";
        ram[342] = "0b0";
        for (unsigned i = 343; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 351; i < 361 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[361] = "0b1";
        ram[362] = "0b1";
        ram[363] = "0b0";
        ram[364] = "0b0";
        ram[365] = "0b0";
        for (unsigned i = 366; i < 371 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[371] = "0b0";
        ram[372] = "0b1";
        ram[373] = "0b0";
        ram[374] = "0b0";
        for (unsigned i = 375; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[383] = "0b0";
        ram[384] = "0b0";
        ram[385] = "0b0";
        ram[386] = "0b0";
        ram[387] = "0b1";
        ram[388] = "0b1";
        ram[389] = "0b0";
        ram[390] = "0b0";
        ram[391] = "0b1";
        ram[392] = "0b0";
        ram[393] = "0b1";
        ram[394] = "0b0";
        ram[395] = "0b1";
        ram[396] = "0b1";
        ram[397] = "0b0";
        ram[398] = "0b0";
        ram[399] = "0b1";
        ram[400] = "0b0";
        ram[401] = "0b0";
        ram[402] = "0b0";
        ram[403] = "0b1";
        ram[404] = "0b1";
        ram[405] = "0b0";
        ram[406] = "0b0";
        ram[407] = "0b1";
        ram[408] = "0b0";
        for (unsigned i = 409; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 425 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[425] = "0b1";
        ram[426] = "0b0";
        ram[427] = "0b1";
        ram[428] = "0b1";
        ram[429] = "0b1";
        ram[430] = "0b0";
        ram[431] = "0b0";
        ram[432] = "0b0";
        ram[433] = "0b1";
        ram[434] = "0b1";
        ram[435] = "0b0";
        ram[436] = "0b1";
        ram[437] = "0b1";
        ram[438] = "0b0";
        for (unsigned i = 439; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[447] = "0b0";
        ram[448] = "0b0";
        ram[449] = "0b0";
        ram[450] = "0b1";
        ram[451] = "0b0";
        ram[452] = "0b0";
        ram[453] = "0b0";
        ram[454] = "0b1";
        ram[455] = "0b1";
        ram[456] = "0b0";
        ram[457] = "0b0";
        ram[458] = "0b1";
        for (unsigned i = 459; i < 465 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[465] = "0b1";
        ram[466] = "0b0";
        ram[467] = "0b1";
        ram[468] = "0b1";
        ram[469] = "0b0";
        for (unsigned i = 470; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[479] = "0b0";
        ram[480] = "0b0";
        ram[481] = "0b0";
        ram[482] = "0b0";
        ram[483] = "0b1";
        ram[484] = "0b1";
        for (unsigned i = 485; i < 493 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[493] = "0b1";
        ram[494] = "0b1";
        ram[495] = "0b0";
        ram[496] = "0b0";
        ram[497] = "0b0";
        ram[498] = "0b0";
        for (unsigned i = 499; i < 511 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_vdy) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_vdy_ram* meminst;


SC_CTOR(predict_ensemble_vdy) {
meminst = new predict_ensemble_vdy_ram("predict_ensemble_vdy_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_vdy() {
    delete meminst;
}


};//endmodule
#endif
