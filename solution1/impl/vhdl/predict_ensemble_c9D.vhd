-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c9D_rom is 
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


architecture rtl of predict_ensemble_c9D_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 to 7=> "00000000", 8 => "00001100", 
    9 => "00000000", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 => "00000000", 16 => "00010110", 
    17 => "00011000", 18 => "00000000", 19 => "00011010", 20 => "00000000", 
    21 => "00011100", 22 => "00011110", 23 => "00000000", 24 => "00100000", 
    25 => "00100010", 26 => "00100100", 27 => "00000000", 28 => "00100110", 
    29 => "00101000", 30 to 31=> "00000000", 32 => "00101010", 33 to 34=> "00000000", 
    35 => "00101100", 36 => "00101110", 37 => "00110000", 38 to 39=> "00000000", 
    40 => "00110010", 41 => "00110100", 42 => "00110110", 43 => "00111000", 
    44 => "00111010", 45 => "00000000", 46 => "00111100", 47 to 48=> "00000000", 
    49 => "00111110", 50 to 53=> "00000000", 54 => "01000000", 55 => "00000000", 
    56 => "01000010", 57 to 59=> "00000000", 60 => "01000100", 61 => "01000110", 
    62 => "01001000", 63 => "00000000", 64 => "01001010", 65 => "01001100", 
    66 to 67=> "00000000", 68 => "01001110", 69 => "01010000", 70 => "01010010", 
    71 to 73=> "00000000", 74 => "01010100", 75 => "01010110", 76 to 77=> "00000000", 
    78 => "01011000", 79 => "01011010", 80 to 81=> "00000000", 82 => "01011100", 
    83 => "00000000", 84 => "01011110", 85 => "00000000", 86 => "01100000", 
    87 to 90=> "00000000", 91 => "01100010", 92 => "01100100", 93 => "00000000", 
    94 => "01100110", 95 => "00000000", 96 => "01101000", 97 => "01101010", 
    98 => "00000000", 99 => "01101100", 100 => "00000000", 101 => "01101110", 
    102 => "01110000", 103 => "01110010", 104 to 105=> "00000000", 106 => "01110100", 
    107 to 109=> "00000000", 110 => "01110110", 111 => "01111000", 112 => "00000000", 
    113 => "01111010", 114 to 118=> "00000000", 119 => "01111100", 120 => "00000000", 
    121 => "01111110", 122 to 123=> "00000000", 124 => "10000000", 125 => "10000010", 
    126 to 127=> "00000000", 128 => "10000100", 129 => "00000000", 130 => "10000110", 
    131 to 133=> "00000000", 134 => "10001000", 135 => "10001010", 136 => "10001100", 
    137 to 138=> "00000000", 139 => "10001110", 140 to 141=> "00000000", 142 => "10010000", 
    143 => "10010010", 144 => "10010100", 145 => "10010110", 146 => "00000000", 
    147 => "10011000", 148 => "10011010", 149 => "00000000", 150 => "10011100", 
    151 => "10011110", 152 to 153=> "00000000", 154 => "10100000", 155 to 158=> "00000000", 
    159 => "10100010", 160 => "10100100", 161 => "10100110", 162 => "10101000", 
    163 => "00000000", 164 => "10101010", 165 to 168=> "00000000", 169 => "10101100", 
    170 => "10101110", 171 => "00000000", 172 => "10110000", 173 => "00000000", 
    174 => "10110010", 175 => "10110100", 176 => "00000000", 177 => "10110110", 
    178 => "00000000", 179 => "10111000", 180 => "00000000", 181 => "10111010", 
    182 => "00000000", 183 => "10111100", 184 to 187=> "00000000", 188 => "10111110", 
    189 to 194=> "00000000" );


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

entity predict_ensemble_c9D is
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

architecture arch of predict_ensemble_c9D is
    component predict_ensemble_c9D_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c9D_rom_U :  component predict_ensemble_c9D_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


