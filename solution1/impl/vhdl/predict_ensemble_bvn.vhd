-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bvn_rom is 
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


architecture rtl of predict_ensemble_bvn_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111100000100011011001111110010", 
    1 => "00111011100111011001110100110100", 
    2 => "00111100010110000011100000111011", 
    3 => "10111011100010100111101001000010", 
    4 => "00111111011110010011001100001001", 
    5 => "00111101010010110010010100101101", 
    6 => "00111010110001110111110111011000", 
    7 => "10111010110111011010010010001011", 
    8 => "00111111010111000010011100100000", 
    9 => "00111110001001101111101111010010", 
    10 => "00111111011101010110101001001000", 
    11 => "10111011000001110001000111011000", 
    12 => "00111101101001111010010110110001", 
    13 => "00111111001011101010011010100000", 
    14 => "10111010011011110001001101001001", 
    15 => "00111110111010111000101011100011", 
    16 => "00111101111110110011110110001110", 
    17 => "00111011001010001100000101010101", 
    18 => "00111001101100000010100100101000", 
    19 => "00111101100000101110010011010010", 
    20 => "10111011001101111001000011111011", 
    21 => "00111110110011111000000001010110", 
    22 => "00111111011101100101011000010101", 
    23 => "00111101010111100000111001110011", 
    24 => "00111011001111000001011010011100", 
    25 => "10111011000100001011010000011000", 
    26 => "00111111001011000111001111001101", 
    27 => "00111110001000111001100010100110", 
    28 => "10111010011001000101001111010010", 
    29 => "00111010100010001101011011010100", 
    30 => "10111010010000001010110100000100", 
    31 => "00111101110110111011010110011110", 
    32 => "10111010000100001011010000011000", 
    33 => "00111110111111000010011111001000", 
    34 => "00111111010110001011101000110000", 
    35 => "00111010011110101101111100101111", 
    36 => "00111000110100011011011100010111", 
    37 => "10111010011100111000100000100010", 
    38 => "10111001000010110111010111101010", 
    39 => "00111111011010000010011111111010", 
    40 => "00111111000010110111111010110011", 
    41 => "00111111010110111001011110011010", 
    42 => "00111010000011110010000101110001", 
    43 => "00111001001110101010010110000011", 
    44 => "00111010100110001001000101011100", 
    45 => "00111111011011010111110000101101", 
    46 => "10111001110110000000000110110100", 
    47 => "00111111001001110100010111010000", 
    48 => "00111111011101010111110101111100", 
    49 => "00111110001101110010100001100011", 
    50 => "00111111010010010000000011100111", 
    51 => "10111010001001110011111101110101", 
    52 => "10111000010111100100110001010001", 
    53 => "00111010101100010001010000001010", 
    54 => "00111110000110111101111100001001", 
    55 => "00111111010001101011010001010011", 
    56 => "00111010000101011010111100101001", 
    57 => "00111110110101000011010100100110", 
    58 => "00111111010111000011011101010000", 
    59 => "00111110000000110110001000100000", 
    60 => "10111001111010001100100010101100", 
    61 => "00111010100001000001111011011110", 
    62 => "00111001000101101111111010110101", 
    63 => "00111110011010101110100011100010", 
    64 => "00111111010110110111100000100101", 
    65 => "10111010000001101011110111110101", 
    66 => "00111110010100100110111011011011", 
    67 => "10111001110000001111000000100000", 
    68 => "00111110110101000011100100110111", 
    69 => "00111010001010101110101011111011", 
    70 => "00111111001011110000101011110110", 
    71 => "10111001111010000100001001110100", 
    72 => "00111110101111000011100010110000", 
    73 => "00111110110001011010001011010111", 
    74 => "00111111000111101000101110100000", 
    75 => "00111001101010000100101111100100", 
    76 => "10111000110000110000100011111111", 
    77 => "00111110100000111100110101111001", 
    78 => "00111110111100101110011100101110", 
    79 => "00111110100010110110011001010001", 
    80 => "00111111001000000000111110001000", 
    81 => "00111110001011000111000100001101", 
    82 => "00111111000010101110000100010101", 
    83 => "00111001010010000100011100101100", 
    84 => "00111111010000010111010001100000", 
    85 => "00111101111011111110110011011101", 
    86 => "00111111010000001101010000110101", 
    87 => "00111110111100010101100001110101", 
    88 => "10111001101110101010010110000011", 
    89 => "00111010010000100011111110101011", 
    90 => "00111110110110011000001100001110", 
    91 => "10111010000001100111101011011001", 
    92 => "00111111011010001101010010101010", 
    93 => "10111000100000100000010111111111", 
    94 => "00111111001000010100000100110001", 
    95 => "00111000101110101010010110000011", 
    96 => "00111110101011100100101110001000", 
    97 => "10111001100000000111001101011000", 
    98 => "00111110001100100010000011111111", 
    99 => "00111111000001101111110100000000", 
    100 => "00111111001010101011100000110000", 
    101 => "00111110101010001100110001111001", 
    102 => "10111000101010111111011101101010", 
    103 => "00111001101110011001100100010011", 
    104 => "00111001000100101100110011110111", 
    105 => "00111111011000001101100000110100", 
    106 => "00111001100101000101111110011110", 
    107 => "00111001010111110101100011000001", 
    108 => "00111010000101000001110010000010", 
    109 => "10111001101010001101001000011100", 
    110 => "10111010000010010101110100001011", 
    111 => "00111001101010101110101011111011", 
    112 => "00111110001111001001011100001111", 
    113 => "10111001111111100100011110011001", 
    114 => "10111000111011110001001101001001", 
    115 => "00111001110011001111111100100010", 
    116 => "10111001000101101111111010110101", 
    117 => "00111110101010001100111001110000", 
    118 => "00111000101100000010100100101000", 
    119 => "00111110111101111001100100111101", 
    120 => "10111001110101100110111100001101", 
    121 => "00111001101011110001110010111001", 
    122 => "00111111000001011101011000010111", 
    123 => "00111001111011100000011011011001", 
    124 => "00111001000001000001111011011110", 
    125 => "00111110001110100010111001111111", 
    126 => "00111110111001101011010100001011", 
    127 => "00111110100001000111110000110001", 
    128 => "00111111001111010001011101000000", 
    129 => "10111010000010110111010111101010", 
    130 => "00111110111101100110011011101101", 
    131 => "00111111001000001001011101100011", 
    132 => "00111110101101100010100110110111", 
    133 => "00111110100001100010110001010110", 
    134 => "00111110101100111010111111111011", 
    135 => "10111000011110111010100010000010", 
    136 => "10111001001100100100001000000111", 
    137 => "00111110101001001101111001011101", 
    138 => "00111111000000010010110000010111", 
    139 => "00111010001001100011001100000101", 
    140 => "10110111001001111100010110101100", 
    141 => "10111001100110011001110111001011", 
    142 => "00111110110101111101111000001101", 
    143 => "00111111001000011100001011010010", 
    144 => "00111110110011010001000100111000", 
    145 => "00111110111101011100011101101001", 
    146 => "10000000000000000000000000000000", 
    147 => "00111111000000100100001001101100", 
    148 => "00111110101010111000101100100110", 
    149 => "00111001100000010111111111000111", 
    150 => "10110111111010101110000110001011", 
    151 => "00111110101001101001010001101000", 
    152 => "00111111011000011111011010001000", 
    153 => "00111001101010001101001000011100", 
    154 => "00110110100001100011011110111101", 
    155 => "10111001110101110111101101111100", 
    156 => "10111000010001010010000111011110", 
    157 => "00111110101100111101111100101011", 
    158 => "00111000000111110110001000110000", 
    159 => "00111001000111100101010111000001", 
    160 => "00111111001011001000001110101001", 
    161 => "10111001100100000010110111100000", 
    162 => "10111010000011111110101011000100", 
    163 => "10111001011110101001110000010011", 
    164 => "10111000101101000101101011100110", 
    165 => "00111111010011110011010101111110", 
    166 => "00111001010010100110000000001011", 
    167 => "00111110101010101010011000001001", 
    168 => "00111001110000101000001011000111", 
    169 => "10111001101110011001100100010011", 
    170 => "00111111001101010100101101001001", 
    171 => "00111111010001010100101011100100", 
    172 => "10111001001100000010100100101000", 
    173 => "00111000100011101001101100111001", 
    174 => "00111001101011101001011010000001", 
    175 => "10111000011100110100010100000111", 
    176 => "00111001001011110001110010111001", 
    177 => "00111111000100101110100011000000", 
    178 => "00111001101011101001011010000001", 
    179 => "00111111001111011001010100100101", 
    180 => "10111001000011011000111011001001", 
    181 => "00111111000110011000011001100110", 
    182 => "00111001010011000111100011101010", 
    183 => "00111000110111100100110001010001", 
    184 => "00111110110000101110100011000000", 
    185 => "00110111011010101110000110001011", 
    186 => "10111000111110011000111110100011", 
    187 to 194=> "00000000000000000000000000000000" );


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

entity predict_ensemble_bvn is
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

architecture arch of predict_ensemble_bvn is
    component predict_ensemble_bvn_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bvn_rom_U :  component predict_ensemble_bvn_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


