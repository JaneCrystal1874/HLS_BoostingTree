-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c3C_rom is 
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


architecture rtl of predict_ensemble_c3C_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00000000", 
    8 => "00001011", 9 => "00001101", 10 => "00001111", 11 => "00000000", 
    12 => "00010001", 13 => "00000000", 14 => "00010011", 15 to 17=> "00000000", 
    18 => "00010101", 19 => "00000000", 20 => "00010111", 21 to 23=> "00000000", 
    24 => "00011001", 25 => "00000000", 26 => "00011011", 27 => "00000000", 
    28 => "00011101", 29 => "00011111", 30 => "00000000", 31 => "00100001", 
    32 => "00000000", 33 => "00100011", 34 => "00000000", 35 => "00100101", 
    36 => "00000000", 37 => "00100111", 38 => "00101001", 39 to 41=> "00000000", 
    42 => "00101011", 43 => "00101101", 44 => "00000000", 45 => "00101111", 
    46 => "00000000", 47 => "00110001", 48 => "00110011", 49 => "00110101", 
    50 to 51=> "00000000", 52 => "00110111", 53 => "00000000", 54 => "00111001", 
    55 to 56=> "00000000", 57 => "00111011", 58 to 59=> "00000000", 60 => "00111101", 
    61 => "00000000", 62 => "00111111", 63 => "01000001", 64 => "00000000", 
    65 => "01000011", 66 => "01000101", 67 => "01000111", 68 => "00000000", 
    69 => "01001001", 70 to 71=> "00000000", 72 => "01001011", 73 => "00000000", 
    74 => "01001101", 75 => "00000000", 76 => "01001111", 77 => "00000000", 
    78 => "01010001", 79 => "01010011", 80 to 81=> "00000000", 82 => "01010101", 
    83 => "01010111", 84 => "00000000", 85 => "01011001", 86 => "01011011", 
    87 => "01011101", 88 to 89=> "00000000", 90 => "01011111", 91 => "01100001", 
    92 => "01100011", 93 => "01100101", 94 to 96=> "00000000", 97 => "01100111", 
    98 to 99=> "00000000", 100 => "01101001", 101 => "01101011", 102 to 104=> "00000000", 
    105 => "01101101", 106 => "01101111", 107 to 110=> "00000000", 111 => "01110001", 
    112 to 113=> "00000000", 114 => "01110011", 115 => "00000000", 116 => "01110101", 
    117 => "01110111", 118 => "01111001", 119 => "01111011", 120 => "01111101", 
    121 => "01111111", 122 => "10000001", 123 to 124=> "00000000", 125 => "10000011", 
    126 => "10000101", 127 => "10000111", 128 to 131=> "00000000", 132 => "10001001", 
    133 to 135=> "00000000", 136 => "10001011", 137 => "10001101", 138 => "00000000", 
    139 => "10001111", 140 => "10010001", 141 to 142=> "00000000", 143 => "10010011", 
    144 => "10010101", 145 to 147=> "00000000", 148 => "10010111", 149 => "00000000", 
    150 => "10011001", 151 => "00000000", 152 => "10011011", 153 to 154=> "00000000", 
    155 => "10011101", 156 => "00000000", 157 => "10011111", 158 => "10100001", 
    159 => "10100011", 160 to 162=> "00000000", 163 => "10100101", 164 => "00000000", 
    165 => "10100111", 166 to 167=> "00000000", 168 => "10101001", 169 => "10101011", 
    170 => "00000000", 171 => "10101101", 172 => "00000000", 173 => "10101111", 
    174 => "10110001", 175 => "00000000", 176 => "10110011", 177 to 194=> "00000000" );


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

entity predict_ensemble_c3C is
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

architecture arch of predict_ensemble_c3C is
    component predict_ensemble_c3C_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c3C_rom_U :  component predict_ensemble_c3C_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


