-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ckv_rom is 
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


architecture rtl of predict_ensemble_ckv_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 to 7=> "00000000", 8 => "00001001", 9 => "00001011", 
    10 to 11=> "00000000", 12 => "00001101", 13 => "00000000", 14 => "00001111", 
    15 => "00010001", 16 => "00000000", 17 => "00010011", 18 => "00000000", 
    19 => "00010101", 20 => "00010111", 21 => "00000000", 22 => "00011001", 
    23 => "00000000", 24 => "00011011", 25 => "00011101", 26 => "00011111", 
    27 => "00100001", 28 to 30=> "00000000", 31 => "00100011", 32 => "00100101", 
    33 => "00100111", 34 => "00101001", 35 => "00101011", 36 => "00101101", 
    37 => "00101111", 38 => "00000000", 39 => "00110001", 40 to 41=> "00000000", 
    42 => "00110011", 43 => "00000000", 44 => "00110101", 45 to 46=> "00000000", 
    47 => "00110111", 48 to 49=> "00000000", 50 => "00111001", 51 => "00000000", 
    52 => "00111011", 53 to 54=> "00000000", 55 => "00111101", 56 => "00111111", 
    57 => "01000001", 58 => "01000011", 59 => "01000101", 60 => "01000111", 
    61 => "00000000", 62 => "01001001", 63 to 64=> "00000000", 65 => "01001011", 
    66 to 68=> "00000000", 69 => "01001101", 70 to 72=> "00000000", 73 => "01001111", 
    74 => "01010001", 75 => "01010011", 76 to 77=> "00000000", 78 => "01010101", 
    79 to 82=> "00000000", 83 => "01010111", 84 => "00000000", 85 => "01011001", 
    86 => "01011011", 87 => "01011101", 88 to 92=> "00000000", 93 => "01011111", 
    94 => "01100001", 95 => "01100011", 96 to 97=> "00000000", 98 => "01100101", 
    99 => "00000000", 100 => "01100111", 101 => "01101001", 102 => "01101011", 
    103 to 104=> "00000000", 105 => "01101101", 106 => "00000000", 107 => "01101111", 
    108 => "01110001", 109 => "01110011", 110 to 111=> "00000000", 112 => "01110101", 
    113 to 117=> "00000000", 118 => "01110111", 119 => "01111001", 120 => "01111011", 
    121 to 122=> "00000000", 123 => "01111101", 124 => "01111111", 125 => "00000000", 
    126 => "10000001", 127 to 128=> "00000000", 129 => "10000011", 130 => "00000000", 
    131 => "10000101", 132 => "00000000", 133 => "10000111", 134 => "00000000", 
    135 => "10001001", 136 => "10001011", 137 => "10001101", 138 => "10001111", 
    139 => "10010001", 140 => "10010011", 141 => "10010101", 142 => "10010111", 
    143 to 146=> "00000000", 147 => "10011001", 148 => "00000000", 149 => "10011011", 
    150 => "10011101", 151 => "00000000", 152 => "10011111", 153 to 154=> "00000000", 
    155 => "10100001", 156 => "10100011", 157 => "00000000", 158 => "10100101", 
    159 => "10100111", 160 to 161=> "00000000", 162 => "10101001", 163 => "00000000", 
    164 => "10101011", 165 => "10101101", 166 => "10101111", 167 to 171=> "00000000", 
    172 => "10110001", 173 to 175=> "00000000", 176 => "10110011", 177 => "00000000", 
    178 => "10110101", 179 to 180=> "00000000", 181 => "10110111", 182 => "10111001", 
    183 => "10111011", 184 to 194=> "00000000" );


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

entity predict_ensemble_ckv is
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

architecture arch of predict_ensemble_ckv is
    component predict_ensemble_ckv_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ckv_rom_U :  component predict_ensemble_ckv_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


