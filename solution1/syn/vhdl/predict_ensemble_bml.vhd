-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bml_rom is 
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


architecture rtl of predict_ensemble_bml_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 7=> "00000000", 8 => "00001001", 9 => "00001011", 
    10 => "00001101", 11 => "00001111", 12 to 13=> "00000000", 14 => "00010001", 
    15 => "00010011", 16 => "00010101", 17 => "00010111", 18 => "00000000", 
    19 => "00011001", 20 => "00011011", 21 => "00000000", 22 => "00011101", 
    23 => "00011111", 24 => "00100001", 25 to 26=> "00000000", 27 => "00100011", 
    28 to 29=> "00000000", 30 => "00100101", 31 to 32=> "00000000", 33 => "00100111", 
    34 to 35=> "00000000", 36 => "00101001", 37 => "00000000", 38 => "00101011", 
    39 => "00101101", 40 to 41=> "00000000", 42 => "00101111", 43 => "00110001", 
    44 => "00000000", 45 => "00110011", 46 => "00110101", 47 => "00110111", 
    48 => "00111001", 49 => "00000000", 50 => "00111011", 51 => "00000000", 
    52 => "00111101", 53 => "00111111", 54 => "01000001", 55 => "01000011", 
    56 to 62=> "00000000", 63 => "01000101", 64 to 67=> "00000000", 68 => "01000111", 
    69 => "00000000", 70 => "01001001", 71 => "00000000", 72 => "01001011", 
    73 to 74=> "00000000", 75 => "01001101", 76 => "00000000", 77 => "01001111", 
    78 => "01010001", 79 to 81=> "00000000", 82 => "01010011", 83 => "01010101", 
    84 => "01010111", 85 => "01011001", 86 => "01011011", 87 => "01011101", 
    88 => "01011111", 89 => "01100001", 90 => "01100011", 91 => "00000000", 
    92 => "01100101", 93 => "01100111", 94 to 95=> "00000000", 96 => "01101001", 
    97 => "00000000", 98 => "01101011", 99 => "00000000", 100 => "01101101", 
    101 => "01101111", 102 to 104=> "00000000", 105 => "01110001", 106 to 109=> "00000000", 
    110 => "01110011", 111 => "01110101", 112 => "00000000", 113 => "01110111", 
    114 => "01111001", 115 => "00000000", 116 => "01111011", 117 => "00000000", 
    118 => "01111101", 119 to 121=> "00000000", 122 => "01111111", 123 => "00000000", 
    124 => "10000001", 125 => "10000011", 126 => "00000000", 127 => "10000101", 
    128 => "10000111", 129 => "10001001", 130 => "10001011", 131 to 132=> "00000000", 
    133 => "10001101", 134 to 136=> "00000000", 137 => "10001111", 138 => "10010001", 
    139 => "10010011", 140 => "10010101", 141 => "10010111", 142 to 150=> "00000000", 
    151 => "10011001", 152 to 153=> "00000000", 154 => "10011011", 155 => "00000000", 
    156 => "10011101", 157 => "00000000", 158 => "10011111", 159 => "10100001", 
    160 => "10100011", 161 => "10100101", 162 => "00000000", 163 => "10100111", 
    164 => "00000000", 165 => "10101001", 166 => "10101011", 167 to 168=> "00000000", 
    169 => "10101101", 170 => "00000000", 171 => "10101111", 172 => "00000000", 
    173 => "10110001", 174 => "10110011", 175 to 176=> "00000000", 177 => "10110101", 
    178 to 179=> "00000000", 180 => "10110111", 181 to 182=> "00000000", 183 => "10111001", 
    184 => "00000000", 185 => "10111011", 186 to 194=> "00000000" );


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

entity predict_ensemble_bml is
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

architecture arch of predict_ensemble_bml is
    component predict_ensemble_bml_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bml_rom_U :  component predict_ensemble_bml_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


