// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_wdI_H__
#define __predict_ensemble_wdI_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_wdI_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_wdI_ram) {
        for (unsigned i = 0; i < 5 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[5] = "0b1";
        ram[6] = "0b0";
        ram[7] = "0b0";
        ram[8] = "0b0";
        ram[9] = "0b1";
        ram[10] = "0b1";
        ram[11] = "0b0";
        ram[12] = "0b0";
        ram[13] = "0b0";
        ram[14] = "0b0";
        ram[15] = "0b1";
        ram[16] = "0b1";
        ram[17] = "0b0";
        ram[18] = "0b0";
        ram[19] = "0b1";
        ram[20] = "0b0";
        for (unsigned i = 21; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[31] = "0b0";
        ram[32] = "0b0";
        ram[33] = "0b1";
        ram[34] = "0b0";
        ram[35] = "0b0";
        ram[36] = "0b0";
        ram[37] = "0b0";
        ram[38] = "0b1";
        ram[39] = "0b1";
        ram[40] = "0b0";
        ram[41] = "0b0";
        ram[42] = "0b0";
        ram[43] = "0b0";
        ram[44] = "0b1";
        ram[45] = "0b0";
        ram[46] = "0b0";
        ram[47] = "0b1";
        ram[48] = "0b1";
        ram[49] = "0b0";
        ram[50] = "0b0";
        ram[51] = "0b0";
        ram[52] = "0b0";
        for (unsigned i = 53; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 63; i < 68 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[68] = "0b1";
        ram[69] = "0b1";
        ram[70] = "0b0";
        ram[71] = "0b0";
        ram[72] = "0b0";
        ram[73] = "0b1";
        for (unsigned i = 74; i < 81 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[81] = "0b1";
        ram[82] = "0b1";
        ram[83] = "0b1";
        ram[84] = "0b1";
        ram[85] = "0b0";
        for (unsigned i = 86; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[95] = "0b0";
        ram[96] = "0b0";
        ram[97] = "0b0";
        ram[98] = "0b0";
        ram[99] = "0b1";
        ram[100] = "0b1";
        ram[101] = "0b1";
        for (unsigned i = 102; i < 113 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[113] = "0b1";
        ram[114] = "0b1";
        ram[115] = "0b1";
        ram[116] = "0b0";
        for (unsigned i = 117; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 136 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 136; i < 141 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[141] = "0b0";
        ram[142] = "0b0";
        ram[143] = "0b0";
        ram[144] = "0b1";
        ram[145] = "0b0";
        ram[146] = "0b0";
        ram[147] = "0b0";
        ram[148] = "0b0";
        for (unsigned i = 149; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[159] = "0b0";
        ram[160] = "0b0";
        ram[161] = "0b0";
        ram[162] = "0b0";
        ram[163] = "0b1";
        ram[164] = "0b1";
        for (unsigned i = 165; i < 172 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[172] = "0b1";
        ram[173] = "0b1";
        ram[174] = "0b1";
        ram[175] = "0b0";
        ram[176] = "0b1";
        ram[177] = "0b0";
        ram[178] = "0b0";
        ram[179] = "0b1";
        ram[180] = "0b1";
        ram[181] = "0b0";
        ram[182] = "0b1";
        ram[183] = "0b1";
        ram[184] = "0b1";
        ram[185] = "0b1";
        ram[186] = "0b0";
        ram[187] = "0b1";
        ram[188] = "0b1";
        ram[189] = "0b1";
        ram[190] = "0b1";
        ram[191] = "0b0";
        ram[192] = "0b0";
        ram[193] = "0b0";
        ram[194] = "0b1";
        ram[195] = "0b0";
        ram[196] = "0b0";
        ram[197] = "0b0";
        ram[198] = "0b0";
        ram[199] = "0b1";
        ram[200] = "0b0";
        ram[201] = "0b0";
        ram[202] = "0b1";
        ram[203] = "0b0";
        ram[204] = "0b0";
        ram[205] = "0b1";
        ram[206] = "0b0";
        ram[207] = "0b1";
        ram[208] = "0b1";
        ram[209] = "0b1";
        ram[210] = "0b1";
        ram[211] = "0b0";
        ram[212] = "0b0";
        ram[213] = "0b0";
        ram[214] = "0b0";
        for (unsigned i = 215; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[223] = "0b0";
        ram[224] = "0b0";
        ram[225] = "0b0";
        ram[226] = "0b0";
        ram[227] = "0b1";
        ram[228] = "0b0";
        ram[229] = "0b0";
        ram[230] = "0b0";
        ram[231] = "0b1";
        ram[232] = "0b0";
        ram[233] = "0b0";
        ram[234] = "0b0";
        ram[235] = "0b0";
        ram[236] = "0b1";
        ram[237] = "0b1";
        ram[238] = "0b1";
        ram[239] = "0b0";
        ram[240] = "0b1";
        ram[241] = "0b0";
        ram[242] = "0b0";
        ram[243] = "0b1";
        ram[244] = "0b1";
        ram[245] = "0b0";
        ram[246] = "0b1";
        ram[247] = "0b1";
        ram[248] = "0b0";
        for (unsigned i = 249; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 255; i < 261 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[261] = "0b1";
        ram[262] = "0b0";
        ram[263] = "0b0";
        ram[264] = "0b0";
        ram[265] = "0b1";
        ram[266] = "0b0";
        ram[267] = "0b1";
        ram[268] = "0b0";
        ram[269] = "0b0";
        ram[270] = "0b1";
        ram[271] = "0b1";
        ram[272] = "0b0";
        ram[273] = "0b1";
        ram[274] = "0b1";
        ram[275] = "0b0";
        ram[276] = "0b0";
        ram[277] = "0b1";
        ram[278] = "0b0";
        for (unsigned i = 279; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 295 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[295] = "0b1";
        ram[296] = "0b0";
        ram[297] = "0b0";
        ram[298] = "0b1";
        ram[299] = "0b0";
        ram[300] = "0b0";
        ram[301] = "0b1";
        ram[302] = "0b0";
        for (unsigned i = 303; i < 310 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[310] = "0b0";
        ram[311] = "0b0";
        ram[312] = "0b0";
        for (unsigned i = 313; i < 319 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 319; i < 328 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[328] = "0b1";
        ram[329] = "0b0";
        ram[330] = "0b0";
        ram[331] = "0b1";
        ram[332] = "0b1";
        ram[333] = "0b1";
        ram[334] = "0b0";
        ram[335] = "0b0";
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
        ram[351] = "0b0";
        ram[352] = "0b0";
        ram[353] = "0b0";
        ram[354] = "0b1";
        ram[355] = "0b0";
        ram[356] = "0b0";
        ram[357] = "0b0";
        ram[358] = "0b0";
        ram[359] = "0b1";
        ram[360] = "0b1";
        for (unsigned i = 361; i < 366 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[366] = "0b1";
        ram[367] = "0b1";
        ram[368] = "0b0";
        ram[369] = "0b0";
        ram[370] = "0b0";
        ram[371] = "0b0";
        for (unsigned i = 372; i < 383 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[383] = "0b0";
        ram[384] = "0b0";
        ram[385] = "0b1";
        for (unsigned i = 386; i < 391 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[391] = "0b1";
        ram[392] = "0b0";
        ram[393] = "0b0";
        ram[394] = "0b1";
        ram[395] = "0b1";
        ram[396] = "0b1";
        ram[397] = "0b0";
        ram[398] = "0b0";
        ram[399] = "0b0";
        ram[400] = "0b1";
        ram[401] = "0b0";
        ram[402] = "0b0";
        ram[403] = "0b0";
        ram[404] = "0b0";
        for (unsigned i = 405; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 420 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[420] = "0b1";
        ram[421] = "0b0";
        ram[422] = "0b0";
        ram[423] = "0b0";
        ram[424] = "0b0";
        ram[425] = "0b1";
        ram[426] = "0b1";
        ram[427] = "0b1";
        ram[428] = "0b0";
        ram[429] = "0b0";
        ram[430] = "0b0";
        ram[431] = "0b1";
        ram[432] = "0b1";
        ram[433] = "0b1";
        ram[434] = "0b0";
        ram[435] = "0b0";
        ram[436] = "0b1";
        ram[437] = "0b1";
        ram[438] = "0b1";
        ram[439] = "0b1";
        ram[440] = "0b0";
        ram[441] = "0b1";
        ram[442] = "0b1";
        ram[443] = "0b1";
        ram[444] = "0b0";
        ram[445] = "0b1";
        ram[446] = "0b1";
        for (unsigned i = 447; i < 456 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[456] = "0b1";
        ram[457] = "0b0";
        ram[458] = "0b1";
        ram[459] = "0b0";
        ram[460] = "0b1";
        ram[461] = "0b1";
        ram[462] = "0b0";
        ram[463] = "0b1";
        ram[464] = "0b0";
        ram[465] = "0b1";
        ram[466] = "0b1";
        ram[467] = "0b0";
        ram[468] = "0b1";
        ram[469] = "0b0";
        ram[470] = "0b0";
        for (unsigned i = 471; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 479; i < 485 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[485] = "0b1";
        for (unsigned i = 486; i < 493 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 493; i < 500 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[500] = "0b0";
        ram[501] = "0b0";
        ram[502] = "0b0";
        for (unsigned i = 503; i < 511 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_wdI) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_wdI_ram* meminst;


SC_CTOR(predict_ensemble_wdI) {
meminst = new predict_ensemble_wdI_ram("predict_ensemble_wdI_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_wdI() {
    delete meminst;
}


};//endmodule
#endif
