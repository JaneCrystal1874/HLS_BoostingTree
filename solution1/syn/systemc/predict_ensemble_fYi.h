// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_fYi_H__
#define __predict_ensemble_fYi_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_fYi_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_fYi_ram) {
        ram[0] = "0b001";
        ram[1] = "0b100";
        ram[2] = "0b001";
        ram[3] = "0b001";
        ram[4] = "0b100";
        ram[5] = "0b100";
        ram[6] = "0b011";
        ram[7] = "0b011";
        ram[8] = "0b100";
        ram[9] = "0b000";
        ram[10] = "0b000";
        ram[11] = "0b100";
        ram[12] = "0b100";
        ram[13] = "0b000";
        ram[14] = "0b011";
        ram[15] = "0b100";
        ram[16] = "0b000";
        ram[17] = "0b010";
        ram[18] = "0b010";
        for (unsigned i = 19; i < 32 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[32] = "0b100";
        ram[33] = "0b000";
        ram[34] = "0b010";
        ram[35] = "0b001";
        ram[36] = "0b100";
        ram[37] = "0b000";
        ram[38] = "0b000";
        ram[39] = "0b001";
        ram[40] = "0b010";
        ram[41] = "0b000";
        ram[42] = "0b000";
        ram[43] = "0b001";
        ram[44] = "0b000";
        ram[45] = "0b010";
        ram[46] = "0b000";
        ram[47] = "0b000";
        ram[48] = "0b010";
        ram[49] = "0b010";
        ram[50] = "0b000";
        ram[51] = "0b100";
        ram[52] = "0b001";
        ram[53] = "0b100";
        ram[54] = "0b000";
        ram[55] = "0b001";
        ram[56] = "0b100";
        for (unsigned i = 57; i < 64 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[64] = "0b001";
        ram[65] = "0b010";
        ram[66] = "0b001";
        ram[67] = "0b000";
        ram[68] = "0b000";
        ram[69] = "0b011";
        ram[70] = "0b001";
        ram[71] = "0b000";
        ram[72] = "0b000";
        ram[73] = "0b000";
        ram[74] = "0b100";
        ram[75] = "0b100";
        ram[76] = "0b001";
        ram[77] = "0b000";
        ram[78] = "0b000";
        ram[79] = "0b000";
        ram[80] = "0b001";
        ram[81] = "0b000";
        ram[82] = "0b010";
        ram[83] = "0b010";
        ram[84] = "0b010";
        ram[85] = "0b011";
        ram[86] = "0b000";
        ram[87] = "0b001";
        ram[88] = "0b001";
        for (unsigned i = 89; i < 96 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[96] = "0b100";
        ram[97] = "0b011";
        ram[98] = "0b100";
        ram[99] = "0b000";
        ram[100] = "0b000";
        ram[101] = "0b000";
        ram[102] = "0b001";
        ram[103] = "0b000";
        ram[104] = "0b100";
        ram[105] = "0b010";
        ram[106] = "0b100";
        ram[107] = "0b011";
        ram[108] = "0b100";
        ram[109] = "0b000";
        ram[110] = "0b100";
        ram[111] = "0b001";
        ram[112] = "0b000";
        ram[113] = "0b000";
        ram[114] = "0b000";
        ram[115] = "0b000";
        ram[116] = "0b100";
        ram[117] = "0b100";
        ram[118] = "0b010";
        ram[119] = "0b000";
        ram[120] = "0b100";
        for (unsigned i = 121; i < 128 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[128] = "0b001";
        ram[129] = "0b010";
        ram[130] = "0b010";
        ram[131] = "0b001";
        ram[132] = "0b011";
        ram[133] = "0b010";
        ram[134] = "0b010";
        ram[135] = "0b010";
        ram[136] = "0b001";
        ram[137] = "0b010";
        ram[138] = "0b001";
        ram[139] = "0b011";
        ram[140] = "0b100";
        ram[141] = "0b000";
        ram[142] = "0b001";
        for (unsigned i = 143; i < 149 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[149] = "0b001";
        for (unsigned i = 150; i < 160 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[160] = "0b011";
        ram[161] = "0b010";
        ram[162] = "0b100";
        ram[163] = "0b010";
        ram[164] = "0b010";
        ram[165] = "0b000";
        ram[166] = "0b000";
        ram[167] = "0b010";
        ram[168] = "0b100";
        ram[169] = "0b100";
        ram[170] = "0b000";
        ram[171] = "0b010";
        ram[172] = "0b010";
        ram[173] = "0b000";
        ram[174] = "0b000";
        ram[175] = "0b001";
        ram[176] = "0b000";
        ram[177] = "0b100";
        ram[178] = "0b011";
        ram[179] = "0b000";
        ram[180] = "0b100";
        ram[181] = "0b000";
        ram[182] = "0b000";
        ram[183] = "0b100";
        for (unsigned i = 184; i < 192 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[192] = "0b001";
        ram[193] = "0b100";
        ram[194] = "0b001";
        ram[195] = "0b100";
        ram[196] = "0b100";
        ram[197] = "0b001";
        ram[198] = "0b100";
        ram[199] = "0b100";
        ram[200] = "0b010";
        ram[201] = "0b010";
        ram[202] = "0b100";
        ram[203] = "0b000";
        ram[204] = "0b000";
        ram[205] = "0b000";
        ram[206] = "0b011";
        ram[207] = "0b100";
        ram[208] = "0b001";
        for (unsigned i = 209; i < 214 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[214] = "0b001";
        for (unsigned i = 215; i < 224 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[224] = "0b100";
        ram[225] = "0b001";
        ram[226] = "0b000";
        ram[227] = "0b001";
        ram[228] = "0b001";
        ram[229] = "0b001";
        ram[230] = "0b001";
        ram[231] = "0b010";
        ram[232] = "0b001";
        ram[233] = "0b001";
        ram[234] = "0b011";
        ram[235] = "0b000";
        ram[236] = "0b100";
        ram[237] = "0b001";
        ram[238] = "0b011";
        ram[239] = "0b100";
        ram[240] = "0b010";
        for (unsigned i = 241; i < 256 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[256] = "0b010";
        ram[257] = "0b010";
        ram[258] = "0b010";
        ram[259] = "0b010";
        ram[260] = "0b011";
        ram[261] = "0b000";
        ram[262] = "0b100";
        ram[263] = "0b010";
        ram[264] = "0b000";
        ram[265] = "0b010";
        ram[266] = "0b000";
        ram[267] = "0b100";
        ram[268] = "0b100";
        ram[269] = "0b000";
        ram[270] = "0b100";
        ram[271] = "0b000";
        ram[272] = "0b100";
        ram[273] = "0b000";
        ram[274] = "0b100";
        ram[275] = "0b001";
        ram[276] = "0b011";
        for (unsigned i = 277; i < 288 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[288] = "0b001";
        ram[289] = "0b001";
        ram[290] = "0b010";
        ram[291] = "0b100";
        ram[292] = "0b000";
        ram[293] = "0b100";
        ram[294] = "0b010";
        ram[295] = "0b100";
        ram[296] = "0b100";
        ram[297] = "0b000";
        ram[298] = "0b000";
        ram[299] = "0b100";
        ram[300] = "0b100";
        ram[301] = "0b100";
        ram[302] = "0b100";
        ram[303] = "0b001";
        ram[304] = "0b100";
        ram[305] = "0b010";
        for (unsigned i = 306; i < 320 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[320] = "0b100";
        ram[321] = "0b100";
        ram[322] = "0b100";
        ram[323] = "0b100";
        ram[324] = "0b001";
        ram[325] = "0b100";
        ram[326] = "0b100";
        ram[327] = "0b010";
        ram[328] = "0b000";
        ram[329] = "0b000";
        ram[330] = "0b000";
        ram[331] = "0b100";
        ram[332] = "0b010";
        ram[333] = "0b001";
        ram[334] = "0b011";
        ram[335] = "0b000";
        ram[336] = "0b010";
        ram[337] = "0b001";
        for (unsigned i = 338; i < 344 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[344] = "0b010";
        for (unsigned i = 345; i < 352 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[352] = "0b010";
        ram[353] = "0b100";
        ram[354] = "0b100";
        ram[355] = "0b011";
        ram[356] = "0b001";
        ram[357] = "0b011";
        ram[358] = "0b100";
        ram[359] = "0b000";
        ram[360] = "0b000";
        ram[361] = "0b100";
        ram[362] = "0b001";
        ram[363] = "0b010";
        ram[364] = "0b100";
        ram[365] = "0b010";
        ram[366] = "0b100";
        for (unsigned i = 367; i < 373 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[373] = "0b100";
        ram[374] = "0b000";
        ram[375] = "0b000";
        ram[376] = "0b011";
        for (unsigned i = 377; i < 384 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[384] = "0b010";
        ram[385] = "0b010";
        ram[386] = "0b100";
        ram[387] = "0b001";
        ram[388] = "0b100";
        ram[389] = "0b000";
        ram[390] = "0b100";
        ram[391] = "0b001";
        ram[392] = "0b010";
        ram[393] = "0b000";
        ram[394] = "0b000";
        ram[395] = "0b000";
        ram[396] = "0b001";
        ram[397] = "0b001";
        ram[398] = "0b001";
        ram[399] = "0b000";
        ram[400] = "0b001";
        ram[401] = "0b001";
        ram[402] = "0b100";
        ram[403] = "0b001";
        for (unsigned i = 404; i < 416 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[416] = "0b001";
        ram[417] = "0b001";
        ram[418] = "0b100";
        ram[419] = "0b100";
        ram[420] = "0b001";
        ram[421] = "0b011";
        ram[422] = "0b010";
        ram[423] = "0b001";
        ram[424] = "0b001";
        ram[425] = "0b000";
        ram[426] = "0b000";
        ram[427] = "0b010";
        ram[428] = "0b100";
        ram[429] = "0b010";
        ram[430] = "0b000";
        ram[431] = "0b001";
        ram[432] = "0b001";
        for (unsigned i = 433; i < 439 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[439] = "0b001";
        for (unsigned i = 440; i < 448 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[448] = "0b010";
        ram[449] = "0b010";
        ram[450] = "0b010";
        ram[451] = "0b100";
        ram[452] = "0b001";
        ram[453] = "0b000";
        ram[454] = "0b001";
        ram[455] = "0b001";
        ram[456] = "0b100";
        ram[457] = "0b000";
        ram[458] = "0b000";
        ram[459] = "0b000";
        ram[460] = "0b001";
        ram[461] = "0b001";
        ram[462] = "0b100";
        ram[463] = "0b010";
        ram[464] = "0b001";
        ram[465] = "0b010";
        ram[466] = "0b001";
        for (unsigned i = 467; i < 480 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[480] = "0b100";
        ram[481] = "0b100";
        ram[482] = "0b001";
        ram[483] = "0b100";
        ram[484] = "0b000";
        ram[485] = "0b011";
        ram[486] = "0b100";
        ram[487] = "0b010";
        ram[488] = "0b000";
        ram[489] = "0b000";
        ram[490] = "0b011";
        ram[491] = "0b100";
        ram[492] = "0b001";
        ram[493] = "0b001";
        ram[494] = "0b010";
        ram[495] = "0b000";
        ram[496] = "0b000";
        ram[497] = "0b000";
        ram[498] = "0b010";
        ram[499] = "0b011";
        ram[500] = "0b001";
        for (unsigned i = 501; i < 512 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_fYi) {


static const unsigned DataWidth = 3;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_fYi_ram* meminst;


SC_CTOR(predict_ensemble_fYi) {
meminst = new predict_ensemble_fYi_ram("predict_ensemble_fYi_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_fYi() {
    delete meminst;
}


};//endmodule
#endif
