-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dIJ_rom is 
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


architecture rtl of predict_ensemble_dIJ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00001010", 7 to 9=> "00000000", 
    10 => "00001100", 11 => "00001110", 12 => "00010000", 13 => "00010010", 
    14 to 16=> "00000000", 17 => "00010100", 18 => "00010110", 19 => "00011000", 
    20 => "00000000", 21 => "00011010", 22 => "00000000", 23 => "00011100", 
    24 to 25=> "00000000", 26 => "00011110", 27 => "00100000", 28 => "00000000", 
    29 => "00100010", 30 => "00100100", 31 => "00000000", 32 => "00100110", 
    33 => "00101000", 34 to 35=> "00000000", 36 => "00101010", 37 => "00101100", 
    38 to 41=> "00000000", 42 => "00101110", 43 to 44=> "00000000", 45 => "00110000", 
    46 => "00110010", 47 => "00110100", 48 => "00110110", 49 => "00111000", 
    50 => "00000000", 51 => "00111010", 52 to 53=> "00000000", 54 => "00111100", 
    55 to 56=> "00000000", 57 => "00111110", 58 => "01000000", 59 => "00000000", 
    60 => "01000010", 61 => "01000100", 62 => "00000000", 63 => "01000110", 
    64 => "00000000", 65 => "01001000", 66 to 67=> "00000000", 68 => "01001010", 
    69 => "01001100", 70 => "00000000", 71 => "01001110", 72 => "01010000", 
    73 => "00000000", 74 => "01010010", 75 => "01010100", 76 to 79=> "00000000", 
    80 => "01010110", 81 to 84=> "00000000", 85 => "01011000", 86 => "01011010", 
    87 => "01011100", 88 => "00000000", 89 => "01011110", 90 => "00000000", 
    91 => "01100000", 92 => "01100010", 93 to 94=> "00000000", 95 => "01100100", 
    96 => "01100110", 97 to 99=> "00000000", 100 => "01101000", 101 => "00000000", 
    102 => "01101010", 103 => "01101100", 104 => "00000000", 105 => "01101110", 
    106 => "01110000", 107 => "01110010", 108 to 109=> "00000000", 110 => "01110100", 
    111 to 112=> "00000000", 113 => "01110110", 114 => "00000000", 115 => "01111000", 
    116 to 117=> "00000000", 118 => "01111010", 119 => "01111100", 120 => "01111110", 
    121 => "10000000", 122 => "00000000", 123 => "10000010", 124 to 126=> "00000000", 
    127 => "10000100", 128 => "00000000", 129 => "10000110", 130 => "10001000", 
    131 => "10001010", 132 to 136=> "00000000", 137 => "10001100", 138 to 139=> "00000000", 
    140 => "10001110", 141 => "00000000", 142 => "10010000", 143 => "10010010", 
    144 => "10010100", 145 => "10010110", 146 => "10011000", 147 => "00000000", 
    148 => "10011010", 149 => "10011100", 150 => "10011110", 151 => "00000000", 
    152 => "10100000", 153 => "10100010", 154 => "00000000", 155 => "10100100", 
    156 => "10100110", 157 => "00000000", 158 => "10101000", 159 to 161=> "00000000", 
    162 => "10101010", 163 to 167=> "00000000", 168 => "10101100", 169 to 170=> "00000000", 
    171 => "10101110", 172 => "10110000", 173 to 194=> "00000000" );


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

entity predict_ensemble_dIJ is
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

architecture arch of predict_ensemble_dIJ is
    component predict_ensemble_dIJ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dIJ_rom_U :  component predict_ensemble_dIJ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


