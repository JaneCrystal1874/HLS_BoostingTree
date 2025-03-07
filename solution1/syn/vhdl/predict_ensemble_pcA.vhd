-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_pcA_rom is 
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


architecture rtl of predict_ensemble_pcA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00001100", 7 to 10=> "00000000", 
    11 => "00001110", 12 => "00010000", 13 => "00000000", 14 => "00010010", 
    15 to 16=> "00000000", 17 => "00010100", 18 => "00010110", 19 => "00000000", 
    20 => "00011000", 21 => "00011010", 22 => "00011100", 23 => "00011110", 
    24 => "00100000", 25 => "00100010", 26 => "00100100", 27 => "00100110", 
    28 => "00101000", 29 to 32=> "00000000", 33 => "00101010", 34 => "00101100", 
    35 => "00101110", 36 to 37=> "00000000", 38 => "00110000", 39 to 46=> "00000000", 
    47 => "00110010", 48 => "00110100", 49 to 50=> "00000000", 51 => "00110110", 
    52 => "00111000", 53 => "00111010", 54 => "00000000", 55 => "00111100", 
    56 => "00111110", 57 => "01000000", 58 => "01000010", 59 => "01000100", 
    60 => "00000000", 61 => "01000110", 62 to 66=> "00000000", 67 => "01001000", 
    68 => "01001010", 69 => "01001100", 70 to 72=> "00000000", 73 => "01001110", 
    74 => "01010000", 75 => "01010010", 76 => "00000000", 77 => "01010100", 
    78 => "01010110", 79 => "00000000", 80 => "01011000", 81 => "00000000", 
    82 => "01011010", 83 => "01011100", 84 => "01011110", 85 => "00000000", 
    86 => "01100000", 87 => "01100010", 88 => "01100100", 89 => "01100110", 
    90 => "01101000", 91 => "01101010", 92 to 93=> "00000000", 94 => "01101100", 
    95 => "01101110", 96 => "00000000", 97 => "01110000", 98 => "01110010", 
    99 to 100=> "00000000", 101 => "01110100", 102 to 103=> "00000000", 104 => "01110110", 
    105 => "01111000", 106 => "00000000", 107 => "01111010", 108 => "01111100", 
    109 to 113=> "00000000", 114 => "01111110", 115 => "00000000", 116 => "10000000", 
    117 => "00000000", 118 => "10000010", 119 => "00000000", 120 => "10000100", 
    121 => "10000110", 122 => "10001000", 123 to 124=> "00000000", 125 => "10001010", 
    126 => "10001100", 127 to 128=> "00000000", 129 => "10001110", 130 => "10010000", 
    131 to 133=> "00000000", 134 => "10010010", 135 => "00000000", 136 => "10010100", 
    137 to 140=> "00000000", 141 => "10010110", 142 => "10011000", 143 => "10011010", 
    144 => "10011100", 145 => "00000000", 146 => "10011110", 147 to 150=> "00000000", 
    151 => "10100000", 152 => "10100010", 153 to 155=> "00000000", 156 => "10100100", 
    157 => "10100110", 158 => "10101000", 159 to 161=> "00000000", 162 => "10101010", 
    163 => "10101100", 164 to 168=> "00000000", 169 => "10101110", 170 => "10110000", 
    171 to 172=> "00000000", 173 => "10110010", 174 => "10110100", 175 => "00000000", 
    176 => "10110110", 177 to 181=> "00000000", 182 => "10111000", 183 to 194=> "00000000" );


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

entity predict_ensemble_pcA is
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

architecture arch of predict_ensemble_pcA is
    component predict_ensemble_pcA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_pcA_rom_U :  component predict_ensemble_pcA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


