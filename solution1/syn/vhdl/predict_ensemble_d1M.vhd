-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d1M_rom is 
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


architecture rtl of predict_ensemble_d1M_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 to 7=> "00000000", 8 => "00001011", 
    9 => "00001101", 10 => "00000000", 11 => "00001111", 12 to 14=> "00000000", 
    15 => "00010001", 16 to 17=> "00000000", 18 => "00010011", 19 => "00000000", 
    20 => "00010101", 21 => "00010111", 22 => "00011001", 23 to 25=> "00000000", 
    26 => "00011011", 27 => "00011101", 28 => "00011111", 29 => "00100001", 
    30 to 31=> "00000000", 32 => "00100011", 33 => "00100101", 34 to 35=> "00000000", 
    36 => "00100111", 37 => "00101001", 38 to 39=> "00000000", 40 => "00101011", 
    41 to 42=> "00000000", 43 => "00101101", 44 to 45=> "00000000", 46 => "00101111", 
    47 => "00000000", 48 => "00110001", 49 => "00110011", 50 => "00000000", 
    51 => "00110101", 52 => "00110111", 53 to 55=> "00000000", 56 => "00111001", 
    57 => "00000000", 58 => "00111011", 59 => "00111101", 60 => "00000000", 
    61 => "00111111", 62 => "01000001", 63 => "01000011", 64 => "01000101", 
    65 to 66=> "00000000", 67 => "01000111", 68 => "01001001", 69 => "01001011", 
    70 => "01001101", 71 to 74=> "00000000", 75 => "01001111", 76 => "00000000", 
    77 => "01010001", 78 => "01010011", 79 => "01010101", 80 => "01010111", 
    81 => "01011001", 82 => "00000000", 83 => "01011011", 84 => "01011101", 
    85 => "01011111", 86 => "00000000", 87 => "01100001", 88 => "01100011", 
    89 to 90=> "00000000", 91 => "01100101", 92 to 93=> "00000000", 94 => "01100111", 
    95 to 96=> "00000000", 97 => "01101001", 98 to 101=> "00000000", 102 => "01101011", 
    103 => "01101101", 104 => "01101111", 105 to 106=> "00000000", 107 => "01110001", 
    108 to 110=> "00000000", 111 => "01110011", 112 => "01110101", 113 to 114=> "00000000", 
    115 => "01110111", 116 to 117=> "00000000", 118 => "01111001", 119 => "01111011", 
    120 => "00000000", 121 => "01111101", 122 to 123=> "00000000", 124 => "01111111", 
    125 => "10000001", 126 => "10000011", 127 => "10000101", 128 to 131=> "00000000", 
    132 => "10000111", 133 to 135=> "00000000", 136 => "10001001", 137 => "10001011", 
    138 => "10001101", 139 => "10001111", 140 => "00000000", 141 => "10010001", 
    142 => "10010011", 143 => "00000000", 144 => "10010101", 145 => "10010111", 
    146 => "10011001", 147 => "00000000", 148 => "10011011", 149 => "10011101", 
    150 => "10011111", 151 to 153=> "00000000", 154 => "10100001", 155 => "10100011", 
    156 => "10100101", 157 => "00000000", 158 => "10100111", 159 to 162=> "00000000", 
    163 => "10101001", 164 => "00000000", 165 => "10101011", 166 to 169=> "00000000", 
    170 => "10101101", 171 => "10101111", 172 => "10110001", 173 => "10110011", 
    174 to 175=> "00000000", 176 => "10110101", 177 => "10110111", 178 to 181=> "00000000", 
    182 => "10111001", 183 to 194=> "00000000" );


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

entity predict_ensemble_d1M is
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

architecture arch of predict_ensemble_d1M is
    component predict_ensemble_d1M_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d1M_rom_U :  component predict_ensemble_d1M_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


