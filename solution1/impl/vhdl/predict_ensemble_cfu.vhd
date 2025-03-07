-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cfu_rom is 
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


architecture rtl of predict_ensemble_cfu_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00001011", 
    9 => "00000000", 10 => "00001101", 11 to 13=> "00000000", 14 => "00001111", 
    15 => "00010001", 16 to 17=> "00000000", 18 => "00010011", 19 => "00010101", 
    20 => "00010111", 21 to 22=> "00000000", 23 => "00011001", 24 => "00011011", 
    25 => "00011101", 26 => "00011111", 27 => "00000000", 28 => "00100001", 
    29 => "00100011", 30 => "00000000", 31 => "00100101", 32 => "00000000", 
    33 => "00100111", 34 to 36=> "00000000", 37 => "00101001", 38 => "00000000", 
    39 => "00101011", 40 to 41=> "00000000", 42 => "00101101", 43 => "00000000", 
    44 => "00101111", 45 => "00110001", 46 => "00110011", 47 to 51=> "00000000", 
    52 => "00110101", 53 => "00000000", 54 => "00110111", 55 => "00111001", 
    56 => "00111011", 57 => "00111101", 58 => "00000000", 59 => "00111111", 
    60 => "00000000", 61 => "01000001", 62 to 64=> "00000000", 65 => "01000011", 
    66 => "01000101", 67 => "01000111", 68 => "00000000", 69 => "01001001", 
    70 to 71=> "00000000", 72 => "01001011", 73 => "01001101", 74 => "01001111", 
    75 to 76=> "00000000", 77 => "01010001", 78 => "01010011", 79 to 83=> "00000000", 
    84 => "01010101", 85 => "01010111", 86 => "01011001", 87 => "00000000", 
    88 => "01011011", 89 => "01011101", 90 => "00000000", 91 => "01011111", 
    92 => "00000000", 93 => "01100001", 94 => "00000000", 95 => "01100011", 
    96 => "00000000", 97 => "01100101", 98 => "01100111", 99 => "01101001", 
    100 => "01101011", 101 => "01101101", 102 => "00000000", 103 => "01101111", 
    104 => "01110001", 105 => "01110011", 106 => "01110101", 107 => "01110111", 
    108 => "01111001", 109 => "00000000", 110 => "01111011", 111 => "00000000", 
    112 => "01111101", 113 to 114=> "00000000", 115 => "01111111", 116 => "00000000", 
    117 => "10000001", 118 => "10000011", 119 => "10000101", 120 to 124=> "00000000", 
    125 => "10000111", 126 => "10001001", 127 => "10001011", 128 to 129=> "00000000", 
    130 => "10001101", 131 => "10001111", 132 => "10010001", 133 to 136=> "00000000", 
    137 => "10010011", 138 => "10010101", 139 to 140=> "00000000", 141 => "10010111", 
    142 => "10011001", 143 => "10011011", 144 => "10011101", 145 => "10011111", 
    146 to 147=> "00000000", 148 => "10100001", 149 to 154=> "00000000", 155 => "10100011", 
    156 => "00000000", 157 => "10100101", 158 => "10100111", 159 to 160=> "00000000", 
    161 => "10101001", 162 => "10101011", 163 => "10101101", 164 => "00000000", 
    165 => "10101111", 166 to 170=> "00000000", 171 => "10110001", 172 => "10110011", 
    173 to 176=> "00000000", 177 => "10110101", 178 to 179=> "00000000", 180 => "10110111", 
    181 => "10111001", 182 to 194=> "00000000" );


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

entity predict_ensemble_cfu is
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

architecture arch of predict_ensemble_cfu is
    component predict_ensemble_cfu_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cfu_rom_U :  component predict_ensemble_cfu_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


