// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __predict_ensemble_ocq_H__
#define __predict_ensemble_ocq_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct predict_ensemble_ocq_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 8;
  static const unsigned AddressRange = 195;
  static const unsigned AddressWidth = 8;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(predict_ensemble_ocq_ram) {
        ram[0] = "0b00000001";
        ram[1] = "0b00000011";
        ram[2] = "0b00000101";
        ram[3] = "0b00000111";
        ram[4] = "0b00000000";
        ram[5] = "0b00001001";
        ram[6] = "0b00001011";
        ram[7] = "0b00000000";
        ram[8] = "0b00000000";
        ram[9] = "0b00000000";
        ram[10] = "0b00000000";
        ram[11] = "0b00001101";
        ram[12] = "0b00001111";
        ram[13] = "0b00000000";
        ram[14] = "0b00010001";
        ram[15] = "0b00000000";
        ram[16] = "0b00000000";
        ram[17] = "0b00010011";
        ram[18] = "0b00010101";
        ram[19] = "0b00000000";
        ram[20] = "0b00010111";
        ram[21] = "0b00011001";
        ram[22] = "0b00011011";
        ram[23] = "0b00011101";
        ram[24] = "0b00011111";
        ram[25] = "0b00100001";
        ram[26] = "0b00100011";
        ram[27] = "0b00100101";
        ram[28] = "0b00100111";
        ram[29] = "0b00000000";
        ram[30] = "0b00000000";
        ram[31] = "0b00000000";
        ram[32] = "0b00000000";
        ram[33] = "0b00101001";
        ram[34] = "0b00101011";
        ram[35] = "0b00101101";
        ram[36] = "0b00000000";
        ram[37] = "0b00000000";
        ram[38] = "0b00101111";
        for (unsigned i = 39; i < 47 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[47] = "0b00110001";
        ram[48] = "0b00110011";
        ram[49] = "0b00000000";
        ram[50] = "0b00000000";
        ram[51] = "0b00110101";
        ram[52] = "0b00110111";
        ram[53] = "0b00111001";
        ram[54] = "0b00000000";
        ram[55] = "0b00111011";
        ram[56] = "0b00111101";
        ram[57] = "0b00111111";
        ram[58] = "0b01000001";
        ram[59] = "0b01000011";
        ram[60] = "0b00000000";
        ram[61] = "0b01000101";
        for (unsigned i = 62; i < 67 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[67] = "0b01000111";
        ram[68] = "0b01001001";
        ram[69] = "0b01001011";
        ram[70] = "0b00000000";
        ram[71] = "0b00000000";
        ram[72] = "0b00000000";
        ram[73] = "0b01001101";
        ram[74] = "0b01001111";
        ram[75] = "0b01010001";
        ram[76] = "0b00000000";
        ram[77] = "0b01010011";
        ram[78] = "0b01010101";
        ram[79] = "0b00000000";
        ram[80] = "0b01010111";
        ram[81] = "0b00000000";
        ram[82] = "0b01011001";
        ram[83] = "0b01011011";
        ram[84] = "0b01011101";
        ram[85] = "0b00000000";
        ram[86] = "0b01011111";
        ram[87] = "0b01100001";
        ram[88] = "0b01100011";
        ram[89] = "0b01100101";
        ram[90] = "0b01100111";
        ram[91] = "0b01101001";
        ram[92] = "0b00000000";
        ram[93] = "0b00000000";
        ram[94] = "0b01101011";
        ram[95] = "0b01101101";
        ram[96] = "0b00000000";
        ram[97] = "0b01101111";
        ram[98] = "0b01110001";
        ram[99] = "0b00000000";
        ram[100] = "0b00000000";
        ram[101] = "0b01110011";
        ram[102] = "0b00000000";
        ram[103] = "0b00000000";
        ram[104] = "0b01110101";
        ram[105] = "0b01110111";
        ram[106] = "0b00000000";
        ram[107] = "0b01111001";
        ram[108] = "0b01111011";
        for (unsigned i = 109; i < 114 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[114] = "0b01111101";
        ram[115] = "0b00000000";
        ram[116] = "0b01111111";
        ram[117] = "0b00000000";
        ram[118] = "0b10000001";
        ram[119] = "0b00000000";
        ram[120] = "0b10000011";
        ram[121] = "0b10000101";
        ram[122] = "0b10000111";
        ram[123] = "0b00000000";
        ram[124] = "0b00000000";
        ram[125] = "0b10001001";
        ram[126] = "0b10001011";
        ram[127] = "0b00000000";
        ram[128] = "0b00000000";
        ram[129] = "0b10001101";
        ram[130] = "0b10001111";
        ram[131] = "0b00000000";
        ram[132] = "0b00000000";
        ram[133] = "0b00000000";
        ram[134] = "0b10010001";
        ram[135] = "0b00000000";
        ram[136] = "0b10010011";
        ram[137] = "0b00000000";
        ram[138] = "0b00000000";
        ram[139] = "0b00000000";
        ram[140] = "0b00000000";
        ram[141] = "0b10010101";
        ram[142] = "0b10010111";
        ram[143] = "0b10011001";
        ram[144] = "0b10011011";
        ram[145] = "0b00000000";
        ram[146] = "0b10011101";
        ram[147] = "0b00000000";
        ram[148] = "0b00000000";
        ram[149] = "0b00000000";
        ram[150] = "0b00000000";
        ram[151] = "0b10011111";
        ram[152] = "0b10100001";
        ram[153] = "0b00000000";
        ram[154] = "0b00000000";
        ram[155] = "0b00000000";
        ram[156] = "0b10100011";
        ram[157] = "0b10100101";
        ram[158] = "0b10100111";
        ram[159] = "0b00000000";
        ram[160] = "0b00000000";
        ram[161] = "0b00000000";
        ram[162] = "0b10101001";
        ram[163] = "0b10101011";
        for (unsigned i = 164; i < 169 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[169] = "0b10101101";
        ram[170] = "0b10101111";
        ram[171] = "0b00000000";
        ram[172] = "0b00000000";
        ram[173] = "0b10110001";
        ram[174] = "0b10110011";
        ram[175] = "0b00000000";
        ram[176] = "0b10110101";
        for (unsigned i = 177; i < 182 ; i = i + 1) {
            ram[i] = "0b00000000";
        }
        ram[182] = "0b10110111";
        for (unsigned i = 183; i < 195 ; i = i + 1) {
            ram[i] = "0b00000000";
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


SC_MODULE(predict_ensemble_ocq) {


static const unsigned DataWidth = 8;
static const unsigned AddressRange = 195;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


predict_ensemble_ocq_ram* meminst;


SC_CTOR(predict_ensemble_ocq) {
meminst = new predict_ensemble_ocq_ram("predict_ensemble_ocq_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~predict_ensemble_ocq() {
    delete meminst;
}


};//endmodule
#endif
