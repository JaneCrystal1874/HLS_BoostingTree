// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_qcK_H__
#define __predict_ensemble_qcK_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_qcK_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 5;
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


   SC_CTOR(predict_ensemble_qcK_ram) {
        ram[0] = "0b00001";
        ram[1] = "0b00011";
        ram[2] = "0b00101";
        ram[3] = "0b00111";
        ram[4] = "0b00000";
        ram[5] = "0b00000";
        ram[6] = "0b01001";
        ram[7] = "0b01011";
        ram[8] = "0b00000";
        ram[9] = "0b01101";
        ram[10] = "0b01111";
        ram[11] = "0b10001";
        ram[12] = "0b10011";
        ram[13] = "0b10101";
        ram[14] = "0b10111";
        ram[15] = "0b00000";
        ram[16] = "0b11001";
        ram[17] = "0b00000";
        ram[18] = "0b11011";
        for (unsigned i = 19; i < 24 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[24] = "0b11101";
        for (unsigned i = 25; i < 32 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[32] = "0b00001";
        ram[33] = "0b00011";
        ram[34] = "0b00101";
        ram[35] = "0b00111";
        ram[36] = "0b00000";
        ram[37] = "0b00000";
        ram[38] = "0b01001";
        ram[39] = "0b01011";
        ram[40] = "0b01101";
        ram[41] = "0b01111";
        ram[42] = "0b10001";
        ram[43] = "0b10011";
        ram[44] = "0b10101";
        ram[45] = "0b00000";
        ram[46] = "0b00000";
        ram[47] = "0b10111";
        ram[48] = "0b11001";
        ram[49] = "0b11011";
        ram[50] = "0b11101";
        for (unsigned i = 51; i < 64 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[64] = "0b00001";
        ram[65] = "0b00011";
        ram[66] = "0b00000";
        ram[67] = "0b00101";
        ram[68] = "0b00111";
        ram[69] = "0b01001";
        ram[70] = "0b01011";
        ram[71] = "0b00000";
        ram[72] = "0b01101";
        ram[73] = "0b01111";
        ram[74] = "0b00000";
        ram[75] = "0b00000";
        ram[76] = "0b10001";
        ram[77] = "0b00000";
        ram[78] = "0b00000";
        ram[79] = "0b10011";
        ram[80] = "0b10101";
        ram[81] = "0b00000";
        ram[82] = "0b10111";
        ram[83] = "0b11001";
        ram[84] = "0b00000";
        ram[85] = "0b00000";
        ram[86] = "0b00000";
        ram[87] = "0b11011";
        ram[88] = "0b11101";
        for (unsigned i = 89; i < 96 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[96] = "0b00001";
        ram[97] = "0b00011";
        ram[98] = "0b00101";
        ram[99] = "0b00111";
        ram[100] = "0b00000";
        ram[101] = "0b01001";
        ram[102] = "0b01011";
        ram[103] = "0b01101";
        ram[104] = "0b00000";
        ram[105] = "0b01111";
        ram[106] = "0b00000";
        ram[107] = "0b00000";
        ram[108] = "0b10001";
        ram[109] = "0b10011";
        ram[110] = "0b00000";
        ram[111] = "0b10101";
        ram[112] = "0b10111";
        ram[113] = "0b11001";
        ram[114] = "0b11011";
        for (unsigned i = 115; i < 122 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[122] = "0b11101";
        for (unsigned i = 123; i < 128 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[128] = "0b00001";
        ram[129] = "0b00011";
        ram[130] = "0b00101";
        ram[131] = "0b00111";
        ram[132] = "0b01001";
        ram[133] = "0b00000";
        ram[134] = "0b01011";
        ram[135] = "0b01101";
        ram[136] = "0b00000";
        ram[137] = "0b00000";
        ram[138] = "0b00000";
        ram[139] = "0b01111";
        ram[140] = "0b10001";
        ram[141] = "0b10011";
        ram[142] = "0b10101";
        ram[143] = "0b00000";
        ram[144] = "0b10111";
        ram[145] = "0b11001";
        ram[146] = "0b11011";
        ram[147] = "0b11101";
        for (unsigned i = 148; i < 160 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[160] = "0b00001";
        ram[161] = "0b00011";
        ram[162] = "0b00101";
        ram[163] = "0b00000";
        ram[164] = "0b00000";
        ram[165] = "0b00000";
        ram[166] = "0b00111";
        ram[167] = "0b00000";
        ram[168] = "0b01001";
        ram[169] = "0b01011";
        ram[170] = "0b01101";
        ram[171] = "0b00000";
        ram[172] = "0b00000";
        ram[173] = "0b01111";
        ram[174] = "0b10001";
        ram[175] = "0b10011";
        ram[176] = "0b10101";
        ram[177] = "0b10111";
        ram[178] = "0b11001";
        ram[179] = "0b11011";
        ram[180] = "0b11101";
        for (unsigned i = 181; i < 192 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[192] = "0b00001";
        ram[193] = "0b00011";
        ram[194] = "0b00101";
        ram[195] = "0b00111";
        ram[196] = "0b01001";
        ram[197] = "0b00000";
        ram[198] = "0b01011";
        ram[199] = "0b01101";
        ram[200] = "0b00000";
        ram[201] = "0b00000";
        ram[202] = "0b01111";
        ram[203] = "0b00000";
        ram[204] = "0b00000";
        ram[205] = "0b10001";
        ram[206] = "0b00000";
        ram[207] = "0b10011";
        ram[208] = "0b10101";
        ram[209] = "0b10111";
        ram[210] = "0b00000";
        ram[211] = "0b00000";
        ram[212] = "0b11001";
        ram[213] = "0b11011";
        ram[214] = "0b11101";
        for (unsigned i = 215; i < 224 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[224] = "0b00001";
        ram[225] = "0b00011";
        ram[226] = "0b00101";
        ram[227] = "0b00111";
        ram[228] = "0b01001";
        ram[229] = "0b00000";
        ram[230] = "0b01011";
        ram[231] = "0b01101";
        ram[232] = "0b00000";
        ram[233] = "0b00000";
        ram[234] = "0b00000";
        ram[235] = "0b01111";
        ram[236] = "0b10001";
        ram[237] = "0b10011";
        ram[238] = "0b10101";
        ram[239] = "0b10111";
        ram[240] = "0b11001";
        ram[241] = "0b11011";
        ram[242] = "0b11101";
        for (unsigned i = 243; i < 256 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[256] = "0b00001";
        ram[257] = "0b00011";
        ram[258] = "0b00101";
        ram[259] = "0b00111";
        ram[260] = "0b01001";
        ram[261] = "0b01011";
        ram[262] = "0b01101";
        ram[263] = "0b01111";
        ram[264] = "0b10001";
        ram[265] = "0b00000";
        ram[266] = "0b10011";
        ram[267] = "0b10101";
        ram[268] = "0b00000";
        ram[269] = "0b10111";
        ram[270] = "0b11001";
        ram[271] = "0b00000";
        ram[272] = "0b00000";
        ram[273] = "0b00000";
        ram[274] = "0b11011";
        ram[275] = "0b00000";
        ram[276] = "0b00000";
        ram[277] = "0b11101";
        for (unsigned i = 278; i < 288 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[288] = "0b00001";
        ram[289] = "0b00011";
        ram[290] = "0b00101";
        ram[291] = "0b00111";
        ram[292] = "0b00000";
        ram[293] = "0b00000";
        ram[294] = "0b01001";
        ram[295] = "0b01011";
        ram[296] = "0b00000";
        ram[297] = "0b01101";
        ram[298] = "0b01111";
        ram[299] = "0b00000";
        ram[300] = "0b10001";
        ram[301] = "0b10011";
        ram[302] = "0b10101";
        ram[303] = "0b10111";
        ram[304] = "0b11001";
        ram[305] = "0b00000";
        ram[306] = "0b00000";
        ram[307] = "0b11011";
        for (unsigned i = 308; i < 314 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[314] = "0b11101";
        for (unsigned i = 315; i < 320 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[320] = "0b00001";
        ram[321] = "0b00000";
        ram[322] = "0b00011";
        ram[323] = "0b00101";
        ram[324] = "0b00111";
        ram[325] = "0b01001";
        ram[326] = "0b01011";
        ram[327] = "0b01101";
        ram[328] = "0b01111";
        ram[329] = "0b10001";
        ram[330] = "0b10011";
        ram[331] = "0b00000";
        ram[332] = "0b00000";
        ram[333] = "0b00000";
        ram[334] = "0b00000";
        ram[335] = "0b10101";
        ram[336] = "0b10111";
        ram[337] = "0b00000";
        ram[338] = "0b11001";
        ram[339] = "0b00000";
        ram[340] = "0b00000";
        ram[341] = "0b11011";
        ram[342] = "0b00000";
        ram[343] = "0b11101";
        for (unsigned i = 344; i < 352 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[352] = "0b00001";
        ram[353] = "0b00011";
        ram[354] = "0b00000";
        ram[355] = "0b00101";
        ram[356] = "0b00000";
        ram[357] = "0b00111";
        ram[358] = "0b01001";
        ram[359] = "0b01011";
        ram[360] = "0b00000";
        ram[361] = "0b00000";
        ram[362] = "0b01101";
        ram[363] = "0b01111";
        ram[364] = "0b00000";
        ram[365] = "0b10001";
        ram[366] = "0b10011";
        ram[367] = "0b10101";
        ram[368] = "0b10111";
        ram[369] = "0b11001";
        ram[370] = "0b11011";
        ram[371] = "0b00000";
        ram[372] = "0b11101";
        for (unsigned i = 373; i < 384 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[384] = "0b00001";
        ram[385] = "0b00011";
        ram[386] = "0b00101";
        ram[387] = "0b00111";
        ram[388] = "0b00000";
        ram[389] = "0b01001";
        ram[390] = "0b01011";
        ram[391] = "0b01101";
        ram[392] = "0b01111";
        ram[393] = "0b00000";
        ram[394] = "0b00000";
        ram[395] = "0b00000";
        ram[396] = "0b10001";
        ram[397] = "0b10011";
        ram[398] = "0b00000";
        ram[399] = "0b00000";
        ram[400] = "0b10101";
        ram[401] = "0b10111";
        ram[402] = "0b11001";
        for (unsigned i = 403; i < 409 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[409] = "0b11011";
        ram[410] = "0b11101";
        for (unsigned i = 411; i < 416 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[416] = "0b00001";
        ram[417] = "0b00011";
        ram[418] = "0b00101";
        ram[419] = "0b00111";
        ram[420] = "0b00000";
        ram[421] = "0b01001";
        ram[422] = "0b01011";
        ram[423] = "0b01101";
        ram[424] = "0b01111";
        ram[425] = "0b10001";
        ram[426] = "0b10011";
        ram[427] = "0b10101";
        ram[428] = "0b10111";
        ram[429] = "0b00000";
        ram[430] = "0b00000";
        ram[431] = "0b11001";
        for (unsigned i = 432; i < 439 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[439] = "0b11011";
        ram[440] = "0b11101";
        for (unsigned i = 441; i < 448 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[448] = "0b00001";
        ram[449] = "0b00011";
        ram[450] = "0b00101";
        ram[451] = "0b00111";
        ram[452] = "0b00000";
        ram[453] = "0b01001";
        ram[454] = "0b01011";
        ram[455] = "0b00000";
        ram[456] = "0b00000";
        ram[457] = "0b00000";
        ram[458] = "0b01101";
        ram[459] = "0b01111";
        ram[460] = "0b10001";
        ram[461] = "0b00000";
        ram[462] = "0b00000";
        ram[463] = "0b10011";
        ram[464] = "0b10101";
        ram[465] = "0b10111";
        ram[466] = "0b11001";
        ram[467] = "0b00000";
        ram[468] = "0b00000";
        ram[469] = "0b11011";
        ram[470] = "0b00000";
        ram[471] = "0b11101";
        for (unsigned i = 472; i < 480 ; i = i + 1) {
            ram[i] = "0b00000";
        }
        ram[480] = "0b00001";
        ram[481] = "0b00011";
        ram[482] = "0b00101";
        ram[483] = "0b00111";
        ram[484] = "0b00000";
        ram[485] = "0b01001";
        ram[486] = "0b01011";
        ram[487] = "0b01101";
        ram[488] = "0b01111";
        ram[489] = "0b10001";
        ram[490] = "0b10011";
        ram[491] = "0b00000";
        ram[492] = "0b10101";
        ram[493] = "0b00000";
        ram[494] = "0b10111";
        ram[495] = "0b11001";
        ram[496] = "0b00000";
        ram[497] = "0b00000";
        ram[498] = "0b11011";
        ram[499] = "0b11101";
        for (unsigned i = 500; i < 512 ; i = i + 1) {
            ram[i] = "0b00000";
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


SC_MODULE(predict_ensemble_qcK) {


static const unsigned DataWidth = 5;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_qcK_ram* meminst;


SC_CTOR(predict_ensemble_qcK) {
meminst = new predict_ensemble_qcK_ram("predict_ensemble_qcK_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_qcK() {
    delete meminst;
}


};//endmodule
#endif
