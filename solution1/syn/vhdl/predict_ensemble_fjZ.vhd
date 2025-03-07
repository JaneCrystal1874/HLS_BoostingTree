-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fjZ_rom is 
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


architecture rtl of predict_ensemble_fjZ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 to 7=> "00000000", 8 => "00001011", 
    9 => "00001101", 10 => "00001111", 11 to 13=> "00000000", 14 => "00010001", 
    15 => "00010011", 16 => "00010101", 17 => "00000000", 18 => "00010111", 
    19 to 20=> "00000000", 21 => "00011001", 22 => "00011011", 23 => "00000000", 
    24 => "00011101", 25 => "00000000", 26 => "00011111", 27 => "00000000", 
    28 => "00100001", 29 to 31=> "00000000", 32 => "00100011", 33 => "00000000", 
    34 => "00100101", 35 to 36=> "00000000", 37 => "00100111", 38 => "00101001", 
    39 to 40=> "00000000", 41 => "00101011", 42 => "00101101", 43 to 45=> "00000000", 
    46 => "00101111", 47 => "00110001", 48 => "00000000", 49 => "00110011", 
    50 => "00110101", 51 => "00110111", 52 => "00000000", 53 => "00111001", 
    54 => "00111011", 55 => "00111101", 56 => "00000000", 57 => "00111111", 
    58 => "01000001", 59 => "00000000", 60 => "01000011", 61 => "01000101", 
    62 to 67=> "00000000", 68 => "01000111", 69 => "01001001", 70 => "00000000", 
    71 => "01001011", 72 => "01001101", 73 => "00000000", 74 => "01001111", 
    75 to 77=> "00000000", 78 => "01010001", 79 => "01010011", 80 => "01010101", 
    81 => "01010111", 82 => "01011001", 83 => "01011011", 84 => "00000000", 
    85 => "01011101", 86 => "01011111", 87 => "01100001", 88 => "01100011", 
    89 to 90=> "00000000", 91 => "01100101", 92 to 96=> "00000000", 97 => "01100111", 
    98 => "01101001", 99 => "01101011", 100 => "01101101", 101 => "00000000", 
    102 => "01101111", 103 => "01110001", 104 => "01110011", 105 to 106=> "00000000", 
    107 => "01110101", 108 to 109=> "00000000", 110 => "01110111", 111 => "01111001", 
    112 => "01111011", 113 => "00000000", 114 => "01111101", 115 to 116=> "00000000", 
    117 => "01111111", 118 => "10000001", 119 => "10000011", 120 => "10000101", 
    121 => "00000000", 122 => "10000111", 123 => "10001001", 124 => "00000000", 
    125 => "10001011", 126 => "00000000", 127 => "10001101", 128 => "00000000", 
    129 => "10001111", 130 => "00000000", 131 => "10010001", 132 => "10010011", 
    133 => "00000000", 134 => "10010101", 135 to 141=> "00000000", 142 => "10010111", 
    143 to 144=> "00000000", 145 => "10011001", 146 => "10011011", 147 to 148=> "00000000", 
    149 => "10011101", 150 to 155=> "00000000", 156 => "10011111", 157 => "10100001", 
    158 => "10100011", 159 => "00000000", 160 => "10100101", 161 => "10100111", 
    162 => "10101001", 163 => "10101011", 164 => "10101101", 165 to 167=> "00000000", 
    168 => "10101111", 169 => "00000000", 170 => "10110001", 171 to 173=> "00000000", 
    174 => "10110011", 175 => "00000000", 176 => "10110101", 177 => "10110111", 
    178 => "00000000", 179 => "10111001", 180 => "10111011", 181 => "00000000", 
    182 => "10111101", 183 to 185=> "00000000", 186 => "10111111", 187 to 194=> "00000000" );


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

entity predict_ensemble_fjZ is
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

architecture arch of predict_ensemble_fjZ is
    component predict_ensemble_fjZ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fjZ_rom_U :  component predict_ensemble_fjZ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


