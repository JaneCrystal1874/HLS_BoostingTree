-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ecO_rom is 
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


architecture rtl of predict_ensemble_ecO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00001100", 
    9 to 11=> "00000000", 12 => "00001110", 13 => "00010000", 14 => "00000000", 
    15 => "00010010", 16 to 17=> "00000000", 18 => "00010100", 19 => "00000000", 
    20 => "00010110", 21 => "00000000", 22 => "00011000", 23 => "00000000", 
    24 => "00011010", 25 => "00011100", 26 => "00011110", 27 => "00100000", 
    28 to 29=> "00000000", 30 => "00100010", 31 => "00000000", 32 => "00100100", 
    33 => "00000000", 34 => "00100110", 35 => "00101000", 36 => "00000000", 
    37 => "00101010", 38 => "00101100", 39 => "00000000", 40 => "00101110", 
    41 => "00110000", 42 to 43=> "00000000", 44 => "00110010", 45 => "00000000", 
    46 => "00110100", 47 to 48=> "00000000", 49 => "00110110", 50 => "00111000", 
    51 => "00000000", 52 => "00111010", 53 => "00111100", 54 => "00111110", 
    55 => "00000000", 56 => "01000000", 57 => "00000000", 58 => "01000010", 
    59 => "00000000", 60 => "01000100", 61 => "00000000", 62 => "01000110", 
    63 => "01001000", 64 to 65=> "00000000", 66 => "01001010", 67 to 69=> "00000000", 
    70 => "01001100", 71 => "01001110", 72 => "00000000", 73 => "01010000", 
    74 => "01010010", 75 => "01010100", 76 to 77=> "00000000", 78 => "01010110", 
    79 => "00000000", 80 => "01011000", 81 => "00000000", 82 => "01011010", 
    83 => "00000000", 84 => "01011100", 85 to 87=> "00000000", 88 => "01011110", 
    89 to 90=> "00000000", 91 => "01100000", 92 => "01100010", 93 => "00000000", 
    94 => "01100100", 95 to 99=> "00000000", 100 => "01100110", 101 => "00000000", 
    102 => "01101000", 103 => "01101010", 104 => "00000000", 105 => "01101100", 
    106 to 107=> "00000000", 108 => "01101110", 109 => "00000000", 110 => "01110000", 
    111 => "00000000", 112 => "01110010", 113 => "01110100", 114 => "01110110", 
    115 to 117=> "00000000", 118 => "01111000", 119 => "01111010", 120 => "00000000", 
    121 => "01111100", 122 => "00000000", 123 => "01111110", 124 => "00000000", 
    125 => "10000000", 126 => "00000000", 127 => "10000010", 128 => "10000100", 
    129 => "10000110", 130 to 132=> "00000000", 133 => "10001000", 134 => "10001010", 
    135 => "10001100", 136 => "00000000", 137 => "10001110", 138 to 140=> "00000000", 
    141 => "10010000", 142 => "10010010", 143 => "00000000", 144 => "10010100", 
    145 => "00000000", 146 => "10010110", 147 => "00000000", 148 => "10011000", 
    149 => "10011010", 150 => "10011100", 151 => "10011110", 152 => "10100000", 
    153 => "10100010", 154 => "00000000", 155 => "10100100", 156 to 158=> "00000000", 
    159 => "10100110", 160 => "10101000", 161 => "10101010", 162 to 164=> "00000000", 
    165 => "10101100", 166 to 169=> "00000000", 170 => "10101110", 171 => "10110000", 
    172 to 194=> "00000000" );


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

entity predict_ensemble_ecO is
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

architecture arch of predict_ensemble_ecO is
    component predict_ensemble_ecO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ecO_rom_U :  component predict_ensemble_ecO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


