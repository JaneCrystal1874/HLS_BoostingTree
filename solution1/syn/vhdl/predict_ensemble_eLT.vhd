-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eLT_rom is 
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


architecture rtl of predict_ensemble_eLT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 to 3=> "00000000", 4 => "00000110", 
    5 => "00000000", 6 => "00001000", 7 => "00000000", 8 => "00001010", 
    9 => "00001100", 10 => "00000000", 11 => "00001110", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 to 19=> "00000000", 20 => "00010110", 
    21 => "00011000", 22 => "00011010", 23 => "00011100", 24 to 25=> "00000000", 
    26 => "00011110", 27 => "00000000", 28 => "00100000", 29 => "00100010", 
    30 => "00100100", 31 => "00100110", 32 to 35=> "00000000", 36 => "00101000", 
    37 => "00000000", 38 => "00101010", 39 => "00000000", 40 => "00101100", 
    41 => "00000000", 42 => "00101110", 43 => "00110000", 44 => "00110010", 
    45 => "00110100", 46 => "00000000", 47 => "00110110", 48 => "00000000", 
    49 => "00111000", 50 => "00111010", 51 => "00000000", 52 => "00111100", 
    53 to 55=> "00000000", 56 => "00111110", 57 to 58=> "00000000", 59 => "01000000", 
    60 to 61=> "00000000", 62 => "01000010", 63 to 64=> "00000000", 65 => "01000100", 
    66 => "00000000", 67 => "01000110", 68 => "00000000", 69 => "01001000", 
    70 => "00000000", 71 => "01001010", 72 => "01001100", 73 => "01001110", 
    74 to 77=> "00000000", 78 => "01010000", 79 => "01010010", 80 => "01010100", 
    81 => "01010110", 82 => "00000000", 83 => "01011000", 84 to 85=> "00000000", 
    86 => "01011010", 87 => "00000000", 88 => "01011100", 89 => "01011110", 
    90 => "00000000", 91 => "01100000", 92 => "01100010", 93 => "01100100", 
    94 => "01100110", 95 => "00000000", 96 => "01101000", 97 => "00000000", 
    98 => "01101010", 99 => "01101100", 100 => "01101110", 101 => "01110000", 
    102 => "01110010", 103 => "01110100", 104 to 105=> "00000000", 106 => "01110110", 
    107 to 110=> "00000000", 111 => "01111000", 112 => "00000000", 113 => "01111010", 
    114 => "01111100", 115 to 116=> "00000000", 117 => "01111110", 118 => "10000000", 
    119 to 120=> "00000000", 121 => "10000010", 122 to 124=> "00000000", 125 => "10000100", 
    126 to 129=> "00000000", 130 => "10000110", 131 => "10001000", 132 => "00000000", 
    133 => "10001010", 134 => "00000000", 135 => "10001100", 136 => "00000000", 
    137 => "10001110", 138 => "10010000", 139 => "10010010", 140 => "00000000", 
    141 => "10010100", 142 => "10010110", 143 to 146=> "00000000", 147 => "10011000", 
    148 to 150=> "00000000", 151 => "10011010", 152 => "10011100", 153 to 155=> "00000000", 
    156 => "10011110", 157 => "10100000", 158 => "10100010", 159 => "00000000", 
    160 => "10100100", 161 => "00000000", 162 => "10100110", 163 to 194=> "00000000" );


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

entity predict_ensemble_eLT is
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

architecture arch of predict_ensemble_eLT is
    component predict_ensemble_eLT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eLT_rom_U :  component predict_ensemble_eLT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


