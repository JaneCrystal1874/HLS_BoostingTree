-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_faY_rom is 
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


architecture rtl of predict_ensemble_faY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00001010", 5 => "00000000", 6 => "00001100", 7 => "00001110", 
    8 => "00000000", 9 => "00010000", 10 => "00000000", 11 => "00010010", 
    12 to 16=> "00000000", 17 => "00010100", 18 => "00010110", 19 => "00011000", 
    20 => "00000000", 21 => "00011010", 22 => "00011100", 23 to 24=> "00000000", 
    25 => "00011110", 26 => "00100000", 27 => "00100010", 28 => "00100100", 
    29 => "00000000", 30 => "00100110", 31 => "00000000", 32 => "00101000", 
    33 => "00101010", 34 => "00101100", 35 => "00000000", 36 => "00101110", 
    37 => "00110000", 38 to 41=> "00000000", 42 => "00110010", 43 to 44=> "00000000", 
    45 => "00110100", 46 to 49=> "00000000", 50 => "00110110", 51 => "00111000", 
    52 => "00111010", 53 => "00111100", 54 => "00111110", 55 to 56=> "00000000", 
    57 => "01000000", 58 => "01000010", 59 => "01000100", 60 => "01000110", 
    61 => "01001000", 62 => "00000000", 63 => "01001010", 64 to 65=> "00000000", 
    66 => "01001100", 67 => "01001110", 68 => "00000000", 69 => "01010000", 
    70 to 73=> "00000000", 74 => "01010010", 75 => "01010100", 76 => "01010110", 
    77 => "01011000", 78 => "00000000", 79 => "01011010", 80 to 84=> "00000000", 
    85 => "01011100", 86 => "01011110", 87 => "01100000", 88 => "01100010", 
    89 => "00000000", 90 => "01100100", 91 => "01100110", 92 => "01101000", 
    93 => "01101010", 94 => "01101100", 95 => "01101110", 96 to 101=> "00000000", 
    102 => "01110000", 103 to 107=> "00000000", 108 => "01110010", 109 => "00000000", 
    110 => "01110100", 111 => "01110110", 112 => "01111000", 113 to 114=> "00000000", 
    115 => "01111010", 116 => "01111100", 117 to 118=> "00000000", 119 => "01111110", 
    120 => "10000000", 121 to 123=> "00000000", 124 => "10000010", 125 => "00000000", 
    126 => "10000100", 127 => "10000110", 128 => "10001000", 129 => "10001010", 
    130 => "10001100", 131 to 133=> "00000000", 134 => "10001110", 135 => "10010000", 
    136 => "10010010", 137 => "10010100", 138 => "00000000", 139 => "10010110", 
    140 => "10011000", 141 to 143=> "00000000", 144 => "10011010", 145 => "00000000", 
    146 => "10011100", 147 => "10011110", 148 => "10100000", 149 => "10100010", 
    150 => "00000000", 151 => "10100100", 152 => "00000000", 153 => "10100110", 
    154 => "10101000", 155 => "00000000", 156 => "10101010", 157 to 159=> "00000000", 
    160 => "10101100", 161 to 163=> "00000000", 164 => "10101110", 165 => "10110000", 
    166 to 171=> "00000000", 172 => "10110010", 173 to 194=> "00000000" );


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

entity predict_ensemble_faY is
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

architecture arch of predict_ensemble_faY is
    component predict_ensemble_faY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_faY_rom_U :  component predict_ensemble_faY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


