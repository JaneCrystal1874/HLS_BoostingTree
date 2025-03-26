// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_yd2_H__
#define __predict_ensemble_yd2_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_yd2_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_yd2_ram) {
        for (unsigned i = 0; i < 5 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[5] = "0b1";
        ram[6] = "0b0";
        ram[7] = "0b0";
        ram[8] = "0b1";
        ram[9] = "0b0";
        ram[10] = "0b0";
        ram[11] = "0b0";
        ram[12] = "0b1";
        ram[13] = "0b1";
        ram[14] = "0b0";
        ram[15] = "0b1";
        ram[16] = "0b1";
        ram[17] = "0b0";
        ram[18] = "0b1";
        ram[19] = "0b0";
        ram[20] = "0b1";
        ram[21] = "0b0";
        ram[22] = "0b0";
        for (unsigned i = 23; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[31] = "0b0";
        ram[32] = "0b0";
        ram[33] = "0b0";
        ram[34] = "0b1";
        ram[35] = "0b0";
        ram[36] = "0b0";
        ram[37] = "0b0";
        ram[38] = "0b1";
        ram[39] = "0b1";
        ram[40] = "0b0";
        ram[41] = "0b0";
        ram[42] = "0b1";
        ram[43] = "0b1";
        ram[44] = "0b0";
        ram[45] = "0b0";
        ram[46] = "0b1";
        ram[47] = "0b0";
        ram[48] = "0b0";
        ram[49] = "0b1";
        ram[50] = "0b1";
        ram[51] = "0b0";
        ram[52] = "0b0";
        ram[53] = "0b0";
        ram[54] = "0b0";
        for (unsigned i = 55; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 73 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[73] = "0b1";
        ram[74] = "0b0";
        ram[75] = "0b0";
        ram[76] = "0b0";
        ram[77] = "0b1";
        ram[78] = "0b0";
        for (unsigned i = 79; i < 85 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[85] = "0b0";
        ram[86] = "0b1";
        ram[87] = "0b1";
        ram[88] = "0b0";
        for (unsigned i = 89; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 95; i < 100 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[100] = "0b1";
        for (unsigned i = 101; i < 106 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[106] = "0b1";
        ram[107] = "0b1";
        ram[108] = "0b0";
        ram[109] = "0b0";
        ram[110] = "0b0";
        ram[111] = "0b1";
        ram[112] = "0b0";
        ram[113] = "0b1";
        ram[114] = "0b1";
        ram[115] = "0b1";
        ram[116] = "0b0";
        ram[117] = "0b1";
        ram[118] = "0b1";
        ram[119] = "0b1";
        ram[120] = "0b0";
        for (unsigned i = 121; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 138 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[138] = "0b1";
        ram[139] = "0b1";
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
        ram[159] = "0b0";
        ram[160] = "0b0";
        ram[161] = "0b0";
        ram[162] = "0b1";
        for (unsigned i = 163; i < 170 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[170] = "0b1";
        ram[171] = "0b1";
        ram[172] = "0b1";
        ram[173] = "0b0";
        ram[174] = "0b0";
        ram[175] = "0b1";
        ram[176] = "0b0";
        ram[177] = "0b1";
        ram[178] = "0b1";
        ram[179] = "0b0";
        ram[180] = "0b0";
        ram[181] = "0b1";
        ram[182] = "0b1";
        ram[183] = "0b1";
        ram[184] = "0b0";
        for (unsigned i = 185; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 196 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[196] = "0b1";
        ram[197] = "0b1";
        for (unsigned i = 198; i < 203 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[203] = "0b1";
        ram[204] = "0b1";
        ram[205] = "0b0";
        ram[206] = "0b0";
        ram[207] = "0b0";
        ram[208] = "0b0";
        for (unsigned i = 209; i < 215 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[215] = "0b0";
        ram[216] = "0b0";
        for (unsigned i = 217; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 223; i < 229 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[229] = "0b1";
        for (unsigned i = 230; i < 238 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[238] = "0b1";
        ram[239] = "0b1";
        ram[240] = "0b0";
        for (unsigned i = 241; i < 248 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[248] = "0b0";
        for (unsigned i = 249; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 255; i < 260 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[260] = "0b1";
        ram[261] = "0b1";
        ram[262] = "0b0";
        ram[263] = "0b0";
        ram[264] = "0b1";
        ram[265] = "0b0";
        ram[266] = "0b1";
        ram[267] = "0b0";
        ram[268] = "0b0";
        ram[269] = "0b0";
        ram[270] = "0b1";
        ram[271] = "0b0";
        ram[272] = "0b0";
        ram[273] = "0b1";
        ram[274] = "0b0";
        ram[275] = "0b1";
        ram[276] = "0b1";
        ram[277] = "0b0";
        ram[278] = "0b0";
        for (unsigned i = 279; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 293 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[293] = "0b1";
        ram[294] = "0b0";
        ram[295] = "0b0";
        ram[296] = "0b1";
        ram[297] = "0b1";
        ram[298] = "0b1";
        ram[299] = "0b0";
        ram[300] = "0b0";
        ram[301] = "0b0";
        ram[302] = "0b1";
        ram[303] = "0b0";
        ram[304] = "0b0";
        ram[305] = "0b0";
        ram[306] = "0b0";
        for (unsigned i = 307; i < 315 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[315] = "0b0";
        ram[316] = "0b1";
        ram[317] = "0b1";
        ram[318] = "0b1";
        for (unsigned i = 319; i < 324 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[324] = "0b1";
        ram[325] = "0b0";
        ram[326] = "0b0";
        ram[327] = "0b1";
        ram[328] = "0b0";
        ram[329] = "0b1";
        ram[330] = "0b1";
        for (unsigned i = 331; i < 336 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[336] = "0b1";
        ram[337] = "0b0";
        ram[338] = "0b0";
        for (unsigned i = 339; i < 348 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[348] = "0b0";
        ram[349] = "0b1";
        ram[350] = "0b1";
        for (unsigned i = 351; i < 356 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[356] = "0b1";
        ram[357] = "0b1";
        for (unsigned i = 358; i < 365 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[365] = "0b1";
        ram[366] = "0b0";
        ram[367] = "0b1";
        ram[368] = "0b0";
        ram[369] = "0b1";
        ram[370] = "0b0";
        ram[371] = "0b0";
        for (unsigned i = 372; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 383; i < 392 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[392] = "0b1";
        ram[393] = "0b0";
        ram[394] = "0b1";
        ram[395] = "0b0";
        ram[396] = "0b0";
        ram[397] = "0b1";
        ram[398] = "0b0";
        ram[399] = "0b1";
        ram[400] = "0b1";
        ram[401] = "0b1";
        ram[402] = "0b0";
        ram[403] = "0b1";
        ram[404] = "0b1";
        ram[405] = "0b1";
        ram[406] = "0b0";
        ram[407] = "0b1";
        ram[408] = "0b0";
        for (unsigned i = 409; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[415] = "0b0";
        ram[416] = "0b0";
        ram[417] = "0b0";
        ram[418] = "0b0";
        ram[419] = "0b1";
        ram[420] = "0b0";
        ram[421] = "0b1";
        ram[422] = "0b0";
        ram[423] = "0b0";
        ram[424] = "0b1";
        ram[425] = "0b0";
        ram[426] = "0b0";
        ram[427] = "0b1";
        for (unsigned i = 428; i < 433 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 433; i < 438 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[438] = "0b0";
        ram[439] = "0b1";
        ram[440] = "0b1";
        ram[441] = "0b0";
        for (unsigned i = 442; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 447; i < 452 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[452] = "0b1";
        ram[453] = "0b1";
        for (unsigned i = 454; i < 464 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[464] = "0b1";
        ram[465] = "0b1";
        ram[466] = "0b0";
        for (unsigned i = 467; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[479] = "0b0";
        ram[480] = "0b0";
        ram[481] = "0b0";
        ram[482] = "0b0";
        ram[483] = "0b1";
        ram[484] = "0b1";
        ram[485] = "0b0";
        ram[486] = "0b0";
        ram[487] = "0b0";
        ram[488] = "0b1";
        ram[489] = "0b1";
        ram[490] = "0b0";
        ram[491] = "0b1";
        ram[492] = "0b1";
        ram[493] = "0b1";
        ram[494] = "0b0";
        ram[495] = "0b0";
        ram[496] = "0b0";
        ram[497] = "0b1";
        ram[498] = "0b1";
        ram[499] = "0b1";
        ram[500] = "0b0";
        ram[501] = "0b1";
        ram[502] = "0b0";
        ram[503] = "0b0";
        ram[504] = "0b0";
        ram[505] = "0b1";
        ram[506] = "0b1";
        ram[507] = "0b1";
        ram[508] = "0b0";
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


SC_MODULE(predict_ensemble_yd2) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_yd2_ram* meminst;


SC_CTOR(predict_ensemble_yd2) {
meminst = new predict_ensemble_yd2_ram("predict_ensemble_yd2_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_yd2() {
    delete meminst;
}


};//endmodule
#endif
