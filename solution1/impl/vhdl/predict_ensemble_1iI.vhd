-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_1iI_rom is 
    generic(
             DWIDTH     : integer := 32; 
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


architecture rtl of predict_ensemble_1iI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101010101111111000111111010", 
    1 => "00111110110011101011100110000000", 
    2 => "00111101011101100011101100100101", 
    3 => "00111010010010011001011010110111", 
    4 => "00111100000110011001110111001011", 
    5 => "00111110111101100100101110101001", 
    6 => "00111101100101111010010111110100", 
    7 => "10111011100001101000001100111100", 
    8 => "10111100010110110100110011000010", 
    9 => "00111100000101111100001111010111", 
    10 => "00111100010110000011100000111011", 
    11 => "00111110001000001101100101010001", 
    12 => "00111101101010100100000110100010", 
    13 => "00111011101000100100110011000111", 
    14 => "10111100011111110101100000111010", 
    15 => "00111100000010000110100111000110", 
    16 => "00111101110010011000110101000111", 
    17 => "00111111001000000000000000000000", 
    18 => "00111110000000111010111100110010", 
    19 => "00111011010010001101111000101011", 
    20 => "10111011111101101010110101110001", 
    21 => "10111011011111011111001110110110", 
    22 => "00111111011000011110010010010011", 
    23 => "00111110101110111011011100001111", 
    24 => "00111011011010111001101000010111", 
    25 => "00111110110100000010110110011101", 
    26 => "00111110110000100010001010110100", 
    27 => "00111111010001010011100011001110", 
    28 => "00111011100111000011010001111111", 
    29 => "00111110110010011010001010000011", 
    30 => "00111110110001101011111110000111", 
    31 => "00111111001100011110010000101110", 
    32 => "00111110101101001000110111000001", 
    33 => "10111011110010111110101001001111", 
    34 => "10111010101100010011010110011000", 
    35 => "00111011100110000100010111011101", 
    36 => "00111110000000000110100001010101", 
    37 => "00111101010111101110011001110101", 
    38 => "00111111000010000011101101001111", 
    39 => "00111010100100000111000011111100", 
    40 => "00111011011100110101010111001110", 
    41 => "00111101111000011111010110111110", 
    42 => "00111110000001100100010001010010", 
    43 => "10111011011100001011011010110111", 
    44 => "00111110110110000001011101010101", 
    45 => "00111110100010000100110101110111", 
    46 => "00111011100100110100101011001011", 
    47 => "00111101110110001101011110011101", 
    48 => "10111011111111010110110101111111", 
    49 => "00111011011000101100000100101011", 
    50 => "00111111011101001010101110110100", 
    51 => "00111110010101101111100110111010", 
    52 => "00111110101100111010111111111011", 
    53 => "00111011001100011011101111001111", 
    54 => "10111010010011001011110000000110", 
    55 => "10111010000010001001001110111000", 
    56 => "00111011000110101110110101010111", 
    57 => "00111111011010100111001001110101", 
    58 => "00111011000010110011001011001111", 
    59 => "00111011010101111010110111010001", 
    60 => "00111110011101001011100101000101", 
    61 => "00111111010001110100010111010000", 
    62 => "00111010110100000100010111111110", 
    63 => "00111111011100111001110011101001", 
    64 => "10111011000001010101110110100010", 
    65 => "10111010110010001100110101100100", 
    66 => "00111111000001010111001000110110", 
    67 => "00111110010001010010110001011010", 
    68 => "00111111010010100010111010010000", 
    69 => "00111111001110001011101000110000", 
    70 => "00111111000111011110111100110001", 
    71 => "00111111000100010000000010000010", 
    72 => "10111010001101101111100111111101", 
    73 => "00111110100001101101001011101101", 
    74 => "00111110010100010111100001110000", 
    75 => "10111011100011010101010000010001", 
    76 => "00111101111101011111100010010000", 
    77 => "00111110101110010100010001100111", 
    78 => "10111011000111011110000001010000", 
    79 => "10111010110101100010101111110001", 
    80 => "00111011100100110110001111110101", 
    81 => "00111011001101100011000010101001", 
    82 => "00111010100110101010101000111011", 
    83 => "00111010001111111010000010010100", 
    84 => "00111011000000110000000110101000", 
    85 => "10111011001101101011011011100001", 
    86 => "00111110011100100101011100000000", 
    87 => "10111011000011100110100011100100", 
    88 => "00111110011000111010011010001011", 
    89 => "00111111000111110100000101001010", 
    90 => "00111111011000001100111111110010", 
    91 => "00111010100001011111010010100001", 
    92 => "00111110100011110000001000011101", 
    93 => "00111010100010110011001011001111", 
    94 => "10111010010111001011100110101010", 
    95 => "00111110100011010000011101100100", 
    96 => "10111011001101101111100111111101", 
    97 => "00111110101010011000100010010000", 
    98 => "00111011000110101010101000111011", 
    99 => "00111110001011110010110000110000", 
    100 => "00111110100011001111011000010110", 
    101 => "00111001110111001011100110101010", 
    102 => "00111110100100000101111011100101", 
    103 => "10111010110110101100001001011001", 
    104 => "00111111011000100110010010100001", 
    105 => "10111001110000001111000000100000", 
    106 => "00111110100010101100110110011111", 
    107 => "00111110101100011011000010001010", 
    108 => "00111010001000111001001111101110", 
    109 => "00111110011011100010101110001100", 
    110 => "00111000100101101111111010110101", 
    111 => "00111111010010100110110101001000", 
    112 => "00111111011011010100101010010000", 
    113 => "10111010101100010001010000001010", 
    114 => "10111011000111011010110111111011", 
    115 => "10111010100000111011101000110100", 
    116 => "10111001000101101111111010110101", 
    117 => "10111010000100111001011001001010", 
    118 => "10111010111111000101000001001000", 
    119 => "00111110101111011010011001000000", 
    120 => "00111010110101011000010000101011", 
    121 => "10111010111101000101000101110110", 
    122 => "00111000001001111100010110101100", 
    123 => "00111110111000111101001101011111", 
    124 => "00111110110010111010000010000100", 
    125 => "10111001101011101001011010000001", 
    126 => "00111111000011110111001100111011", 
    127 => "10111010110101111001110100001010", 
    128 => "00111110110100101110011111110111", 
    129 => "00111011001011010101011110111100", 
    130 => "00111010100010010001100111110000", 
    131 => "00111010111111100110100100100111", 
    132 => "00111110110110000010101010111011", 
    133 => "00111110101000100010000000110110", 
    134 => "00111111011000011010100100010001", 
    135 => "10111001100110111011011010101010", 
    136 => "10111011001010010010010111111111", 
    137 => "00111111010001011110101010111100", 
    138 => "00111111001110111010100001100001", 
    139 => "00111110001010111010010111100011", 
    140 => "00111111000111001110001110111101", 
    141 => "00111111011011110111101111100001", 
    142 => "00111111000101111000110110110101", 
    143 => "10111010110100011011011100010111", 
    144 => "00111110011000110011000000001110", 
    145 => "00111010111111100100011110011001", 
    146 => "00111110110011010000101110110111", 
    147 => "00111110111111010010001010000101", 
    148 => "10111010111110010100110010001000", 
    149 => "10111001100011010000100010010010", 
    150 => "00111010000110011110000011100111", 
    151 => "00111111000100001001001101010011", 
    152 => "00111111010101100111011110000001", 
    153 => "00111010110110000010001101000010", 
    154 => "00111110111010000000111010101110", 
    155 => "10111010101000100100010001100011", 
    156 => "10111001011010001100100010101100", 
    157 => "10111001010011000111100011101010", 
    158 => "00111010110100001000100100011010", 
    159 => "00111110100100101000101010000011", 
    160 => "10111010011111100100011110011001", 
    161 => "10111010001101001110000100011110", 
    162 => "00111111000001110101001111010110", 
    163 => "00111110111101010110011011110001", 
    164 => "00111110101101001011010000000111", 
    165 => "00111010011010010000101111001000", 
    166 => "00111001101001010010011010010110", 
    167 => "10111001000110000000101100100100", 
    168 => "00111010011111000111000111010110", 
    169 => "00111111000011000111001011100010", 
    170 => "00111111000010111011011111101001", 
    171 => "00111010010010000100011100101100", 
    172 => "00111111001001111011001010101011", 
    173 => "00111111000001100111110000111001", 
    174 => "00111110110001001001011111111010", 
    175 => "10111010100111000101111001110000", 
    176 => "00111001010110010000111000100100", 
    177 => "00111111000000011011110110000100", 
    178 => "00111001101101101111100111111101", 
    179 => "10111001001101111000000000110100", 
    180 => "10111010111000001010100001001100", 
    181 => "10111010010111000011001101110010", 
    182 => "10111001101110101010010110000011", 
    183 to 194=> "00000000000000000000000000000000" );


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

entity predict_ensemble_1iI is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_1iI is
    component predict_ensemble_1iI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_1iI_rom_U :  component predict_ensemble_1iI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


