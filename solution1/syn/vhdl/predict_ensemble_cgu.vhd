-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cgu_rom is 
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


architecture rtl of predict_ensemble_cgu_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00001100", 
    9 => "00000000", 10 => "00001110", 11 to 13=> "00000000", 14 => "00010000", 
    15 => "00010010", 16 to 17=> "00000000", 18 => "00010100", 19 => "00010110", 
    20 => "00011000", 21 to 22=> "00000000", 23 => "00011010", 24 => "00011100", 
    25 => "00011110", 26 => "00100000", 27 => "00000000", 28 => "00100010", 
    29 => "00100100", 30 => "00000000", 31 => "00100110", 32 => "00000000", 
    33 => "00101000", 34 to 36=> "00000000", 37 => "00101010", 38 => "00000000", 
    39 => "00101100", 40 to 41=> "00000000", 42 => "00101110", 43 => "00000000", 
    44 => "00110000", 45 => "00110010", 46 => "00110100", 47 to 51=> "00000000", 
    52 => "00110110", 53 => "00000000", 54 => "00111000", 55 => "00111010", 
    56 => "00111100", 57 => "00111110", 58 => "00000000", 59 => "01000000", 
    60 => "00000000", 61 => "01000010", 62 to 64=> "00000000", 65 => "01000100", 
    66 => "01000110", 67 => "01001000", 68 => "00000000", 69 => "01001010", 
    70 to 71=> "00000000", 72 => "01001100", 73 => "01001110", 74 => "01010000", 
    75 to 76=> "00000000", 77 => "01010010", 78 => "01010100", 79 to 83=> "00000000", 
    84 => "01010110", 85 => "01011000", 86 => "01011010", 87 => "00000000", 
    88 => "01011100", 89 => "01011110", 90 => "00000000", 91 => "01100000", 
    92 => "00000000", 93 => "01100010", 94 => "00000000", 95 => "01100100", 
    96 => "00000000", 97 => "01100110", 98 => "01101000", 99 => "01101010", 
    100 => "01101100", 101 => "01101110", 102 => "00000000", 103 => "01110000", 
    104 => "01110010", 105 => "01110100", 106 => "01110110", 107 => "01111000", 
    108 => "01111010", 109 => "00000000", 110 => "01111100", 111 => "00000000", 
    112 => "01111110", 113 to 114=> "00000000", 115 => "10000000", 116 => "00000000", 
    117 => "10000010", 118 => "10000100", 119 => "10000110", 120 to 124=> "00000000", 
    125 => "10001000", 126 => "10001010", 127 => "10001100", 128 to 129=> "00000000", 
    130 => "10001110", 131 => "10010000", 132 => "10010010", 133 to 136=> "00000000", 
    137 => "10010100", 138 => "10010110", 139 to 140=> "00000000", 141 => "10011000", 
    142 => "10011010", 143 => "10011100", 144 => "10011110", 145 => "10100000", 
    146 to 147=> "00000000", 148 => "10100010", 149 to 154=> "00000000", 155 => "10100100", 
    156 => "00000000", 157 => "10100110", 158 => "10101000", 159 to 160=> "00000000", 
    161 => "10101010", 162 => "10101100", 163 => "10101110", 164 => "00000000", 
    165 => "10110000", 166 to 170=> "00000000", 171 => "10110010", 172 => "10110100", 
    173 to 176=> "00000000", 177 => "10110110", 178 to 179=> "00000000", 180 => "10111000", 
    181 => "10111010", 182 to 194=> "00000000" );


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

entity predict_ensemble_cgu is
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

architecture arch of predict_ensemble_cgu is
    component predict_ensemble_cgu_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cgu_rom_U :  component predict_ensemble_cgu_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


