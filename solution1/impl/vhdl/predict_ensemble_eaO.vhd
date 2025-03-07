-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eaO_rom is 
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


architecture rtl of predict_ensemble_eaO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101001011000010100010110011", 
    1 => "10111000100110010001011110010100", 
    2 => "00111101011001100000111001010010", 
    3 => "00111110101011100010011000001011", 
    4 => "00111101100001000010011101000010", 
    5 => "00111000111110111010100010000010", 
    6 => "10111000010100011011011100010111", 
    7 => "00111111000110111101010111011100", 
    8 => "00111101100100001111111000000100", 
    9 => "00110111111100110100010100000111", 
    10 => "10111000110001010010000111011110", 
    11 => "00111000010100011011011100010111", 
    12 => "00111111011110000111011001111101", 
    13 => "00111111011011100101000000001101", 
    14 => "00111000001100000010100100101000", 
    15 => "00111101010111000100010101000110", 
    16 => "10111000000100101100110011110111", 
    17 => "10110111110010010101001110011100", 
    18 => "00111100010011110000001100001000", 
    19 => "00111000001001111100010110101100", 
    20 => "00111101101111001000001000010111", 
    21 => "10110111100101101111111010110101", 
    22 => "00111101110110001001100010110011", 
    23 => "00110111101110001000110010100100", 
    24 => "00111111001100000000000000000000", 
    25 => "00111111011101010110101001001000", 
    26 => "00111110001000110110111011111000", 
    27 => "00111101001010001001111010111010", 
    28 => "00110111010110100001101010010011", 
    29 => "10110111110000001111000000100000", 
    30 => "00111101110010011101011110111010", 
    31 => "10110111010110100001101010010011", 
    32 => "00111111011000011100000110110101", 
    33 => "10110111100101101111111010110101", 
    34 => "00111110100000111111110110010011", 
    35 => "00111101100000000000000000000000", 
    36 => "00110111001001111100010110101100", 
    37 => "00111110100000001011011101011111", 
    38 => "00111101110111110000011011110111", 
    39 => "00110111000101101111111010110101", 
    40 => "00111101111101010111000111010010", 
    41 => "00111110001110001001011001010111", 
    42 => "10110111101100000010100100101000", 
    43 => "00110111011010101110000110001011", 
    44 => "00111111000011011101101111001011", 
    45 => "00110111001001111100010110101100", 
    46 => "00111110100110001001110010000000", 
    47 => "10110110101001111100010110101100", 
    48 => "00110101100001100011011110111101", 
    49 => "00111110011000111010011010001011", 
    50 => "00111110010100111001000011001001", 
    51 => "00110111000101101111111010110101", 
    52 => "00111110000010001100101100001000", 
    53 => "00111110010100000101111000011100", 
    54 => "00111110010100011010100101110110", 
    55 => "00110111100001100011011110111101", 
    56 => "00111111001010010011010010001011", 
    57 => "10110111000001100011011110111101", 
    58 => "00111101101010010101000110000011", 
    59 => "10110111101100000010100100101000", 
    60 => "00111110111000110010010100101101", 
    61 => "00110110100001100011011110111101", 
    62 => "00111110100101101010011100100110", 
    63 => "00111110001111110111000110101000", 
    64 => "00110110110010010101001110011100", 
    65 => "00110111000001100011011110111101", 
    66 => "00111111011010011001101001010010", 
    67 => "10110110111010101110000110001011", 
    68 => "10110101100001100011011110111101", 
    69 => "10110110110010010101001110011100", 
    70 => "00111111010001110100010111010000", 
    71 => "00111110111011000100110011100000", 
    72 => "00110110000001100011011110111101", 
    73 => "00111101110010111100110011110011", 
    74 => "00111111000011100110100011100100", 
    75 => "00111110000011011110101001000110", 
    76 to 77=> "10110110000001100011011110111101", 
    78 => "00111111000010100001100000010110", 
    79 => "10110110110010010101001110011100", 
    80 => "00111110010000111011010011110110", 
    81 => "10110111001001111100010110101100", 
    82 => "00111101101100111011011101010010", 
    83 => "00110110101001111100010110101100", 
    84 => "00111111000000000101100100100001", 
    85 => "10000000000000000000000000000000", 
    86 => "00110101100001100011011110111101", 
    87 => "00110110111010101110000110001011", 
    88 => "00111110011110100001010011001111", 
    89 => "00110101100001100011011110111101", 
    90 => "10110110100001100011011110111101", 
    91 => "00111110110001011010000111101100", 
    92 => "00111111001001100000110101111000", 
    93 => "10110110100001100011011110111101", 
    94 => "00111110001100110000100101000010", 
    95 => "10000000000000000000000000000000", 
    96 => "00000000000000000000000000000000", 
    97 => "00110110000001100011011110111101", 
    98 => "10000000000000000000000000000000", 
    99 => "00110110100001100011011110111101", 
    100 => "00111110010101100100000111110110", 
    101 => "10110110100001100011011110111101", 
    102 => "00111111010111110110101001110010", 
    103 => "00111111011100101010010000110011", 
    104 => "00110110100001100011011110111101", 
    105 => "00111110011101010100110000010010", 
    106 to 107=> "00110110010010010101001110011100", 
    108 => "00111110011011000100100110111010", 
    109 => "10110110000001100011011110111101", 
    110 => "00111110010000111101000001111101", 
    111 => "00110110100001100011011110111101", 
    112 => "00111110101000111000000100110000", 
    113 => "00111110110011010100101000011011", 
    114 => "00111110101010101101111100001101", 
    115 => "10110110101001111100010110101100", 
    116 => "10110110010010010101001110011100", 
    117 => "00110110010010010101001110011100", 
    118 => "00111111010001101101110001111111", 
    119 => "00111111010111100010101101011010", 
    120 => "10110110000001100011011110111101", 
    121 => "00111111010100001101011011000011", 
    122 => "00110110000001100011011110111101", 
    123 => "00111111010100000101110010001001", 
    124 => "10110101100001100011011110111101", 
    125 => "00111111001011011101110010100101", 
    126 => "10110101100001100011011110111101", 
    127 => "00111111001000101100010011010110", 
    128 => "00111110101110111101101100011010", 
    129 => "00111110101110100001111110001110", 
    130 => "10110110000001100011011110111101", 
    131 => "00000000000000000000000000000000", 
    132 => "00110110000001100011011110111101", 
    133 => "00111111000000100110000111110010", 
    134 => "00111111010101000011010101111010", 
    135 => "00111110110110000111000001110110", 
    136 => "10000000000000000000000000000000", 
    137 => "00111110111011100001110111101011", 
    138 => "10110110000001100011011110111101", 
    139 => "00110110010010010101001110011100", 
    140 => "00000000000000000000000000000000", 
    141 => "00111110101111001111100000001110", 
    142 => "00111110111101001011111011000110", 
    143 => "10110101100001100011011110111101", 
    144 => "00111110101010000100010011010000", 
    145 => "10110101100001100011011110111101", 
    146 => "00111111001000010111101101010011", 
    147 => "00110101100001100011011110111101", 
    148 => "00111110110010010010100001011011", 
    149 => "00111111000111110011111001010111", 
    150 => "00111111011001111111010001010110", 
    151 => "00111111001101100110011111111001", 
    152 => "00111111010101111110101111110010", 
    153 => "00111111000110011100011100000100", 
    154 => "10110101100001100011011110111101", 
    155 => "00111111000110101111000110001000", 
    156 => "00110101100001100011011110111101", 
    157 => "10110101100001100011011110111101", 
    158 => "10000000000000000000000000000000", 
    159 => "00111111010001111000110101100001", 
    160 => "00111111011001010000101000110101", 
    161 => "00111111000000100100000001000010", 
    162 => "00110101100001100011011110111101", 
    163 => "10000000000000000000000000000000", 
    164 => "00110101100001100011011110111101", 
    165 => "00111110110111111000110110010011", 
    166 => "00110101100001100011011110111101", 
    167 => "10110101100001100011011110111101", 
    168 to 169=> "00000000000000000000000000000000", 
    170 => "00111111001000111010001011100000", 
    171 => "00111110110110100010010001101000", 
    172 => "10000000000000000000000000000000", 
    173 => "10110101100001100011011110111101", 
    174 => "10000000000000000000000000000000", 
    175 => "00000000000000000000000000000000", 
    176 => "00110101100001100011011110111101", 
    177 to 194=> "00000000000000000000000000000000" );


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

entity predict_ensemble_eaO is
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

architecture arch of predict_ensemble_eaO is
    component predict_ensemble_eaO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eaO_rom_U :  component predict_ensemble_eaO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


