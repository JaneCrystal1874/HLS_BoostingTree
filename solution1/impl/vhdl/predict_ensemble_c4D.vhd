-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c4D_rom is 
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


architecture rtl of predict_ensemble_c4D_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00000000", 
    8 => "00001100", 9 => "00001110", 10 => "00010000", 11 => "00000000", 
    12 => "00010010", 13 => "00000000", 14 => "00010100", 15 to 17=> "00000000", 
    18 => "00010110", 19 => "00000000", 20 => "00011000", 21 to 23=> "00000000", 
    24 => "00011010", 25 => "00000000", 26 => "00011100", 27 => "00000000", 
    28 => "00011110", 29 => "00100000", 30 => "00000000", 31 => "00100010", 
    32 => "00000000", 33 => "00100100", 34 => "00000000", 35 => "00100110", 
    36 => "00000000", 37 => "00101000", 38 => "00101010", 39 to 41=> "00000000", 
    42 => "00101100", 43 => "00101110", 44 => "00000000", 45 => "00110000", 
    46 => "00000000", 47 => "00110010", 48 => "00110100", 49 => "00110110", 
    50 to 51=> "00000000", 52 => "00111000", 53 => "00000000", 54 => "00111010", 
    55 to 56=> "00000000", 57 => "00111100", 58 to 59=> "00000000", 60 => "00111110", 
    61 => "00000000", 62 => "01000000", 63 => "01000010", 64 => "00000000", 
    65 => "01000100", 66 => "01000110", 67 => "01001000", 68 => "00000000", 
    69 => "01001010", 70 to 71=> "00000000", 72 => "01001100", 73 => "00000000", 
    74 => "01001110", 75 => "00000000", 76 => "01010000", 77 => "00000000", 
    78 => "01010010", 79 => "01010100", 80 to 81=> "00000000", 82 => "01010110", 
    83 => "01011000", 84 => "00000000", 85 => "01011010", 86 => "01011100", 
    87 => "01011110", 88 to 89=> "00000000", 90 => "01100000", 91 => "01100010", 
    92 => "01100100", 93 => "01100110", 94 to 96=> "00000000", 97 => "01101000", 
    98 to 99=> "00000000", 100 => "01101010", 101 => "01101100", 102 to 104=> "00000000", 
    105 => "01101110", 106 => "01110000", 107 to 110=> "00000000", 111 => "01110010", 
    112 to 113=> "00000000", 114 => "01110100", 115 => "00000000", 116 => "01110110", 
    117 => "01111000", 118 => "01111010", 119 => "01111100", 120 => "01111110", 
    121 => "10000000", 122 => "10000010", 123 to 124=> "00000000", 125 => "10000100", 
    126 => "10000110", 127 => "10001000", 128 to 131=> "00000000", 132 => "10001010", 
    133 to 135=> "00000000", 136 => "10001100", 137 => "10001110", 138 => "00000000", 
    139 => "10010000", 140 => "10010010", 141 to 142=> "00000000", 143 => "10010100", 
    144 => "10010110", 145 to 147=> "00000000", 148 => "10011000", 149 => "00000000", 
    150 => "10011010", 151 => "00000000", 152 => "10011100", 153 to 154=> "00000000", 
    155 => "10011110", 156 => "00000000", 157 => "10100000", 158 => "10100010", 
    159 => "10100100", 160 to 162=> "00000000", 163 => "10100110", 164 => "00000000", 
    165 => "10101000", 166 to 167=> "00000000", 168 => "10101010", 169 => "10101100", 
    170 => "00000000", 171 => "10101110", 172 => "00000000", 173 => "10110000", 
    174 => "10110010", 175 => "00000000", 176 => "10110100", 177 to 194=> "00000000" );


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

entity predict_ensemble_c4D is
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

architecture arch of predict_ensemble_c4D is
    component predict_ensemble_c4D_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c4D_rom_U :  component predict_ensemble_c4D_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


