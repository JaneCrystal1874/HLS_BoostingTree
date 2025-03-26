// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_dEe_H__
#define __predict_ensemble_dEe_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_dEe_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_dEe_ram) {
        for (unsigned i = 0; i < 6 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[6] = "0b1";
        ram[7] = "0b0";
        ram[8] = "0b1";
        ram[9] = "0b1";
        ram[10] = "0b0";
        ram[11] = "0b0";
        ram[12] = "0b1";
        ram[13] = "0b1";
        for (unsigned i = 14; i < 19 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 19; i < 24 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[24] = "0b0";
        for (unsigned i = 25; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 31; i < 40 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[40] = "0b1";
        ram[41] = "0b1";
        ram[42] = "0b1";
        ram[43] = "0b0";
        ram[44] = "0b0";
        ram[45] = "0b0";
        ram[46] = "0b0";
        ram[47] = "0b1";
        ram[48] = "0b1";
        ram[49] = "0b0";
        ram[50] = "0b0";
        ram[51] = "0b1";
        ram[52] = "0b1";
        ram[53] = "0b0";
        for (unsigned i = 54; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 68 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[68] = "0b1";
        ram[69] = "0b0";
        ram[70] = "0b0";
        ram[71] = "0b1";
        ram[72] = "0b0";
        ram[73] = "0b0";
        ram[74] = "0b0";
        ram[75] = "0b1";
        ram[76] = "0b0";
        ram[77] = "0b0";
        ram[78] = "0b1";
        ram[79] = "0b0";
        ram[80] = "0b1";
        ram[81] = "0b0";
        ram[82] = "0b0";
        ram[83] = "0b0";
        for (unsigned i = 84; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 95; i < 104 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[104] = "0b1";
        ram[105] = "0b0";
        ram[106] = "0b0";
        ram[107] = "0b1";
        ram[108] = "0b1";
        ram[109] = "0b0";
        ram[110] = "0b0";
        ram[111] = "0b1";
        ram[112] = "0b1";
        ram[113] = "0b0";
        ram[114] = "0b0";
        for (unsigned i = 115; i < 120 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[120] = "0b0";
        for (unsigned i = 121; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 139 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[139] = "0b1";
        ram[140] = "0b1";
        ram[141] = "0b1";
        ram[142] = "0b0";
        ram[143] = "0b0";
        ram[144] = "0b0";
        for (unsigned i = 145; i < 152 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[152] = "0b0";
        for (unsigned i = 153; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 159; i < 168 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[168] = "0b1";
        ram[169] = "0b0";
        ram[170] = "0b1";
        ram[171] = "0b0";
        ram[172] = "0b1";
        ram[173] = "0b1";
        ram[174] = "0b0";
        ram[175] = "0b0";
        for (unsigned i = 176; i < 182 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[182] = "0b0";
        ram[183] = "0b1";
        ram[184] = "0b0";
        ram[185] = "0b0";
        for (unsigned i = 186; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 200 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[200] = "0b1";
        for (unsigned i = 201; i < 207 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 207; i < 214 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[214] = "0b0";
        for (unsigned i = 215; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[223] = "0b0";
        ram[224] = "0b0";
        ram[225] = "0b1";
        for (unsigned i = 226; i < 231 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[231] = "0b1";
        ram[232] = "0b0";
        ram[233] = "0b0";
        ram[234] = "0b1";
        ram[235] = "0b1";
        ram[236] = "0b1";
        for (unsigned i = 237; i < 243 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[243] = "0b1";
        ram[244] = "0b0";
        for (unsigned i = 245; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 255; i < 267 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[267] = "0b1";
        ram[268] = "0b1";
        ram[269] = "0b0";
        ram[270] = "0b0";
        ram[271] = "0b0";
        for (unsigned i = 272; i < 278 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[278] = "0b0";
        for (unsigned i = 279; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 292 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[292] = "0b1";
        ram[293] = "0b0";
        ram[294] = "0b0";
        ram[295] = "0b0";
        ram[296] = "0b1";
        ram[297] = "0b1";
        ram[298] = "0b1";
        ram[299] = "0b1";
        ram[300] = "0b0";
        ram[301] = "0b0";
        ram[302] = "0b0";
        ram[303] = "0b1";
        ram[304] = "0b0";
        ram[305] = "0b1";
        ram[306] = "0b1";
        ram[307] = "0b1";
        ram[308] = "0b1";
        ram[309] = "0b0";
        ram[310] = "0b0";
        ram[311] = "0b0";
        ram[312] = "0b1";
        ram[313] = "0b1";
        ram[314] = "0b0";
        ram[315] = "0b1";
        ram[316] = "0b1";
        ram[317] = "0b1";
        ram[318] = "0b1";
        for (unsigned i = 319; i < 324 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[324] = "0b1";
        ram[325] = "0b1";
        for (unsigned i = 326; i < 333 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[333] = "0b1";
        ram[334] = "0b0";
        ram[335] = "0b0";
        ram[336] = "0b0";
        ram[337] = "0b1";
        ram[338] = "0b0";
        for (unsigned i = 339; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 351; i < 356 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[356] = "0b1";
        ram[357] = "0b1";
        ram[358] = "0b0";
        ram[359] = "0b0";
        ram[360] = "0b1";
        ram[361] = "0b0";
        ram[362] = "0b0";
        ram[363] = "0b0";
        ram[364] = "0b1";
        ram[365] = "0b1";
        ram[366] = "0b0";
        ram[367] = "0b1";
        for (unsigned i = 368; i < 373 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 373; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[383] = "0b0";
        ram[384] = "0b0";
        ram[385] = "0b1";
        ram[386] = "0b0";
        ram[387] = "0b0";
        ram[388] = "0b0";
        ram[389] = "0b0";
        ram[390] = "0b1";
        ram[391] = "0b1";
        for (unsigned i = 392; i < 399 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[399] = "0b1";
        ram[400] = "0b0";
        ram[401] = "0b1";
        ram[402] = "0b0";
        ram[403] = "0b0";
        for (unsigned i = 404; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 421 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[421] = "0b1";
        ram[422] = "0b0";
        ram[423] = "0b0";
        ram[424] = "0b1";
        ram[425] = "0b1";
        ram[426] = "0b1";
        ram[427] = "0b0";
        ram[428] = "0b0";
        ram[429] = "0b0";
        ram[430] = "0b0";
        ram[431] = "0b1";
        ram[432] = "0b0";
        ram[433] = "0b0";
        ram[434] = "0b0";
        for (unsigned i = 435; i < 440 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[440] = "0b0";
        for (unsigned i = 441; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 447; i < 456 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[456] = "0b1";
        ram[457] = "0b1";
        ram[458] = "0b1";
        ram[459] = "0b0";
        ram[460] = "0b0";
        ram[461] = "0b1";
        ram[462] = "0b0";
        ram[463] = "0b1";
        ram[464] = "0b1";
        ram[465] = "0b0";
        ram[466] = "0b0";
        ram[467] = "0b1";
        ram[468] = "0b0";
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
        ram[485] = "0b1";
        ram[486] = "0b0";
        ram[487] = "0b1";
        ram[488] = "0b0";
        ram[489] = "0b0";
        ram[490] = "0b0";
        ram[491] = "0b1";
        ram[492] = "0b1";
        ram[493] = "0b1";
        ram[494] = "0b0";
        ram[495] = "0b1";
        ram[496] = "0b0";
        ram[497] = "0b0";
        ram[498] = "0b0";
        ram[499] = "0b0";
        ram[500] = "0b1";
        ram[501] = "0b0";
        ram[502] = "0b0";
        ram[503] = "0b1";
        ram[504] = "0b1";
        ram[505] = "0b1";
        ram[506] = "0b1";
        ram[507] = "0b0";
        ram[508] = "0b1";
        ram[509] = "0b1";
        ram[510] = "0b1";
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


SC_MODULE(predict_ensemble_dEe) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_dEe_ram* meminst;


SC_CTOR(predict_ensemble_dEe) {
meminst = new predict_ensemble_dEe_ram("predict_ensemble_dEe_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_dEe() {
    delete meminst;
}


};//endmodule
#endif
