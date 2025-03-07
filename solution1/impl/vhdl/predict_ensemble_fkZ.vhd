-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fkZ_rom is 
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


architecture rtl of predict_ensemble_fkZ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 to 7=> "00000000", 8 => "00001100", 
    9 => "00001110", 10 => "00010000", 11 to 13=> "00000000", 14 => "00010010", 
    15 => "00010100", 16 => "00010110", 17 => "00000000", 18 => "00011000", 
    19 to 20=> "00000000", 21 => "00011010", 22 => "00011100", 23 => "00000000", 
    24 => "00011110", 25 => "00000000", 26 => "00100000", 27 => "00000000", 
    28 => "00100010", 29 to 31=> "00000000", 32 => "00100100", 33 => "00000000", 
    34 => "00100110", 35 to 36=> "00000000", 37 => "00101000", 38 => "00101010", 
    39 to 40=> "00000000", 41 => "00101100", 42 => "00101110", 43 to 45=> "00000000", 
    46 => "00110000", 47 => "00110010", 48 => "00000000", 49 => "00110100", 
    50 => "00110110", 51 => "00111000", 52 => "00000000", 53 => "00111010", 
    54 => "00111100", 55 => "00111110", 56 => "00000000", 57 => "01000000", 
    58 => "01000010", 59 => "00000000", 60 => "01000100", 61 => "01000110", 
    62 to 67=> "00000000", 68 => "01001000", 69 => "01001010", 70 => "00000000", 
    71 => "01001100", 72 => "01001110", 73 => "00000000", 74 => "01010000", 
    75 to 77=> "00000000", 78 => "01010010", 79 => "01010100", 80 => "01010110", 
    81 => "01011000", 82 => "01011010", 83 => "01011100", 84 => "00000000", 
    85 => "01011110", 86 => "01100000", 87 => "01100010", 88 => "01100100", 
    89 to 90=> "00000000", 91 => "01100110", 92 to 96=> "00000000", 97 => "01101000", 
    98 => "01101010", 99 => "01101100", 100 => "01101110", 101 => "00000000", 
    102 => "01110000", 103 => "01110010", 104 => "01110100", 105 to 106=> "00000000", 
    107 => "01110110", 108 to 109=> "00000000", 110 => "01111000", 111 => "01111010", 
    112 => "01111100", 113 => "00000000", 114 => "01111110", 115 to 116=> "00000000", 
    117 => "10000000", 118 => "10000010", 119 => "10000100", 120 => "10000110", 
    121 => "00000000", 122 => "10001000", 123 => "10001010", 124 => "00000000", 
    125 => "10001100", 126 => "00000000", 127 => "10001110", 128 => "00000000", 
    129 => "10010000", 130 => "00000000", 131 => "10010010", 132 => "10010100", 
    133 => "00000000", 134 => "10010110", 135 to 141=> "00000000", 142 => "10011000", 
    143 to 144=> "00000000", 145 => "10011010", 146 => "10011100", 147 to 148=> "00000000", 
    149 => "10011110", 150 to 155=> "00000000", 156 => "10100000", 157 => "10100010", 
    158 => "10100100", 159 => "00000000", 160 => "10100110", 161 => "10101000", 
    162 => "10101010", 163 => "10101100", 164 => "10101110", 165 to 167=> "00000000", 
    168 => "10110000", 169 => "00000000", 170 => "10110010", 171 to 173=> "00000000", 
    174 => "10110100", 175 => "00000000", 176 => "10110110", 177 => "10111000", 
    178 => "00000000", 179 => "10111010", 180 => "10111100", 181 => "00000000", 
    182 => "10111110", 183 to 185=> "00000000", 186 => "11000000", 187 to 194=> "00000000" );


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

entity predict_ensemble_fkZ is
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

architecture arch of predict_ensemble_fkZ is
    component predict_ensemble_fkZ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fkZ_rom_U :  component predict_ensemble_fkZ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


