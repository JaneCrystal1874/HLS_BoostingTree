-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ffY_rom is 
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


architecture rtl of predict_ensemble_ffY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00001100", 7 => "00001110", 
    8 => "00010000", 9 to 11=> "00000000", 12 => "00010010", 13 => "00010100", 
    14 => "00000000", 15 => "00010110", 16 => "00011000", 17 => "00000000", 
    18 => "00011010", 19 => "00011100", 20 => "00000000", 21 => "00011110", 
    22 => "00100000", 23 => "00000000", 24 => "00100010", 25 => "00100100", 
    26 => "00000000", 27 => "00100110", 28 => "00000000", 29 => "00101000", 
    30 => "00000000", 31 => "00101010", 32 => "00101100", 33 => "00101110", 
    34 => "00110000", 35 => "00110010", 36 => "00110100", 37 => "00110110", 
    38 => "00111000", 39 => "00111010", 40 to 43=> "00000000", 44 => "00111100", 
    45 => "00000000", 46 => "00111110", 47 => "00000000", 48 => "01000000", 
    49 => "01000010", 50 => "01000100", 51 => "01000110", 52 => "01001000", 
    53 => "00000000", 54 => "01001010", 55 => "01001100", 56 => "00000000", 
    57 => "01001110", 58 => "01010000", 59 to 60=> "00000000", 61 => "01010010", 
    62 => "01010100", 63 => "01010110", 64 => "01011000", 65 => "01011010", 
    66 to 70=> "00000000", 71 => "01011100", 72 => "00000000", 73 => "01011110", 
    74 => "01100000", 75 to 76=> "00000000", 77 => "01100010", 78 to 83=> "00000000", 
    84 => "01100100", 85 => "01100110", 86 => "01101000", 87 => "00000000", 
    88 => "01101010", 89 => "01101100", 90 => "00000000", 91 => "01101110", 
    92 to 93=> "00000000", 94 => "01110000", 95 => "01110010", 96 => "01110100", 
    97 => "00000000", 98 => "01110110", 99 to 104=> "00000000", 105 => "01111000", 
    106 => "01111010", 107 to 108=> "00000000", 109 => "01111100", 110 => "01111110", 
    111 to 113=> "00000000", 114 => "10000000", 115 => "10000010", 116 => "10000100", 
    117 to 121=> "00000000", 122 => "10000110", 123 => "10001000", 124 => "10001010", 
    125 => "00000000", 126 => "10001100", 127 => "10001110", 128 to 133=> "00000000", 
    134 => "10010000", 135 to 136=> "00000000", 137 => "10010010", 138 to 139=> "00000000", 
    140 => "10010100", 141 => "10010110", 142 => "10011000", 143 to 148=> "00000000", 
    149 => "10011010", 150 => "00000000", 151 => "10011100", 152 to 154=> "00000000", 
    155 => "10011110", 156 => "00000000", 157 => "10100000", 158 => "10100010", 
    159 => "10100100", 160 to 161=> "00000000", 162 => "10100110", 163 => "10101000", 
    164 => "10101010", 165 to 166=> "00000000", 167 => "10101100", 168 => "10101110", 
    169 to 171=> "00000000", 172 => "10110000", 173 => "00000000", 174 => "10110010", 
    175 to 194=> "00000000" );


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

entity predict_ensemble_ffY is
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

architecture arch of predict_ensemble_ffY is
    component predict_ensemble_ffY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ffY_rom_U :  component predict_ensemble_ffY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


