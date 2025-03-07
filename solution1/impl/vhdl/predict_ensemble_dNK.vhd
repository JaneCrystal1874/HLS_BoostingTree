-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dNK_rom is 
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


architecture rtl of predict_ensemble_dNK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 to 5=> "00000000", 6 => "00001010", 7 => "00001100", 8 => "00000000", 
    9 => "00001110", 10 => "00010000", 11 to 12=> "00000000", 13 => "00010010", 
    14 => "00010100", 15 => "00010110", 16 => "00011000", 17 => "00000000", 
    18 => "00011010", 19 => "00000000", 20 => "00011100", 21 to 22=> "00000000", 
    23 => "00011110", 24 => "00100000", 25 => "00100010", 26 => "00100100", 
    27 to 29=> "00000000", 30 => "00100110", 31 => "00101000", 32 => "00101010", 
    33 => "00101100", 34 => "00101110", 35 => "00110000", 36 => "00110010", 
    37 => "00000000", 38 => "00110100", 39 to 41=> "00000000", 42 => "00110110", 
    43 => "00111000", 44 to 45=> "00000000", 46 => "00111010", 47 => "00111100", 
    48 => "00111110", 49 => "00000000", 50 => "01000000", 51 to 52=> "00000000", 
    53 => "01000010", 54 => "01000100", 55 => "01000110", 56 => "00000000", 
    57 => "01001000", 58 => "00000000", 59 => "01001010", 60 => "01001100", 
    61 => "00000000", 62 => "01001110", 63 => "01010000", 64 to 67=> "00000000", 
    68 => "01010010", 69 => "00000000", 70 => "01010100", 71 => "01010110", 
    72 => "01011000", 73 => "01011010", 74 => "01011100", 75 => "00000000", 
    76 => "01011110", 77 to 78=> "00000000", 79 => "01100000", 80 => "01100010", 
    81 => "00000000", 82 => "01100100", 83 => "01100110", 84 => "01101000", 
    85 => "00000000", 86 => "01101010", 87 to 89=> "00000000", 90 => "01101100", 
    91 => "01101110", 92 => "01110000", 93 to 94=> "00000000", 95 => "01110010", 
    96 to 99=> "00000000", 100 => "01110100", 101 to 103=> "00000000", 104 => "01110110", 
    105 to 106=> "00000000", 107 => "01111000", 108 => "00000000", 109 => "01111010", 
    110 to 115=> "00000000", 116 => "01111100", 117 to 118=> "00000000", 119 => "01111110", 
    120 => "10000000", 121 to 123=> "00000000", 124 => "10000010", 125 => "10000100", 
    126 => "00000000", 127 => "10000110", 128 to 129=> "00000000", 130 => "10001000", 
    131 => "10001010", 132 => "10001100", 133 => "00000000", 134 => "10001110", 
    135 to 136=> "00000000", 137 => "10010000", 138 => "00000000", 139 => "10010010", 
    140 => "00000000", 141 => "10010100", 142 => "10010110", 143 to 146=> "00000000", 
    147 => "10011000", 148 => "10011010", 149 => "10011100", 150 => "10011110", 
    151 => "10100000", 152 => "10100010", 153 to 154=> "00000000", 155 => "10100100", 
    156 => "10100110", 157 => "10101000", 158 => "00000000", 159 => "10101010", 
    160 => "10101100", 161 => "00000000", 162 => "10101110", 163 => "10110000", 
    164 => "10110010", 165 to 168=> "00000000", 169 => "10110100", 170 to 171=> "00000000", 
    172 => "10110110", 173 to 194=> "00000000" );


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

entity predict_ensemble_dNK is
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

architecture arch of predict_ensemble_dNK is
    component predict_ensemble_dNK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dNK_rom_U :  component predict_ensemble_dNK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


