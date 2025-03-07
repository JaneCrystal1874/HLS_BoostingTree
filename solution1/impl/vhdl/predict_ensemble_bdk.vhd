-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bdk_rom is 
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


architecture rtl of predict_ensemble_bdk_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00001010", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 => "00000000", 11 => "00010000", 
    12 => "00010010", 13 => "00000000", 14 => "00010100", 15 => "00010110", 
    16 => "00000000", 17 => "00011000", 18 => "00011010", 19 to 22=> "00000000", 
    23 => "00011100", 24 => "00000000", 25 => "00011110", 26 to 28=> "00000000", 
    29 => "00100000", 30 => "00100010", 31 => "00000000", 32 => "00100100", 
    33 => "00100110", 34 => "00101000", 35 to 38=> "00000000", 39 => "00101010", 
    40 => "00000000", 41 => "00101100", 42 => "00101110", 43 => "00110000", 
    44 to 45=> "00000000", 46 => "00110010", 47 => "00000000", 48 => "00110100", 
    49 => "00000000", 50 => "00110110", 51 => "00000000", 52 => "00111000", 
    53 => "00111010", 54 => "00111100", 55 to 56=> "00000000", 57 => "00111110", 
    58 => "01000000", 59 to 60=> "00000000", 61 => "01000010", 62 to 63=> "00000000", 
    64 => "01000100", 65 => "01000110", 66 => "00000000", 67 => "01001000", 
    68 => "01001010", 69 => "01001100", 70 => "01001110", 71 => "00000000", 
    72 => "01010000", 73 to 74=> "00000000", 75 => "01010010", 76 => "01010100", 
    77 => "00000000", 78 => "01010110", 79 => "01011000", 80 => "00000000", 
    81 => "01011010", 82 to 83=> "00000000", 84 => "01011100", 85 => "01011110", 
    86 => "00000000", 87 => "01100000", 88 => "00000000", 89 => "01100010", 
    90 => "01100100", 91 => "00000000", 92 => "01100110", 93 => "00000000", 
    94 => "01101000", 95 => "01101010", 96 to 98=> "00000000", 99 => "01101100", 
    100 => "01101110", 101 => "00000000", 102 => "01110000", 103 => "01110010", 
    104 => "01110100", 105 to 106=> "00000000", 107 => "01110110", 108 => "00000000", 
    109 => "01111000", 110 to 111=> "00000000", 112 => "01111010", 113 to 114=> "00000000", 
    115 => "01111100", 116 => "01111110", 117 => "10000000", 118 to 120=> "00000000", 
    121 => "10000010", 122 => "10000100", 123 to 124=> "00000000", 125 => "10000110", 
    126 => "00000000", 127 => "10001000", 128 => "00000000", 129 => "10001010", 
    130 => "10001100", 131 => "00000000", 132 => "10001110", 133 => "10010000", 
    134 => "10010010", 135 to 140=> "00000000", 141 => "10010100", 142 => "10010110", 
    143 => "00000000", 144 => "10011000", 145 => "10011010", 146 => "10011100", 
    147 => "10011110", 148 => "10100000", 149 to 151=> "00000000", 152 => "10100010", 
    153 to 156=> "00000000", 157 => "10100100", 158 => "10100110", 159 => "10101000", 
    160 to 162=> "00000000", 163 => "10101010", 164 => "10101100", 165 => "00000000", 
    166 => "10101110", 167 => "00000000", 168 => "10110000", 169 to 170=> "00000000", 
    171 => "10110010", 172 => "00000000", 173 => "10110100", 174 => "10110110", 
    175 => "00000000", 176 => "10111000", 177 to 181=> "00000000", 182 => "10111010", 
    183 to 185=> "00000000", 186 => "10111100", 187 to 194=> "00000000" );


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

entity predict_ensemble_bdk is
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

architecture arch of predict_ensemble_bdk is
    component predict_ensemble_bdk_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bdk_rom_U :  component predict_ensemble_bdk_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


