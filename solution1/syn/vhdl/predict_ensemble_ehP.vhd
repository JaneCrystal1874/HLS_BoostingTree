-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ehP_rom is 
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


architecture rtl of predict_ensemble_ehP_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00001100", 7 => "00000000", 
    8 => "00001110", 9 => "00000000", 10 => "00010000", 11 => "00000000", 
    12 => "00010010", 13 => "00000000", 14 => "00010100", 15 => "00010110", 
    16 => "00011000", 17 to 19=> "00000000", 20 => "00011010", 21 => "00011100", 
    22 => "00000000", 23 => "00011110", 24 to 26=> "00000000", 27 => "00100000", 
    28 to 29=> "00000000", 30 => "00100010", 31 => "00000000", 32 => "00100100", 
    33 => "00100110", 34 => "00101000", 35 => "00101010", 36 => "00000000", 
    37 => "00101100", 38 to 39=> "00000000", 40 => "00101110", 41 => "00110000", 
    42 => "00110010", 43 => "00110100", 44 to 45=> "00000000", 46 => "00110110", 
    47 => "00000000", 48 => "00111000", 49 => "00111010", 50 to 51=> "00000000", 
    52 => "00111100", 53 => "00000000", 54 => "00111110", 55 to 59=> "00000000", 
    60 => "01000000", 61 => "00000000", 62 => "01000010", 63 => "01000100", 
    64 => "01000110", 65 => "00000000", 66 => "01001000", 67 => "01001010", 
    68 to 69=> "00000000", 70 => "01001100", 71 => "01001110", 72 => "01010000", 
    73 to 75=> "00000000", 76 => "01010010", 77 to 78=> "00000000", 79 => "01010100", 
    80 => "01010110", 81 => "01011000", 82 to 84=> "00000000", 85 => "01011010", 
    86 => "01011100", 87 => "01011110", 88 => "01100000", 89 => "01100010", 
    90 => "00000000", 91 => "01100100", 92 => "00000000", 93 => "01100110", 
    94 to 96=> "00000000", 97 => "01101000", 98 => "00000000", 99 => "01101010", 
    100 => "01101100", 101 => "01101110", 102 to 105=> "00000000", 106 => "01110000", 
    107 to 108=> "00000000", 109 => "01110010", 110 to 111=> "00000000", 112 => "01110100", 
    113 => "01110110", 114 => "01111000", 115 => "01111010", 116 => "01111100", 
    117 to 118=> "00000000", 119 => "01111110", 120 => "10000000", 121 to 123=> "00000000", 
    124 => "10000010", 125 to 128=> "00000000", 129 => "10000100", 130 to 131=> "00000000", 
    132 => "10000110", 133 => "00000000", 134 => "10001000", 135 => "10001010", 
    136 => "10001100", 137 to 139=> "00000000", 140 => "10001110", 141 => "00000000", 
    142 => "10010000", 143 => "10010010", 144 => "10010100", 145 => "10010110", 
    146 => "10011000", 147 to 148=> "00000000", 149 => "10011010", 150 to 152=> "00000000", 
    153 => "10011100", 154 => "00000000", 155 => "10011110", 156 => "00000000", 
    157 => "10100000", 158 => "00000000", 159 => "10100010", 160 to 161=> "00000000", 
    162 => "10100100", 163 => "10100110", 164 => "10101000", 165 => "10101010", 
    166 to 168=> "00000000", 169 => "10101100", 170 to 194=> "00000000" );


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

entity predict_ensemble_ehP is
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

architecture arch of predict_ensemble_ehP is
    component predict_ensemble_ehP_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ehP_rom_U :  component predict_ensemble_ehP_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


