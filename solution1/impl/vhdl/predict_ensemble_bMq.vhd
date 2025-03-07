-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bMq_rom is 
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


architecture rtl of predict_ensemble_bMq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00000000", 6 => "00001000", 7 => "00001010", 
    8 => "00001100", 9 => "00001110", 10 => "00000000", 11 => "00010000", 
    12 => "00010010", 13 to 15=> "00000000", 16 => "00010100", 17 => "00000000", 
    18 => "00010110", 19 to 20=> "00000000", 21 => "00011000", 22 => "00011010", 
    23 => "00000000", 24 => "00011100", 25 => "00000000", 26 => "00011110", 
    27 => "00000000", 28 => "00100000", 29 to 31=> "00000000", 32 => "00100010", 
    33 => "00100100", 34 => "00000000", 35 => "00100110", 36 => "00000000", 
    37 => "00101000", 38 => "00101010", 39 to 41=> "00000000", 42 => "00101100", 
    43 => "00000000", 44 => "00101110", 45 => "00000000", 46 => "00110000", 
    47 => "00110010", 48 => "00000000", 49 => "00110100", 50 => "00000000", 
    51 => "00110110", 52 => "00000000", 53 => "00111000", 54 => "00111010", 
    55 to 56=> "00000000", 57 => "00111100", 58 to 59=> "00000000", 60 => "00111110", 
    61 => "01000000", 62 => "00000000", 63 => "01000010", 64 => "01000100", 
    65 => "01000110", 66 => "00000000", 67 => "01001000", 68 => "01001010", 
    69 => "01001100", 70 => "00000000", 71 => "01001110", 72 => "01010000", 
    73 => "00000000", 74 => "01010010", 75 => "00000000", 76 => "01010100", 
    77 => "01010110", 78 => "01011000", 79 => "01011010", 80 => "01011100", 
    81 to 82=> "00000000", 83 => "01011110", 84 => "01100000", 85 => "01100010", 
    86 => "01100100", 87 to 88=> "00000000", 89 => "01100110", 90 => "01101000", 
    91 => "01101010", 92 to 96=> "00000000", 97 => "01101100", 98 to 99=> "00000000", 
    100 => "01101110", 101 to 102=> "00000000", 103 => "01110000", 104 to 105=> "00000000", 
    106 => "01110010", 107 => "00000000", 108 => "01110100", 109 to 113=> "00000000", 
    114 => "01110110", 115 to 116=> "00000000", 117 => "01111000", 118 => "01111010", 
    119 => "01111100", 120 => "00000000", 121 => "01111110", 122 => "10000000", 
    123 => "10000010", 124 => "10000100", 125 => "10000110", 126 => "00000000", 
    127 => "10001000", 128 => "10001010", 129 => "10001100", 130 to 131=> "00000000", 
    132 => "10001110", 133 => "00000000", 134 => "10010000", 135 to 136=> "00000000", 
    137 => "10010010", 138 => "10010100", 139 to 140=> "00000000", 141 => "10010110", 
    142 => "10011000", 143 to 147=> "00000000", 148 => "10011010", 149 => "10011100", 
    150 => "00000000", 151 => "10011110", 152 => "10100000", 153 => "10100010", 
    154 => "10100100", 155 => "10100110", 156 to 160=> "00000000", 161 => "10101000", 
    162 to 163=> "00000000", 164 => "10101010", 165 => "00000000", 166 => "10101100", 
    167 to 168=> "00000000", 169 => "10101110", 170 => "10110000", 171 => "00000000", 
    172 => "10110010", 173 => "10110100", 174 => "10110110", 175 to 180=> "00000000", 
    181 => "10111000", 182 to 194=> "00000000" );


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

entity predict_ensemble_bMq is
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

architecture arch of predict_ensemble_bMq is
    component predict_ensemble_bMq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bMq_rom_U :  component predict_ensemble_bMq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


