-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cDy_rom is 
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


architecture rtl of predict_ensemble_cDy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111111010011011111011101100010", 
    1 => "00111101010000011100000111010111", 
    2 => "00111111001111001100101111010001", 
    3 => "10111010010010100110000000001011", 
    4 => "00111100001110101000100000100111", 
    5 => "00111010010100010111001111111011", 
    6 => "00111110011010101000100000100111", 
    7 => "10111001100100001011010000011000", 
    8 => "00111111011000011100000110110101", 
    9 => "00111000001100000010100100101000", 
    10 => "00111110110001110011001101000100", 
    11 => "00111111010111110100001001010111", 
    12 => "00111111001111001010111011001001", 
    13 => "10110110110010010101001110011100", 
    14 => "00111111011011111110111010010001", 
    15 => "00111101100001000010011101000010", 
    16 => "10111001100010001101011011010100", 
    17 => "00111010000100001011010000011000", 
    18 => "10111000100101101111111010110101", 
    19 => "00110110100001100011011110111101", 
    20 => "00111110100000011010011001010000", 
    21 => "00111110111000001100010100000000", 
    22 => "00111101100101111010010111110100", 
    23 => "10110110100001100011011110111101", 
    24 => "00110110000001100011011110111101", 
    25 => "00111110110010010101110010100111", 
    26 => "10111010001101110011110100011001", 
    27 => "00111001110110001000011111101100", 
    28 => "00111101111010101110001010010111", 
    29 => "10111000011100110100010100000111", 
    30 => "00111001010111000011001101110010", 
    31 => "10111001001101000101101011100110", 
    32 => "00111111011110000111011001111101", 
    33 => "00111111011100001100111011110110", 
    34 => "00111001010000110000100011111111", 
    35 => "00111111010010001100011011010110", 
    36 => "10111001010000110000100011111111", 
    37 => "00111101001010101101100100100111", 
    38 => "00111111010001111110010011001101", 
    39 => "00111000100110110011000001110011", 
    40 => "00111101100010111111001100111000", 
    41 => "00111001000111000011110011100010", 
    42 => "10110110111010101110000110001011", 
    43 => "10111000110010010101001110011100", 
    44 => "00111110001101100101011011101111", 
    45 => "00111110000101000001000110000000", 
    46 => "00111110010011111110110101100011", 
    47 => "00111111000001110001000010111010", 
    48 => "10111001000111010100100101010010", 
    49 => "00111000101101100111001111000101", 
    50 => "00111110010101011000101001110110", 
    51 => "00111110010100011111110111011111", 
    52 => "10111000001111001011111001100010", 
    53 => "10111000010101011110100011010101", 
    54 => "00111111010011101000101110100000", 
    55 => "00110111100001100011011110111101", 
    56 => "00111000100010100110100101111011", 
    57 => "00111110010001111100111010010110", 
    58 => "00111110111111010000101010101010", 
    59 => "00111110100001001110011110101011", 
    60 => "00111110011011110111010001000111", 
    61 => "00110101100001100011011110111101", 
    62 => "00111000101110001000110010100100", 
    63 => "10111000100001000001111011011110", 
    64 => "00111000110011011000010101011001", 
    65 => "10111000100001000001111011011110", 
    66 => "00111111010001001010110100000100", 
    67 => "00111111011000010111100011110111", 
    68 => "10111000001010111111011101101010", 
    69 => "00111111011100101010110010101000", 
    70 => "10111000000000100000010111111111", 
    71 => "00111111010000000110110100001101", 
    72 => "00111000100111110110001000110000", 
    73 => "00111101101001010001011111100111", 
    74 => "00111000001000111001001111101110", 
    75 => "10111000000001100011011110111101", 
    76 => "00111101101010010101000110000011", 
    77 => "10110111111010101110000110001011", 
    78 => "00111110100000011000100011110100", 
    79 => "10110111111010101110000110001011", 
    80 => "00111110100101000011000100111000", 
    81 => "00111110100100010100110111111001", 
    82 => "00111110110000001101101011100100", 
    83 => "00111110101011010101001110101100", 
    84 => "00111000011101110111011011000101", 
    85 => "00111110100001001110101110111100", 
    86 => "00111101110011000001011111101100", 
    87 => "00111110010101101110010001111110", 
    88 => "00110111111100110100010100000111", 
    89 => "00111110110011100101101100100001", 
    90 => "00111110100011100111011001100100", 
    91 => "00111000010010010101001110011100", 
    92 => "00111110101100000101010101110101", 
    93 => "00110111101110001000110010100100", 
    94 => "00111110011100100101011100000000", 
    95 => "00111110100100101001100100110001", 
    96 => "10110111110000001111000000100000", 
    97 => "10110111100111110110001000110000", 
    98 => "10111000100111010100100101010010", 
    99 => "00110111100101101111111010110101", 
    100 => "00111111011000010001000011000011", 
    101 => "10110111011010101110000110001011", 
    102 => "00111110111011010000000010010011", 
    103 => "00110111101001111100010110101100", 
    104 => "10110111000001100011011110111101", 
    105 => "00111111001111110011100110001111", 
    106 => "10110111101001111100010110101100", 
    107 => "10110110111010101110000110001011", 
    108 => "00111110100001110100110110011100", 
    109 => "00111110110000001000001110111010", 
    110 => "10110111101001111100010110101100", 
    111 => "00110101100001100011011110111101", 
    112 => "00110111100011101001101100111001", 
    113 => "10110111010110100001101010010011", 
    114 => "00111101111000011111010110111110", 
    115 => "00110111011110111010100010000010", 
    116 => "00111111011100110010000010000110", 
    117 => "00111110101110001100100101010100", 
    118 => "00111111001111101000101110100000", 
    119 => "00111110101010100100011000111001", 
    120 => "00111110101101001011111010000011", 
    121 => "10111000000001100011011110111101", 
    122 => "00110110000001100011011110111101", 
    123 => "10110110010010010101001110011100", 
    124 => "00111000000001100011011110111101", 
    125 => "10110111100011101001101100111001", 
    126 => "00111111001011100010001000001100", 
    127 => "00111111011010010001011000000001", 
    128 => "00110111010110100001101010010011", 
    129 => "00111110101101000001100111100011", 
    130 => "00111110001111001111001110011001", 
    131 => "00111110110010111101101100111100", 
    132 => "00111110001001111101100010001100", 
    133 => "10110110100001100011011110111101", 
    134 => "00110111110000001111000000100000", 
    135 => "00110101100001100011011110111101", 
    136 => "00110111100111110110001000110000", 
    137 => "10110111001110001000110010100100", 
    138 => "00111110110110001000011100000001", 
    139 => "00111110111100001111110110100000", 
    140 => "00111110110100100100000000010000", 
    141 => "00111110111100010000001100000000", 
    142 => "00111110111110011101110001110010", 
    143 => "00111110101111110100111100001110", 
    144 => "00111111000111111000010110000011", 
    145 => "10110110000001100011011110111101", 
    146 => "00110110010010010101001110011100", 
    147 => "10110111100001100011011110111101", 
    148 => "10110110101001111100010110101100", 
    149 => "10000000000000000000000000000000", 
    150 => "00110111100001100011011110111101", 
    151 => "00111111000001000001001101110111", 
    152 => "00111111000111110010001100000011", 
    153 => "00111111000100000000000000000000", 
    154 => "00111111000110101101110101011001", 
    155 => "10110111001001111100010110101100", 
    156 => "00111110001001111000100000010010", 
    157 => "00110110000001100011011110111101", 
    158 => "00111110111011000000111100000010", 
    159 => "00110111000001100011011110111101", 
    160 => "00110110000001100011011110111101", 
    161 => "00110111010010010101001110011100", 
    162 => "00111110001111011010101111100010", 
    163 => "10110110101001111100010110101100", 
    164 => "00110101100001100011011110111101", 
    165 => "10110111001110001000110010100100", 
    166 => "00111111010011000111011001111101", 
    167 => "00111111001010101001000010011011", 
    168 => "00111111000110110111101111000000", 
    169 => "00111111000100010111000000101110", 
    170 => "00111111001000010111010001100000", 
    171 => "10000000000000000000000000000000", 
    172 => "00110110110010010101001110011100", 
    173 => "00000000000000000000000000000000", 
    174 => "00110110110010010101001110011100", 
    175 => "00111111001000100000110000000111", 
    176 => "10110111000101101111111010110101", 
    177 => "00110110010010010101001110011100", 
    178 => "00111111001011111110100111011001", 
    179 => "00111111001001110010001011010001", 
    180 => "10110110110010010101001110011100", 
    181 => "00110101100001100011011110111101", 
    182 => "10110110010010010101001110011100", 
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

entity predict_ensemble_cDy is
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

architecture arch of predict_ensemble_cDy is
    component predict_ensemble_cDy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cDy_rom_U :  component predict_ensemble_cDy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


