-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bKp_rom is 
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


architecture rtl of predict_ensemble_bKp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101001110110100110000111100", 
    1 => "00111010101001100001000101110111", 
    2 => "00111100001110101000100000100111", 
    3 => "10111010100101010000011101100100", 
    4 => "00111100011110101010110011011010", 
    5 => "00111010110010010011001000001110", 
    6 => "00111101100001000010011101000010", 
    7 => "00111111000010001001010111010001", 
    8 => "00111101110000111101011100001010", 
    9 => "00111111000101001010001001000100", 
    10 => "10111011000001100100100010000100", 
    11 => "00111111001000111000000111011000", 
    12 => "00111101110011111110100100110010", 
    13 => "10111001110100111100111111110110", 
    14 => "00111001111001011010001101011101", 
    15 => "10111001101011010000001111011010", 
    16 => "00111111001010101010111110111100", 
    17 => "10111010000101100011010101100001", 
    18 => "00111111010110111010001011110000", 
    19 => "00111011000010100100011111101101", 
    20 => "10111001010011000111100011101010", 
    21 => "00111101110100000011011101010000", 
    22 => "00111110100100000001000001100010", 
    23 => "00111001111010101110000110001011", 
    24 => "00111101110111111101011100011011", 
    25 => "10111010100001110110010110111010", 
    26 => "00111110011101100000111100011011", 
    27 => "10111001111011001111101001101010", 
    28 => "00111101111100010111101111011001", 
    29 => "00111001100110000000101100100100", 
    30 => "10111001100101000101111110011110", 
    31 => "00111001111000100111111000001111", 
    32 => "00111111011110000111011001111101", 
    33 => "00111111011100001100111011110110", 
    34 => "00111001111001000001000010110110", 
    35 => "00111101111100110111110000010011", 
    36 => "10111010010111110001010110100101", 
    37 => "00111111001000100110110110011100", 
    38 => "00111101111001110001010110000011", 
    39 => "00111010000001111100101001100100", 
    40 => "00111000001001111100010110101100", 
    41 => "10111001111100101011111011001111", 
    42 => "00111110000011000001100011111000", 
    43 => "00111010000011011101000111100101", 
    44 => "00111110010100100110111011011011", 
    45 => "10111001110011101001000111001001", 
    46 => "00111111011001011111001100001110", 
    47 => "00111111011101111000000101100010", 
    48 => "00111001110001101011010010000101", 
    49 => "00111111011011111000101011000010", 
    50 => "10111001100110100010010000000011", 
    51 => "00111110010110100010010010001001", 
    52 => "00111001110101001101110001100110", 
    53 => "00111111000101001011000100000011", 
    54 => "00111111010110001100101101001011", 
    55 => "00111001100011110010000101110001", 
    56 => "10111010010000110100110000011011", 
    57 => "00111110010001011011001010010010", 
    58 => "00111010000010111011100100000110", 
    59 => "10111001001110101010010110000011", 
    60 => "00111111010111011000101001000100", 
    61 => "00111110110000101100101011111111", 
    62 => "10111001011000010111000110011111", 
    63 => "00111111000010101010011100100110", 
    64 => "00111111010011011101001110101010", 
    65 => "00111111010101000101110111111011", 
    66 => "00111001110000000110100111101000", 
    67 => "00111110001011001100100100100001", 
    68 => "00111110111101001101011101001001", 
    69 => "00111110010101010110011110011001", 
    70 => "00111001010010010101001110011100", 
    71 => "00111111000110110010001000001000", 
    72 => "00111110001111000000001111111111", 
    73 => "10111001101010100110010011000011", 
    74 => "00111110101111010010101101001110", 
    75 => "10111001001010111111011101101010", 
    76 => "00111110111001110111011000111110", 
    77 => "00111110110011011110110011100101", 
    78 => "00111111000111101010111100100101", 
    79 => "00111111000111000011000010110001", 
    80 => "00111111011010101101111001110110", 
    81 => "00111000101001111100010110101100", 
    82 => "10111001001001111100010110101100", 
    83 => "00111110100000101010110010111000", 
    84 => "00111110111111011000101000010001", 
    85 => "00111110110100001000001101010110", 
    86 => "00111110110110101100111110110111", 
    87 => "00111001111011011000000010100001", 
    88 => "00111000100010000101000010011100", 
    89 => "00111110001101111010110011000101", 
    90 => "00111111000001111001001001001011", 
    91 => "00111101111111001011101111000011", 
    92 => "00111001000101011111001001000101", 
    93 => "00110111111110111010100010000010", 
    94 => "00111001001100100100001000000111", 
    95 => "10111001001101010110011101010101", 
    96 => "00110111011110111010100010000010", 
    97 => "00111110100001100111010111111111", 
    98 => "10111001011110001000001100110100", 
    99 => "00111001100001000001111011011110", 
    100 => "00111111001100000000000000000000", 
    101 => "00111000110011111001111000111000", 
    102 => "10111000110010110110110001111010", 
    103 => "00111111001101110101001011101011", 
    104 => "10111000000011101001101100111001", 
    105 => "00111001000001110100010000101100", 
    106 => "00111110001101101110010111001101", 
    107 => "10111000111110111010100010000010", 
    108 => "00111110101111100010110101100010", 
    109 => "00111000110100011011011100010111", 
    110 => "10110111111000100111111000001111", 
    111 => "10111001101001110011111101110101", 
    112 => "10111000111011110001001101001001", 
    113 => "10111001001000101000011101111111", 
    114 => "00111111000010100010111010010000", 
    115 => "00111001011011001111101001101010", 
    116 => "00110101100001100011011110111101", 
    117 => "00111111010100010100010110000100", 
    118 => "00111110110001011110001000100110", 
    119 => "00111110110011111110011111100010", 
    120 => "10111001000000001111100110010000", 
    121 => "00111110110011110001010001010101", 
    122 => "00111110101110100001010011001111", 
    123 => "00111110111001110000011000101101", 
    124 => "00111110101101011110100111000000", 
    125 => "00111111000010110010110000110000", 
    126 => "00111001000110100010010000000011", 
    127 => "00111110011110010001111001100100", 
    128 => "00111110111000000010011111111010", 
    129 => "00111111001000011100001011010010", 
    130 => "10111001010000011111110010001111", 
    131 => "10111000100010000101000010011100", 
    132 => "00111110110101111100001011101100", 
    133 => "10110111001110001000110010100100", 
    134 => "00111110101010100111011001010011", 
    135 => "10111000000101101111111010110101", 
    136 => "10111001001100010011010110011000", 
    137 => "00111110111110100110011100011111", 
    138 => "00111110110111011101110011101000", 
    139 => "10111000101000010111101100001111", 
    140 => "00111000110001010010000111011110", 
    141 => "00111110110000011000111001010100", 
    142 => "00111110111100101000000011110001", 
    143 => "00111000110100011011011100010111", 
    144 => "00111000001000111001001111101110", 
    145 => "00111001010010010101001110011100", 
    146 => "00111000011010101110000110001011", 
    147 => "00111000111100010010110000101000", 
    148 => "00111111000010001111001000101000", 
    149 => "00111111001010110001111001111110", 
    150 => "10111000101100000010100100101000", 
    151 => "00111111001011111001101011110010", 
    152 => "00111110111000011110101100100000", 
    153 => "00111111000000110010111101000101", 
    154 => "00111110110101000011100100110111", 
    155 => "00111110101000000000000000000000", 
    156 => "00111000101001111100010110101100", 
    157 => "00111000101111001011111001100010", 
    158 => "10111000100010000101000010011100", 
    159 => "00111000001100000010100100101000", 
    160 => "00111001001010011101111010001011", 
    161 => "00111111000110110011010110001111", 
    162 => "10111000111011001111101001101010", 
    163 => "10111000100001000001111011011110", 
    164 => "00111111001000000001110001010000", 
    165 => "10111000101011100001000001001001", 
    166 => "00111110111110010111111001010110", 
    167 => "00110110010010010101001110011100", 
    168 => "10111000101001011010110011001101", 
    169 => "00111111000011101100010100011001", 
    170 => "00111111001110001000000000011111", 
    171 => "00111000100111010100100101010010", 
    172 => "00111111000111000010110100101000", 
    173 => "00111110111100010100010000100100", 
    174 => "00111111001101000101010111011010", 
    175 => "00111000111000100111111000001111", 
    176 => "00110110010010010101001110011100", 
    177 => "10111000011101110111011011000101", 
    178 => "00110111110010010101001110011100", 
    179 => "10110111100001100011011110111101", 
    180 => "00111000100111110110001000110000", 
    181 => "00111111001110111110001010010011", 
    182 => "00111000010010010101001110011100", 
    183 => "10110111011010101110000110001011", 
    184 => "10111000101000010111101100001111", 
    185 to 194=> "00000000000000000000000000000000" );


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

entity predict_ensemble_bKp is
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

architecture arch of predict_ensemble_bKp is
    component predict_ensemble_bKp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bKp_rom_U :  component predict_ensemble_bKp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


