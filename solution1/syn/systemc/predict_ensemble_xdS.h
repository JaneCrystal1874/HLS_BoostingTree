// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_xdS_H__
#define __predict_ensemble_xdS_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_xdS_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_xdS_ram) {
        ram[0] = "0b0";
        ram[1] = "0b0";
        ram[2] = "0b0";
        ram[3] = "0b1";
        ram[4] = "0b1";
        ram[5] = "0b0";
        ram[6] = "0b1";
        ram[7] = "0b0";
        ram[8] = "0b0";
        ram[9] = "0b0";
        ram[10] = "0b0";
        ram[11] = "0b1";
        ram[12] = "0b0";
        ram[13] = "0b0";
        ram[14] = "0b0";
        ram[15] = "0b0";
        ram[16] = "0b1";
        ram[17] = "0b0";
        ram[18] = "0b0";
        for (unsigned i = 19; i < 28 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[28] = "0b0";
        ram[29] = "0b1";
        ram[30] = "0b1";
        for (unsigned i = 31; i < 40 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[40] = "0b1";
        ram[41] = "0b0";
        ram[42] = "0b0";
        ram[43] = "0b0";
        ram[44] = "0b1";
        ram[45] = "0b0";
        ram[46] = "0b0";
        ram[47] = "0b1";
        ram[48] = "0b0";
        for (unsigned i = 49; i < 56 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[56] = "0b0";
        for (unsigned i = 57; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 68 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[68] = "0b1";
        ram[69] = "0b0";
        ram[70] = "0b0";
        ram[71] = "0b0";
        ram[72] = "0b0";
        ram[73] = "0b1";
        ram[74] = "0b0";
        ram[75] = "0b1";
        ram[76] = "0b1";
        ram[77] = "0b0";
        ram[78] = "0b1";
        ram[79] = "0b1";
        ram[80] = "0b0";
        ram[81] = "0b1";
        ram[82] = "0b1";
        ram[83] = "0b0";
        ram[84] = "0b0";
        ram[85] = "0b1";
        ram[86] = "0b0";
        ram[87] = "0b0";
        for (unsigned i = 88; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 95; i < 101 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[101] = "0b1";
        ram[102] = "0b1";
        ram[103] = "0b0";
        ram[104] = "0b0";
        ram[105] = "0b0";
        ram[106] = "0b1";
        ram[107] = "0b0";
        ram[108] = "0b0";
        ram[109] = "0b1";
        ram[110] = "0b1";
        ram[111] = "0b0";
        ram[112] = "0b1";
        ram[113] = "0b0";
        ram[114] = "0b0";
        ram[115] = "0b0";
        ram[116] = "0b1";
        ram[117] = "0b1";
        ram[118] = "0b1";
        ram[119] = "0b0";
        for (unsigned i = 120; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 137 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[137] = "0b1";
        ram[138] = "0b0";
        ram[139] = "0b0";
        ram[140] = "0b1";
        ram[141] = "0b0";
        for (unsigned i = 142; i < 147 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[147] = "0b0";
        ram[148] = "0b0";
        ram[149] = "0b1";
        ram[150] = "0b1";
        ram[151] = "0b1";
        ram[152] = "0b0";
        for (unsigned i = 153; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 159; i < 165 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[165] = "0b1";
        for (unsigned i = 166; i < 171 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[171] = "0b1";
        ram[172] = "0b0";
        ram[173] = "0b1";
        ram[174] = "0b0";
        ram[175] = "0b0";
        ram[176] = "0b0";
        ram[177] = "0b1";
        ram[178] = "0b1";
        ram[179] = "0b0";
        for (unsigned i = 180; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 200 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[200] = "0b1";
        ram[201] = "0b1";
        ram[202] = "0b0";
        ram[203] = "0b0";
        ram[204] = "0b1";
        ram[205] = "0b1";
        ram[206] = "0b0";
        ram[207] = "0b1";
        ram[208] = "0b0";
        ram[209] = "0b1";
        ram[210] = "0b1";
        ram[211] = "0b0";
        ram[212] = "0b1";
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
        ram[232] = "0b0";
        ram[233] = "0b0";
        ram[234] = "0b1";
        ram[235] = "0b0";
        ram[236] = "0b0";
        ram[237] = "0b1";
        ram[238] = "0b1";
        ram[239] = "0b1";
        ram[240] = "0b0";
        ram[241] = "0b0";
        ram[242] = "0b1";
        ram[243] = "0b0";
        ram[244] = "0b0";
        for (unsigned i = 245; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[255] = "0b0";
        ram[256] = "0b0";
        ram[257] = "0b0";
        ram[258] = "0b1";
        for (unsigned i = 259; i < 264 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[264] = "0b1";
        ram[265] = "0b0";
        ram[266] = "0b1";
        ram[267] = "0b1";
        ram[268] = "0b0";
        ram[269] = "0b0";
        ram[270] = "0b1";
        ram[271] = "0b1";
        ram[272] = "0b1";
        ram[273] = "0b0";
        ram[274] = "0b0";
        ram[275] = "0b0";
        ram[276] = "0b0";
        ram[277] = "0b1";
        ram[278] = "0b1";
        ram[279] = "0b1";
        ram[280] = "0b0";
        for (unsigned i = 281; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 296 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[296] = "0b1";
        ram[297] = "0b1";
        ram[298] = "0b1";
        ram[299] = "0b0";
        ram[300] = "0b0";
        ram[301] = "0b0";
        ram[302] = "0b0";
        ram[303] = "0b1";
        ram[304] = "0b1";
        ram[305] = "0b0";
        ram[306] = "0b0";
        ram[307] = "0b1";
        ram[308] = "0b1";
        ram[309] = "0b1";
        ram[310] = "0b1";
        ram[311] = "0b0";
        for (unsigned i = 312; i < 319 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[319] = "0b0";
        ram[320] = "0b0";
        ram[321] = "0b0";
        ram[322] = "0b1";
        ram[323] = "0b0";
        ram[324] = "0b0";
        ram[325] = "0b0";
        ram[326] = "0b0";
        ram[327] = "0b1";
        ram[328] = "0b0";
        ram[329] = "0b0";
        ram[330] = "0b0";
        ram[331] = "0b1";
        ram[332] = "0b0";
        ram[333] = "0b0";
        ram[334] = "0b0";
        ram[335] = "0b0";
        ram[336] = "0b1";
        ram[337] = "0b1";
        ram[338] = "0b0";
        for (unsigned i = 339; i < 345 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[345] = "0b0";
        for (unsigned i = 346; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 351; i < 356 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[356] = "0b1";
        ram[357] = "0b0";
        ram[358] = "0b0";
        ram[359] = "0b0";
        ram[360] = "0b1";
        ram[361] = "0b0";
        ram[362] = "0b0";
        ram[363] = "0b1";
        ram[364] = "0b0";
        ram[365] = "0b0";
        ram[366] = "0b1";
        ram[367] = "0b0";
        ram[368] = "0b1";
        ram[369] = "0b0";
        ram[370] = "0b1";
        ram[371] = "0b0";
        ram[372] = "0b0";
        for (unsigned i = 373; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 383; i < 389 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[389] = "0b1";
        ram[390] = "0b0";
        ram[391] = "0b0";
        ram[392] = "0b0";
        ram[393] = "0b1";
        ram[394] = "0b0";
        ram[395] = "0b1";
        ram[396] = "0b0";
        ram[397] = "0b1";
        ram[398] = "0b0";
        ram[399] = "0b0";
        ram[400] = "0b0";
        ram[401] = "0b0";
        ram[402] = "0b1";
        ram[403] = "0b0";
        for (unsigned i = 404; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 426 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[426] = "0b1";
        ram[427] = "0b0";
        ram[428] = "0b0";
        ram[429] = "0b1";
        ram[430] = "0b0";
        ram[431] = "0b1";
        ram[432] = "0b1";
        ram[433] = "0b0";
        for (unsigned i = 434; i < 442 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[442] = "0b0";
        ram[443] = "0b1";
        ram[444] = "0b1";
        ram[445] = "0b1";
        ram[446] = "0b1";
        for (unsigned i = 447; i < 452 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[452] = "0b1";
        ram[453] = "0b0";
        ram[454] = "0b0";
        ram[455] = "0b0";
        ram[456] = "0b0";
        ram[457] = "0b1";
        ram[458] = "0b1";
        ram[459] = "0b0";
        ram[460] = "0b0";
        ram[461] = "0b0";
        ram[462] = "0b1";
        ram[463] = "0b0";
        ram[464] = "0b1";
        ram[465] = "0b1";
        ram[466] = "0b0";
        ram[467] = "0b0";
        ram[468] = "0b0";
        for (unsigned i = 469; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[479] = "0b0";
        ram[480] = "0b0";
        ram[481] = "0b0";
        ram[482] = "0b0";
        ram[483] = "0b1";
        ram[484] = "0b0";
        ram[485] = "0b0";
        ram[486] = "0b0";
        ram[487] = "0b0";
        ram[488] = "0b1";
        ram[489] = "0b0";
        ram[490] = "0b0";
        ram[491] = "0b0";
        ram[492] = "0b0";
        ram[493] = "0b1";
        ram[494] = "0b1";
        ram[495] = "0b0";
        ram[496] = "0b0";
        ram[497] = "0b0";
        ram[498] = "0b1";
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


SC_MODULE(predict_ensemble_xdS) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_xdS_ram* meminst;


SC_CTOR(predict_ensemble_xdS) {
meminst = new predict_ensemble_xdS_ram("predict_ensemble_xdS_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_xdS() {
    delete meminst;
}


};//endmodule
#endif
