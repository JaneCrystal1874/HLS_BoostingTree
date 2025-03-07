-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ibs_rom is 
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


architecture rtl of predict_ensemble_ibs_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110101110011101100100101011", 
    1 => "00111110111011000110010110100101", 
    2 => "00111110111101011010011001000000", 
    3 => "00111111000001000001100100111011", 
    4 => "00111110000100110110001110110010", 
    5 => "00111111011100010110110101001100", 
    6 => "00111101100001111001011001111101", 
    7 => "00111110101010110110110010111110", 
    8 => "00111110110101001001111000000010", 
    9 => "10111101111001011001101001110100", 
    10 => "10111011000010011100000110110101", 
    11 => "00111111000010001111001110011001", 
    12 => "00111101111111111110010111001001", 
    13 => "00111101001000010001101010010111", 
    14 => "00111101101010010101000110000011", 
    15 => "00111101111001110001010110000011", 
    16 => "00111110100010001100111011010101", 
    17 => "00111110111111101000001110100001", 
    18 => "10111101110010110100011101000001", 
    19 => "00111110110001011100010001000100", 
    20 => "10111101100000000010011001000110", 
    21 => "10111101110110111101110101110110", 
    22 => "00111111000000000110001100010111", 
    23 => "10111100101110101000100000100111", 
    24 => "00111101111001001100010010001011", 
    25 => "00111100110010011010010101100101", 
    26 => "00111110100100001111100110110001", 
    27 => "00111110010101100110101111101000", 
    28 => "00111110100111011100110011101010", 
    29 => "00111111000000000111110111010100", 
    30 => "00111110110011111001101111111110", 
    31 => "10111101001000100111000101111010", 
    32 => "00111101111101011100001000001001", 
    33 => "00111101001111100110100100100111", 
    34 => "00111110111110001100000000100111", 
    35 => "10111101010111110101000001011101", 
    36 => "00111110111011010100100001000101", 
    37 => "10111100101111100101101110000101", 
    38 => "00111110110110101111011111110101", 
    39 => "00111110100010101110001100111111", 
    40 => "10111101101000110100001000100100", 
    41 => "00111110110111010000100100111001", 
    42 => "00111101011000101101100000111100", 
    43 => "00111101110111001000010010110110", 
    44 => "00111100111010111011001101000010", 
    45 => "00111111010011010001011001010101", 
    46 => "00111110000010001100010101000011", 
    47 => "00111110010010010100100011011100", 
    48 => "10111100110000001111111011001110", 
    49 => "00111111001000101110100011000000", 
    50 => "10111101000001101011100010110111", 
    51 => "00111101010011001001010000101101", 
    52 => "00111110011011001111111100100010", 
    53 => "00111101101110110010011100000011", 
    54 => "00111101000000110101101011001001", 
    55 => "10111100110110000110100001110111", 
    56 => "00111110111100111110110100110001", 
    57 => "10111101100101100101110000101101", 
    58 => "00111111011110111100000110001011", 
    59 => "00111101100111000111101000111010", 
    60 => "00111110000110111101111110001111", 
    61 => "00111110100110110110111011111000", 
    62 => "00111110010110001101100101110011", 
    63 => "00111100111001011010000101000101", 
    64 => "00111110110010111010011111011011", 
    65 => "00111100111011111111001110101110", 
    66 => "10111100000000011110110011010101", 
    67 => "00111011101000111001110001010010", 
    68 => "10111101011100011111100110101101", 
    69 => "00111011100110101001100101110100", 
    70 => "00111101000010000101010011001110", 
    71 => "00111111010011100011000100101111", 
    72 => "10111100111100101111100110000111", 
    73 => "10111101010111010110001001111100", 
    74 => "00111110010101110100010110111111", 
    75 => "00111100001111100000100110111011", 
    76 => "00111101011011011010101010010011", 
    77 => "10111100110111110111110001100111", 
    78 => "00111110001101010001110110101100", 
    79 => "00111100000010000011111111010101", 
    80 => "10111101000110110000101010110011", 
    81 => "10111011100101110010100010100110", 
    82 => "00111100110000001011000100110110", 
    83 => "00111110111110101111111100101010", 
    84 => "00111101111101011111111101100001", 
    85 => "00111110110101001011111101101110", 
    86 => "00111110100011011000010001101111", 
    87 => "00111101101100011010111010110100", 
    88 => "00111110111010100101010011100111", 
    89 => "00111111001001010010100000111001", 
    90 => "00111110101001100110101001110111", 
    91 => "00111110101110110001001100010110", 
    92 => "00111011101101111101010000010111", 
    93 => "00111110110110100000001110000010", 
    94 => "00111110101100000011000110001100", 
    95 => "00111101010110001000111101000011", 
    96 => "00111111000101101001010000100101", 
    97 => "00111101011110100100111001111011", 
    98 => "00111010110101000101011000101110", 
    99 => "00111111001100111010100111100011", 
    100 => "00111110111101110100010111100001", 
    101 => "00111101010111110001001001111111", 
    102 => "00111100110010110011001111011011", 
    103 => "00111110101000110100000011010101", 
    104 => "00111101000100001110111111011101", 
    105 => "00111111000101011101000101110000", 
    106 => "00111100011100100010011111010000", 
    107 => "10111100101000101101001011111110", 
    108 => "00111100101011101000100111101100", 
    109 => "00111111000110100101100100111010", 
    110 => "00111111001110001100000010101101", 
    111 => "00111111000101011110111110000101", 
    112 => "00111110111000111010000011000111", 
    113 => "00111111000011001010000101001001", 
    114 => "00111100011001001100100101000011", 
    115 => "10111100101010011100011101111010", 
    116 => "00111110100000101111111010100100", 
    117 => "00111011110000110000100011111111", 
    118 => "00111111001100000111000100011101", 
    119 => "10111100110110010111000010110101", 
    120 => "00111111010110011001010010011111", 
    121 => "00111110111100101000000011110001", 
    122 => "00111110110000101110100011000000", 
    123 => "00111100110010000001001010111110", 
    124 => "00111111000011011111000001011111", 
    125 => "00111010011101000101000101110110", 
    126 => "10111100001011011111011100011111", 
    127 => "00111100001001101010110010101000", 
    128 => "10111100100000011000100000101011", 
    129 => "00111101010101101111011001010001", 
    130 => "00111100101100110110110111101100", 
    131 => "00111101000010111001011001101100", 
    132 => "10111011110000010110110111110100", 
    133 => "00111110110100110000001101011100", 
    134 => "10111100010011011100000000010010", 
    135 => "00111110110001011001111111010011", 
    136 => "00111111000001101000111000101110", 
    137 => "00111110111000011100011011010010", 
    138 => "00111111010000100111000111001110", 
    139 => "10111011101100111110010101110101", 
    140 => "00111101000010010011011101001100", 
    141 => "00111111000100101100010101101101", 
    142 => "00111111001000111011111011011011", 
    143 => "10111100101100100100010000100000", 
    144 => "00111111000111011000111110010011", 
    145 => "10111100110000100001100111101011", 
    146 => "00111110111001101010000000010010", 
    147 => "00111110100011001000111000000100", 
    148 => "00111111010011101010110001100100", 
    149 => "10111100100110100111110000011000", 
    150 => "00111100100010001101111100110111", 
    151 => "10111100001111010010011100111101", 
    152 => "10111101000100010100111000111100", 
    153 => "10111101011001010001110000011001", 
    154 => "10111101000010101001000101010011", 
    155 => "00111111000110010110111100000000", 
    156 => "00111110001110101001011111100001", 
    157 => "00111111000110001101011111100000", 
    158 => "10111100101010010111101111111010", 
    159 => "00111101000100001010111011011010", 
    160 => "00111100010100001011111110100001", 
    161 => "00111100110111001011100110101010", 
    162 => "00111011100110011011011011110110", 
    163 => "00111111000001000110011001001101", 
    164 => "00111110111110100100010100101100", 
    165 => "00111100101000111100001000010010", 
    166 => "10111011010101001000100010000011", 
    167 => "10111100001111011101001100110101", 
    168 => "10111100110111011000100101001000", 
    169 => "00111110111111000011101000000000", 
    170 => "00111111001001101000101110100000", 
    171 => "10111011101110111110110010101011", 
    172 => "10111100100010111111111000111011", 
    173 => "00111110111001101100001110011000", 
    174 => "00111100010111100000010100000011", 
    175 => "10111100000000111111110101010000", 
    176 => "00111111010000101101011000010011", 
    177 => "00111100000011000101000000000101", 
    178 => "10111011101001110101100010011111", 
    179 to 194=> "00000000000000000000000000000000" );


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

entity predict_ensemble_ibs is
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

architecture arch of predict_ensemble_ibs is
    component predict_ensemble_ibs_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ibs_rom_U :  component predict_ensemble_ibs_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


