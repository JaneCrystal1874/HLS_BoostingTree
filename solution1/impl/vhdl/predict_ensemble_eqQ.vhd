-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eqQ_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_eqQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00000000", 
    9 => "00001011", 10 => "00000000", 11 => "00001101", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 => "00010101", 16 => "00010111", 
    17 => "00011001", 18 to 20=> "00000000", 21 => "00011011", 22 => "00011101", 
    23 to 28=> "00000000", 29 => "00011111", 30 => "00100001", 31 => "00000000", 
    32 => "00100011", 33 => "00000000", 34 => "00100101", 35 to 36=> "00000000", 
    37 => "00100111", 38 => "00101001", 39 => "00000000", 40 => "00101011", 
    41 => "00000000", 42 => "00101101", 43 => "00101111", 44 => "00110001", 
    45 => "00110011", 46 to 47=> "00000000", 48 => "00110101", 49 to 50=> "00000000", 
    51 => "00110111", 52 => "00111001", 53 => "00111011", 54 => "00111101", 
    55 => "00111111", 56 => "01000001", 57 to 63=> "00000000", 64 => "01000011", 
    65 => "00000000", 66 => "01000101", 67 to 68=> "00000000", 69 => "01000111", 
    70 => "01001001", 71 => "00000000", 72 => "01001011", 73 => "00000000", 
    74 => "01001101", 75 => "00000000", 76 => "01001111", 77 => "00000000", 
    78 => "01010001", 79 => "01010011", 80 => "01010101", 81 => "00000000", 
    82 => "01010111", 83 to 84=> "00000000", 85 => "01011001", 86 => "00000000", 
    87 => "01011011", 88 => "01011101", 89 => "00000000", 90 => "01011111", 
    91 => "00000000", 92 => "01100001", 93 => "01100011", 94 to 98=> "00000000", 
    99 => "01100101", 100 => "01100111", 101 => "01101001", 102 to 105=> "00000000", 
    106 => "01101011", 107 => "00000000", 108 => "01101101", 109 => "00000000", 
    110 => "01101111", 111 => "00000000", 112 => "01110001", 113 => "00000000", 
    114 => "01110011", 115 => "01110101", 116 => "01110111", 117 => "01111001", 
    118 to 119=> "00000000", 120 => "01111011", 121 => "00000000", 122 => "01111101", 
    123 to 125=> "00000000", 126 => "01111111", 127 => "10000001", 128 => "10000011", 
    129 to 130=> "00000000", 131 => "10000101", 132 => "10000111", 133 => "10001001", 
    134 => "00000000", 135 => "10001011", 136 => "10001101", 137 to 138=> "00000000", 
    139 => "10001111", 140 => "00000000", 141 => "10010001", 142 to 144=> "00000000", 
    145 => "10010011", 146 => "10010101", 147 to 148=> "00000000", 149 => "10010111", 
    150 => "10011001", 151 => "10011011", 152 to 153=> "00000000", 154 => "10011101", 
    155 to 156=> "00000000", 157 => "10011111", 158 => "00000000", 159 => "10100001", 
    160 => "10100011", 161 => "00000000", 162 => "10100101", 163 to 164=> "00000000", 
    165 => "10100111", 166 => "10101001", 167 to 194=> "00000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_eqQ is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_eqQ is
    component predict_ensemble_eqQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eqQ_rom_U :  component predict_ensemble_eqQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


