// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_zec_H__
#define __predict_ensemble_zec_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_zec_ram : public sc_core::sc_module {

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


   SC_CTOR(predict_ensemble_zec_ram) {
        ram[0] = "0b001";
        ram[1] = "0b010";
        ram[2] = "0b100";
        ram[3] = "0b100";
        ram[4] = "0b100";
        ram[5] = "0b100";
        ram[6] = "0b011";
        ram[7] = "0b001";
        ram[8] = "0b001";
        ram[9] = "0b001";
        ram[10] = "0b000";
        ram[11] = "0b100";
        ram[12] = "0b100";
        ram[13] = "0b100";
        ram[14] = "0b001";
        ram[15] = "0b000";
        ram[16] = "0b000";
        ram[17] = "0b001";
        for (unsigned i = 18; i < 32 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[32] = "0b100";
        ram[33] = "0b001";
        ram[34] = "0b000";
        ram[35] = "0b001";
        ram[36] = "0b011";
        ram[37] = "0b100";
        ram[38] = "0b100";
        ram[39] = "0b000";
        ram[40] = "0b100";
        ram[41] = "0b100";
        ram[42] = "0b100";
        ram[43] = "0b010";
        ram[44] = "0b010";
        ram[45] = "0b000";
        ram[46] = "0b000";
        ram[47] = "0b100";
        ram[48] = "0b000";
        ram[49] = "0b000";
        ram[50] = "0b010";
        ram[51] = "0b000";
        ram[52] = "0b000";
        ram[53] = "0b100";
        ram[54] = "0b011";
        for (unsigned i = 55; i < 64 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[64] = "0b001";
        ram[65] = "0b001";
        ram[66] = "0b011";
        ram[67] = "0b100";
        ram[68] = "0b000";
        ram[69] = "0b001";
        ram[70] = "0b100";
        ram[71] = "0b001";
        ram[72] = "0b001";
        ram[73] = "0b001";
        ram[74] = "0b010";
        ram[75] = "0b010";
        ram[76] = "0b001";
        ram[77] = "0b100";
        ram[78] = "0b000";
        ram[79] = "0b000";
        ram[80] = "0b011";
        ram[81] = "0b100";
        for (unsigned i = 82; i < 96 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[96] = "0b011";
        ram[97] = "0b001";
        ram[98] = "0b010";
        ram[99] = "0b010";
        ram[100] = "0b000";
        ram[101] = "0b010";
        ram[102] = "0b010";
        ram[103] = "0b001";
        ram[104] = "0b000";
        ram[105] = "0b011";
        ram[106] = "0b000";
        ram[107] = "0b001";
        ram[108] = "0b010";
        ram[109] = "0b000";
        ram[110] = "0b000";
        ram[111] = "0b001";
        ram[112] = "0b100";
        ram[113] = "0b001";
        ram[114] = "0b000";
        ram[115] = "0b011";
        ram[116] = "0b001";
        for (unsigned i = 117; i < 128 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[128] = "0b010";
        ram[129] = "0b010";
        ram[130] = "0b010";
        ram[131] = "0b100";
        ram[132] = "0b010";
        ram[133] = "0b010";
        ram[134] = "0b010";
        ram[135] = "0b010";
        ram[136] = "0b011";
        ram[137] = "0b000";
        ram[138] = "0b000";
        ram[139] = "0b011";
        ram[140] = "0b000";
        ram[141] = "0b000";
        ram[142] = "0b100";
        ram[143] = "0b010";
        ram[144] = "0b001";
        ram[145] = "0b010";
        ram[146] = "0b000";
        ram[147] = "0b000";
        ram[148] = "0b000";
        ram[149] = "0b000";
        ram[150] = "0b001";
        for (unsigned i = 151; i < 160 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[160] = "0b100";
        ram[161] = "0b100";
        ram[162] = "0b100";
        ram[163] = "0b011";
        ram[164] = "0b100";
        ram[165] = "0b011";
        ram[166] = "0b001";
        ram[167] = "0b010";
        ram[168] = "0b010";
        ram[169] = "0b000";
        ram[170] = "0b100";
        ram[171] = "0b000";
        ram[172] = "0b001";
        ram[173] = "0b001";
        ram[174] = "0b100";
        ram[175] = "0b000";
        ram[176] = "0b001";
        for (unsigned i = 177; i < 185 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[185] = "0b100";
        for (unsigned i = 186; i < 192 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[192] = "0b001";
        ram[193] = "0b001";
        ram[194] = "0b001";
        ram[195] = "0b001";
        ram[196] = "0b011";
        ram[197] = "0b100";
        ram[198] = "0b001";
        ram[199] = "0b100";
        ram[200] = "0b010";
        ram[201] = "0b001";
        ram[202] = "0b011";
        ram[203] = "0b000";
        ram[204] = "0b011";
        ram[205] = "0b000";
        ram[206] = "0b010";
        ram[207] = "0b000";
        ram[208] = "0b100";
        for (unsigned i = 209; i < 217 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[217] = "0b100";
        for (unsigned i = 218; i < 224 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[224] = "0b001";
        ram[225] = "0b100";
        ram[226] = "0b010";
        ram[227] = "0b100";
        ram[228] = "0b000";
        ram[229] = "0b100";
        ram[230] = "0b001";
        ram[231] = "0b100";
        ram[232] = "0b100";
        ram[233] = "0b000";
        ram[234] = "0b000";
        ram[235] = "0b010";
        ram[236] = "0b001";
        ram[237] = "0b100";
        for (unsigned i = 238; i < 245 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[245] = "0b100";
        ram[246] = "0b000";
        ram[247] = "0b001";
        ram[248] = "0b000";
        ram[249] = "0b001";
        ram[250] = "0b011";
        for (unsigned i = 251; i < 256 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[256] = "0b100";
        ram[257] = "0b100";
        ram[258] = "0b100";
        ram[259] = "0b010";
        ram[260] = "0b010";
        ram[261] = "0b011";
        ram[262] = "0b010";
        ram[263] = "0b100";
        ram[264] = "0b010";
        ram[265] = "0b000";
        ram[266] = "0b010";
        ram[267] = "0b010";
        ram[268] = "0b100";
        ram[269] = "0b010";
        ram[270] = "0b001";
        ram[271] = "0b001";
        for (unsigned i = 272; i < 288 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[288] = "0b010";
        for (unsigned i = 289; i < 294 ; i = i + 1) {
            ram[i] = "0b100";
        }
        ram[294] = "0b000";
        ram[295] = "0b001";
        ram[296] = "0b100";
        ram[297] = "0b000";
        ram[298] = "0b001";
        ram[299] = "0b010";
        ram[300] = "0b100";
        ram[301] = "0b001";
        ram[302] = "0b100";
        ram[303] = "0b000";
        ram[304] = "0b000";
        ram[305] = "0b100";
        ram[306] = "0b001";
        for (unsigned i = 307; i < 320 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[320] = "0b011";
        ram[321] = "0b001";
        ram[322] = "0b001";
        ram[323] = "0b000";
        ram[324] = "0b100";
        ram[325] = "0b001";
        ram[326] = "0b100";
        ram[327] = "0b001";
        ram[328] = "0b100";
        ram[329] = "0b000";
        ram[330] = "0b100";
        ram[331] = "0b001";
        ram[332] = "0b001";
        ram[333] = "0b100";
        ram[334] = "0b000";
        ram[335] = "0b000";
        ram[336] = "0b100";
        ram[337] = "0b001";
        ram[338] = "0b000";
        ram[339] = "0b000";
        ram[340] = "0b000";
        ram[341] = "0b000";
        ram[342] = "0b001";
        for (unsigned i = 343; i < 352 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[352] = "0b011";
        ram[353] = "0b010";
        ram[354] = "0b010";
        ram[355] = "0b010";
        ram[356] = "0b001";
        ram[357] = "0b001";
        ram[358] = "0b001";
        ram[359] = "0b100";
        ram[360] = "0b011";
        ram[361] = "0b000";
        ram[362] = "0b000";
        ram[363] = "0b100";
        ram[364] = "0b100";
        ram[365] = "0b010";
        for (unsigned i = 366; i < 371 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[371] = "0b100";
        ram[372] = "0b000";
        ram[373] = "0b100";
        ram[374] = "0b001";
        for (unsigned i = 375; i < 384 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[384] = "0b001";
        ram[385] = "0b001";
        ram[386] = "0b001";
        ram[387] = "0b000";
        ram[388] = "0b000";
        ram[389] = "0b011";
        ram[390] = "0b001";
        ram[391] = "0b000";
        ram[392] = "0b001";
        ram[393] = "0b000";
        ram[394] = "0b001";
        ram[395] = "0b000";
        ram[396] = "0b000";
        ram[397] = "0b100";
        ram[398] = "0b001";
        ram[399] = "0b000";
        ram[400] = "0b100";
        ram[401] = "0b010";
        ram[402] = "0b001";
        ram[403] = "0b000";
        ram[404] = "0b000";
        ram[405] = "0b010";
        ram[406] = "0b010";
        ram[407] = "0b000";
        ram[408] = "0b100";
        for (unsigned i = 409; i < 416 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[416] = "0b001";
        ram[417] = "0b100";
        ram[418] = "0b001";
        ram[419] = "0b100";
        ram[420] = "0b100";
        ram[421] = "0b010";
        ram[422] = "0b001";
        ram[423] = "0b001";
        ram[424] = "0b001";
        ram[425] = "0b000";
        ram[426] = "0b010";
        ram[427] = "0b000";
        ram[428] = "0b000";
        ram[429] = "0b000";
        ram[430] = "0b001";
        ram[431] = "0b100";
        ram[432] = "0b011";
        ram[433] = "0b000";
        ram[434] = "0b000";
        ram[435] = "0b001";
        ram[436] = "0b000";
        ram[437] = "0b000";
        ram[438] = "0b001";
        for (unsigned i = 439; i < 448 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[448] = "0b011";
        ram[449] = "0b100";
        ram[450] = "0b000";
        ram[451] = "0b100";
        ram[452] = "0b100";
        ram[453] = "0b100";
        ram[454] = "0b000";
        ram[455] = "0b000";
        ram[456] = "0b010";
        ram[457] = "0b010";
        ram[458] = "0b000";
        ram[459] = "0b010";
        ram[460] = "0b010";
        ram[461] = "0b010";
        ram[462] = "0b010";
        ram[463] = "0b100";
        ram[464] = "0b001";
        ram[465] = "0b000";
        ram[466] = "0b010";
        ram[467] = "0b000";
        ram[468] = "0b000";
        ram[469] = "0b011";
        for (unsigned i = 470; i < 480 ; i = i + 1) {
            ram[i] = "0b000";
        }
        ram[480] = "0b011";
        ram[481] = "0b010";
        ram[482] = "0b010";
        ram[483] = "0b000";
        ram[484] = "0b000";
        ram[485] = "0b010";
        ram[486] = "0b010";
        ram[487] = "0b001";
        ram[488] = "0b001";
        ram[489] = "0b010";
        ram[490] = "0b010";
        ram[491] = "0b100";
        ram[492] = "0b100";
        ram[493] = "0b000";
        ram[494] = "0b000";
        ram[495] = "0b010";
        ram[496] = "0b001";
        ram[497] = "0b001";
        ram[498] = "0b100";
        for (unsigned i = 499; i < 512 ; i = i + 1) {
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


SC_MODULE(predict_ensemble_zec) {


static const unsigned DataWidth = 3;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_zec_ram* meminst;


SC_CTOR(predict_ensemble_zec) {
meminst = new predict_ensemble_zec_ram("predict_ensemble_zec_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_zec() {
    delete meminst;
}


};//endmodule
#endif
