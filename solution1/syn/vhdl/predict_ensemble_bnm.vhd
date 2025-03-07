-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bnm_rom is 
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


architecture rtl of predict_ensemble_bnm_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 7=> "00000000", 8 => "00001010", 9 => "00001100", 
    10 => "00001110", 11 => "00010000", 12 to 13=> "00000000", 14 => "00010010", 
    15 => "00010100", 16 => "00010110", 17 => "00011000", 18 => "00000000", 
    19 => "00011010", 20 => "00011100", 21 => "00000000", 22 => "00011110", 
    23 => "00100000", 24 => "00100010", 25 to 26=> "00000000", 27 => "00100100", 
    28 to 29=> "00000000", 30 => "00100110", 31 to 32=> "00000000", 33 => "00101000", 
    34 to 35=> "00000000", 36 => "00101010", 37 => "00000000", 38 => "00101100", 
    39 => "00101110", 40 to 41=> "00000000", 42 => "00110000", 43 => "00110010", 
    44 => "00000000", 45 => "00110100", 46 => "00110110", 47 => "00111000", 
    48 => "00111010", 49 => "00000000", 50 => "00111100", 51 => "00000000", 
    52 => "00111110", 53 => "01000000", 54 => "01000010", 55 => "01000100", 
    56 to 62=> "00000000", 63 => "01000110", 64 to 67=> "00000000", 68 => "01001000", 
    69 => "00000000", 70 => "01001010", 71 => "00000000", 72 => "01001100", 
    73 to 74=> "00000000", 75 => "01001110", 76 => "00000000", 77 => "01010000", 
    78 => "01010010", 79 to 81=> "00000000", 82 => "01010100", 83 => "01010110", 
    84 => "01011000", 85 => "01011010", 86 => "01011100", 87 => "01011110", 
    88 => "01100000", 89 => "01100010", 90 => "01100100", 91 => "00000000", 
    92 => "01100110", 93 => "01101000", 94 to 95=> "00000000", 96 => "01101010", 
    97 => "00000000", 98 => "01101100", 99 => "00000000", 100 => "01101110", 
    101 => "01110000", 102 to 104=> "00000000", 105 => "01110010", 106 to 109=> "00000000", 
    110 => "01110100", 111 => "01110110", 112 => "00000000", 113 => "01111000", 
    114 => "01111010", 115 => "00000000", 116 => "01111100", 117 => "00000000", 
    118 => "01111110", 119 to 121=> "00000000", 122 => "10000000", 123 => "00000000", 
    124 => "10000010", 125 => "10000100", 126 => "00000000", 127 => "10000110", 
    128 => "10001000", 129 => "10001010", 130 => "10001100", 131 to 132=> "00000000", 
    133 => "10001110", 134 to 136=> "00000000", 137 => "10010000", 138 => "10010010", 
    139 => "10010100", 140 => "10010110", 141 => "10011000", 142 to 150=> "00000000", 
    151 => "10011010", 152 to 153=> "00000000", 154 => "10011100", 155 => "00000000", 
    156 => "10011110", 157 => "00000000", 158 => "10100000", 159 => "10100010", 
    160 => "10100100", 161 => "10100110", 162 => "00000000", 163 => "10101000", 
    164 => "00000000", 165 => "10101010", 166 => "10101100", 167 to 168=> "00000000", 
    169 => "10101110", 170 => "00000000", 171 => "10110000", 172 => "00000000", 
    173 => "10110010", 174 => "10110100", 175 to 176=> "00000000", 177 => "10110110", 
    178 to 179=> "00000000", 180 => "10111000", 181 to 182=> "00000000", 183 => "10111010", 
    184 => "00000000", 185 => "10111100", 186 to 194=> "00000000" );


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

entity predict_ensemble_bnm is
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

architecture arch of predict_ensemble_bnm is
    component predict_ensemble_bnm_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bnm_rom_U :  component predict_ensemble_bnm_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


