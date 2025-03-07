-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_clv_rom is 
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


architecture rtl of predict_ensemble_clv_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 to 7=> "00000000", 8 => "00001010", 9 => "00001100", 
    10 to 11=> "00000000", 12 => "00001110", 13 => "00000000", 14 => "00010000", 
    15 => "00010010", 16 => "00000000", 17 => "00010100", 18 => "00000000", 
    19 => "00010110", 20 => "00011000", 21 => "00000000", 22 => "00011010", 
    23 => "00000000", 24 => "00011100", 25 => "00011110", 26 => "00100000", 
    27 => "00100010", 28 to 30=> "00000000", 31 => "00100100", 32 => "00100110", 
    33 => "00101000", 34 => "00101010", 35 => "00101100", 36 => "00101110", 
    37 => "00110000", 38 => "00000000", 39 => "00110010", 40 to 41=> "00000000", 
    42 => "00110100", 43 => "00000000", 44 => "00110110", 45 to 46=> "00000000", 
    47 => "00111000", 48 to 49=> "00000000", 50 => "00111010", 51 => "00000000", 
    52 => "00111100", 53 to 54=> "00000000", 55 => "00111110", 56 => "01000000", 
    57 => "01000010", 58 => "01000100", 59 => "01000110", 60 => "01001000", 
    61 => "00000000", 62 => "01001010", 63 to 64=> "00000000", 65 => "01001100", 
    66 to 68=> "00000000", 69 => "01001110", 70 to 72=> "00000000", 73 => "01010000", 
    74 => "01010010", 75 => "01010100", 76 to 77=> "00000000", 78 => "01010110", 
    79 to 82=> "00000000", 83 => "01011000", 84 => "00000000", 85 => "01011010", 
    86 => "01011100", 87 => "01011110", 88 to 92=> "00000000", 93 => "01100000", 
    94 => "01100010", 95 => "01100100", 96 to 97=> "00000000", 98 => "01100110", 
    99 => "00000000", 100 => "01101000", 101 => "01101010", 102 => "01101100", 
    103 to 104=> "00000000", 105 => "01101110", 106 => "00000000", 107 => "01110000", 
    108 => "01110010", 109 => "01110100", 110 to 111=> "00000000", 112 => "01110110", 
    113 to 117=> "00000000", 118 => "01111000", 119 => "01111010", 120 => "01111100", 
    121 to 122=> "00000000", 123 => "01111110", 124 => "10000000", 125 => "00000000", 
    126 => "10000010", 127 to 128=> "00000000", 129 => "10000100", 130 => "00000000", 
    131 => "10000110", 132 => "00000000", 133 => "10001000", 134 => "00000000", 
    135 => "10001010", 136 => "10001100", 137 => "10001110", 138 => "10010000", 
    139 => "10010010", 140 => "10010100", 141 => "10010110", 142 => "10011000", 
    143 to 146=> "00000000", 147 => "10011010", 148 => "00000000", 149 => "10011100", 
    150 => "10011110", 151 => "00000000", 152 => "10100000", 153 to 154=> "00000000", 
    155 => "10100010", 156 => "10100100", 157 => "00000000", 158 => "10100110", 
    159 => "10101000", 160 to 161=> "00000000", 162 => "10101010", 163 => "00000000", 
    164 => "10101100", 165 => "10101110", 166 => "10110000", 167 to 171=> "00000000", 
    172 => "10110010", 173 to 175=> "00000000", 176 => "10110100", 177 => "00000000", 
    178 => "10110110", 179 to 180=> "00000000", 181 => "10111000", 182 => "10111010", 
    183 => "10111100", 184 to 194=> "00000000" );


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

entity predict_ensemble_clv is
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

architecture arch of predict_ensemble_clv is
    component predict_ensemble_clv_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_clv_rom_U :  component predict_ensemble_clv_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


