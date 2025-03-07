-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_egO_rom is 
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


architecture rtl of predict_ensemble_egO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 => "00001011", 7 => "00000000", 
    8 => "00001101", 9 => "00000000", 10 => "00001111", 11 => "00000000", 
    12 => "00010001", 13 => "00000000", 14 => "00010011", 15 => "00010101", 
    16 => "00010111", 17 to 19=> "00000000", 20 => "00011001", 21 => "00011011", 
    22 => "00000000", 23 => "00011101", 24 to 26=> "00000000", 27 => "00011111", 
    28 to 29=> "00000000", 30 => "00100001", 31 => "00000000", 32 => "00100011", 
    33 => "00100101", 34 => "00100111", 35 => "00101001", 36 => "00000000", 
    37 => "00101011", 38 to 39=> "00000000", 40 => "00101101", 41 => "00101111", 
    42 => "00110001", 43 => "00110011", 44 to 45=> "00000000", 46 => "00110101", 
    47 => "00000000", 48 => "00110111", 49 => "00111001", 50 to 51=> "00000000", 
    52 => "00111011", 53 => "00000000", 54 => "00111101", 55 to 59=> "00000000", 
    60 => "00111111", 61 => "00000000", 62 => "01000001", 63 => "01000011", 
    64 => "01000101", 65 => "00000000", 66 => "01000111", 67 => "01001001", 
    68 to 69=> "00000000", 70 => "01001011", 71 => "01001101", 72 => "01001111", 
    73 to 75=> "00000000", 76 => "01010001", 77 to 78=> "00000000", 79 => "01010011", 
    80 => "01010101", 81 => "01010111", 82 to 84=> "00000000", 85 => "01011001", 
    86 => "01011011", 87 => "01011101", 88 => "01011111", 89 => "01100001", 
    90 => "00000000", 91 => "01100011", 92 => "00000000", 93 => "01100101", 
    94 to 96=> "00000000", 97 => "01100111", 98 => "00000000", 99 => "01101001", 
    100 => "01101011", 101 => "01101101", 102 to 105=> "00000000", 106 => "01101111", 
    107 to 108=> "00000000", 109 => "01110001", 110 to 111=> "00000000", 112 => "01110011", 
    113 => "01110101", 114 => "01110111", 115 => "01111001", 116 => "01111011", 
    117 to 118=> "00000000", 119 => "01111101", 120 => "01111111", 121 to 123=> "00000000", 
    124 => "10000001", 125 to 128=> "00000000", 129 => "10000011", 130 to 131=> "00000000", 
    132 => "10000101", 133 => "00000000", 134 => "10000111", 135 => "10001001", 
    136 => "10001011", 137 to 139=> "00000000", 140 => "10001101", 141 => "00000000", 
    142 => "10001111", 143 => "10010001", 144 => "10010011", 145 => "10010101", 
    146 => "10010111", 147 to 148=> "00000000", 149 => "10011001", 150 to 152=> "00000000", 
    153 => "10011011", 154 => "00000000", 155 => "10011101", 156 => "00000000", 
    157 => "10011111", 158 => "00000000", 159 => "10100001", 160 to 161=> "00000000", 
    162 => "10100011", 163 => "10100101", 164 => "10100111", 165 => "10101001", 
    166 to 168=> "00000000", 169 => "10101011", 170 to 194=> "00000000" );


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

entity predict_ensemble_egO is
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

architecture arch of predict_ensemble_egO is
    component predict_ensemble_egO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_egO_rom_U :  component predict_ensemble_egO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


