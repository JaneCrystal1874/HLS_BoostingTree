// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_bkb_H__
#define __predict_ensemble_bkb_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_bkb_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_bkb_ram) {
        for (unsigned i = 0; i < 9 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[9] = "0b1";
        ram[10] = "0b1";
        ram[11] = "0b0";
        ram[12] = "0b0";
        ram[13] = "0b1";
        ram[14] = "0b0";
        ram[15] = "0b0";
        ram[16] = "0b1";
        ram[17] = "0b0";
        ram[18] = "0b0";
        for (unsigned i = 19; i < 31 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[31] = "0b0";
        ram[32] = "0b0";
        ram[33] = "0b1";
        ram[34] = "0b0";
        ram[35] = "0b0";
        ram[36] = "0b0";
        ram[37] = "0b1";
        ram[38] = "0b1";
        ram[39] = "0b0";
        ram[40] = "0b0";
        ram[41] = "0b1";
        ram[42] = "0b1";
        ram[43] = "0b0";
        ram[44] = "0b1";
        ram[45] = "0b0";
        ram[46] = "0b1";
        ram[47] = "0b1";
        ram[48] = "0b0";
        ram[49] = "0b0";
        ram[50] = "0b1";
        ram[51] = "0b0";
        ram[52] = "0b0";
        ram[53] = "0b0";
        ram[54] = "0b1";
        ram[55] = "0b0";
        ram[56] = "0b0";
        for (unsigned i = 57; i < 63 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[63] = "0b0";
        ram[64] = "0b0";
        ram[65] = "0b0";
        ram[66] = "0b0";
        ram[67] = "0b1";
        ram[68] = "0b1";
        ram[69] = "0b0";
        ram[70] = "0b0";
        ram[71] = "0b1";
        ram[72] = "0b1";
        ram[73] = "0b1";
        ram[74] = "0b0";
        ram[75] = "0b0";
        ram[76] = "0b0";
        ram[77] = "0b1";
        ram[78] = "0b1";
        ram[79] = "0b1";
        ram[80] = "0b0";
        ram[81] = "0b1";
        ram[82] = "0b0";
        ram[83] = "0b0";
        ram[84] = "0b0";
        ram[85] = "0b0";
        ram[86] = "0b1";
        ram[87] = "0b0";
        ram[88] = "0b0";
        for (unsigned i = 89; i < 95 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[95] = "0b0";
        ram[96] = "0b0";
        ram[97] = "0b0";
        ram[98] = "0b0";
        ram[99] = "0b1";
        ram[100] = "0b1";
        ram[101] = "0b1";
        ram[102] = "0b0";
        ram[103] = "0b1";
        for (unsigned i = 104; i < 109 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[109] = "0b1";
        ram[110] = "0b0";
        ram[111] = "0b0";
        ram[112] = "0b1";
        ram[113] = "0b1";
        ram[114] = "0b1";
        ram[115] = "0b1";
        ram[116] = "0b0";
        ram[117] = "0b0";
        ram[118] = "0b0";
        ram[119] = "0b1";
        ram[120] = "0b0";
        for (unsigned i = 121; i < 127 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 127; i < 141 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[141] = "0b1";
        ram[142] = "0b0";
        for (unsigned i = 143; i < 149 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[149] = "0b0";
        for (unsigned i = 150; i < 159 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 159; i < 165 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[165] = "0b1";
        ram[166] = "0b1";
        ram[167] = "0b0";
        ram[168] = "0b0";
        ram[169] = "0b0";
        ram[170] = "0b1";
        ram[171] = "0b0";
        ram[172] = "0b0";
        ram[173] = "0b1";
        ram[174] = "0b1";
        ram[175] = "0b0";
        ram[176] = "0b1";
        ram[177] = "0b0";
        ram[178] = "0b0";
        ram[179] = "0b1";
        ram[180] = "0b0";
        ram[181] = "0b1";
        ram[182] = "0b1";
        ram[183] = "0b0";
        for (unsigned i = 184; i < 191 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 191; i < 203 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[203] = "0b1";
        ram[204] = "0b1";
        ram[205] = "0b1";
        ram[206] = "0b0";
        ram[207] = "0b0";
        ram[208] = "0b0";
        for (unsigned i = 209; i < 214 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[214] = "0b0";
        for (unsigned i = 215; i < 223 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[223] = "0b0";
        ram[224] = "0b0";
        ram[225] = "0b0";
        ram[226] = "0b1";
        for (unsigned i = 227; i < 235 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[235] = "0b1";
        for (unsigned i = 236; i < 241 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 241; i < 255 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 255; i < 261 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[261] = "0b1";
        ram[262] = "0b0";
        ram[263] = "0b0";
        ram[264] = "0b1";
        ram[265] = "0b0";
        ram[266] = "0b1";
        ram[267] = "0b0";
        ram[268] = "0b0";
        ram[269] = "0b1";
        ram[270] = "0b0";
        ram[271] = "0b1";
        ram[272] = "0b0";
        ram[273] = "0b1";
        ram[274] = "0b0";
        ram[275] = "0b0";
        ram[276] = "0b0";
        for (unsigned i = 277; i < 287 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 287; i < 292 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[292] = "0b1";
        ram[293] = "0b0";
        ram[294] = "0b0";
        ram[295] = "0b0";
        ram[296] = "0b0";
        ram[297] = "0b1";
        ram[298] = "0b1";
        for (unsigned i = 299; i < 306 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 306; i < 319 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 319; i < 328 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[328] = "0b1";
        ram[329] = "0b1";
        ram[330] = "0b1";
        ram[331] = "0b0";
        ram[332] = "0b0";
        ram[333] = "0b0";
        ram[334] = "0b0";
        ram[335] = "0b1";
        ram[336] = "0b0";
        ram[337] = "0b0";
        for (unsigned i = 338; i < 344 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[344] = "0b0";
        for (unsigned i = 345; i < 351 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 351; i < 359 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[359] = "0b1";
        ram[360] = "0b1";
        for (unsigned i = 361; i < 367 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 367; i < 373 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[373] = "0b0";
        ram[374] = "0b1";
        ram[375] = "0b1";
        ram[376] = "0b0";
        for (unsigned i = 377; i < 383 ; i = i + 1) {
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
        ram[394] = "0b1";
        ram[395] = "0b1";
        ram[396] = "0b0";
        ram[397] = "0b0";
        ram[398] = "0b0";
        ram[399] = "0b1";
        ram[400] = "0b0";
        ram[401] = "0b0";
        ram[402] = "0b0";
        ram[403] = "0b0";
        for (unsigned i = 404; i < 415 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 415; i < 425 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[425] = "0b1";
        ram[426] = "0b1";
        ram[427] = "0b0";
        ram[428] = "0b0";
        ram[429] = "0b0";
        ram[430] = "0b1";
        ram[431] = "0b0";
        ram[432] = "0b0";
        for (unsigned i = 433; i < 439 ; i = i + 1) {
            ram[i] = "0b1";
        }
        ram[439] = "0b0";
        for (unsigned i = 440; i < 447 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 447; i < 453 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[453] = "0b1";
        ram[454] = "0b0";
        ram[455] = "0b0";
        ram[456] = "0b0";
        ram[457] = "0b1";
        ram[458] = "0b1";
        ram[459] = "0b1";
        for (unsigned i = 460; i < 467 ; i = i + 1) {
            ram[i] = "0b0";
        }
        for (unsigned i = 467; i < 479 ; i = i + 1) {
            ram[i] = "0b1";
        }
        for (unsigned i = 479; i < 484 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[484] = "0b1";
        ram[485] = "0b0";
        ram[486] = "0b0";
        ram[487] = "0b0";
        ram[488] = "0b1";
        ram[489] = "0b1";
        for (unsigned i = 490; i < 495 ; i = i + 1) {
            ram[i] = "0b0";
        }
        ram[495] = "0b1";
        ram[496] = "0b1";
        ram[497] = "0b1";
        ram[498] = "0b0";
        ram[499] = "0b0";
        ram[500] = "0b0";
        for (unsigned i = 501; i < 511 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_bkb) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_bkb_ram* meminst;


SC_CTOR(predict_ensemble_bkb) {
meminst = new predict_ensemble_bkb_ram("predict_ensemble_bkb_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_bkb() {
    delete meminst;
}


};//endmodule
#endif
