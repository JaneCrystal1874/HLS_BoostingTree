-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bLp_rom is 
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


architecture rtl of predict_ensemble_bLp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000000", 6 => "00000111", 7 => "00001001", 
    8 => "00001011", 9 => "00001101", 10 => "00000000", 11 => "00001111", 
    12 => "00010001", 13 to 15=> "00000000", 16 => "00010011", 17 => "00000000", 
    18 => "00010101", 19 to 20=> "00000000", 21 => "00010111", 22 => "00011001", 
    23 => "00000000", 24 => "00011011", 25 => "00000000", 26 => "00011101", 
    27 => "00000000", 28 => "00011111", 29 to 31=> "00000000", 32 => "00100001", 
    33 => "00100011", 34 => "00000000", 35 => "00100101", 36 => "00000000", 
    37 => "00100111", 38 => "00101001", 39 to 41=> "00000000", 42 => "00101011", 
    43 => "00000000", 44 => "00101101", 45 => "00000000", 46 => "00101111", 
    47 => "00110001", 48 => "00000000", 49 => "00110011", 50 => "00000000", 
    51 => "00110101", 52 => "00000000", 53 => "00110111", 54 => "00111001", 
    55 to 56=> "00000000", 57 => "00111011", 58 to 59=> "00000000", 60 => "00111101", 
    61 => "00111111", 62 => "00000000", 63 => "01000001", 64 => "01000011", 
    65 => "01000101", 66 => "00000000", 67 => "01000111", 68 => "01001001", 
    69 => "01001011", 70 => "00000000", 71 => "01001101", 72 => "01001111", 
    73 => "00000000", 74 => "01010001", 75 => "00000000", 76 => "01010011", 
    77 => "01010101", 78 => "01010111", 79 => "01011001", 80 => "01011011", 
    81 to 82=> "00000000", 83 => "01011101", 84 => "01011111", 85 => "01100001", 
    86 => "01100011", 87 to 88=> "00000000", 89 => "01100101", 90 => "01100111", 
    91 => "01101001", 92 to 96=> "00000000", 97 => "01101011", 98 to 99=> "00000000", 
    100 => "01101101", 101 to 102=> "00000000", 103 => "01101111", 104 to 105=> "00000000", 
    106 => "01110001", 107 => "00000000", 108 => "01110011", 109 to 113=> "00000000", 
    114 => "01110101", 115 to 116=> "00000000", 117 => "01110111", 118 => "01111001", 
    119 => "01111011", 120 => "00000000", 121 => "01111101", 122 => "01111111", 
    123 => "10000001", 124 => "10000011", 125 => "10000101", 126 => "00000000", 
    127 => "10000111", 128 => "10001001", 129 => "10001011", 130 to 131=> "00000000", 
    132 => "10001101", 133 => "00000000", 134 => "10001111", 135 to 136=> "00000000", 
    137 => "10010001", 138 => "10010011", 139 to 140=> "00000000", 141 => "10010101", 
    142 => "10010111", 143 to 147=> "00000000", 148 => "10011001", 149 => "10011011", 
    150 => "00000000", 151 => "10011101", 152 => "10011111", 153 => "10100001", 
    154 => "10100011", 155 => "10100101", 156 to 160=> "00000000", 161 => "10100111", 
    162 to 163=> "00000000", 164 => "10101001", 165 => "00000000", 166 => "10101011", 
    167 to 168=> "00000000", 169 => "10101101", 170 => "10101111", 171 => "00000000", 
    172 => "10110001", 173 => "10110011", 174 => "10110101", 175 to 180=> "00000000", 
    181 => "10110111", 182 to 194=> "00000000" );


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

entity predict_ensemble_bLp is
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

architecture arch of predict_ensemble_bLp is
    component predict_ensemble_bLp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bLp_rom_U :  component predict_ensemble_bLp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


