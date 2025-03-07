-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ocq_rom is 
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


architecture rtl of predict_ensemble_ocq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00001011", 7 to 10=> "00000000", 
    11 => "00001101", 12 => "00001111", 13 => "00000000", 14 => "00010001", 
    15 to 16=> "00000000", 17 => "00010011", 18 => "00010101", 19 => "00000000", 
    20 => "00010111", 21 => "00011001", 22 => "00011011", 23 => "00011101", 
    24 => "00011111", 25 => "00100001", 26 => "00100011", 27 => "00100101", 
    28 => "00100111", 29 to 32=> "00000000", 33 => "00101001", 34 => "00101011", 
    35 => "00101101", 36 to 37=> "00000000", 38 => "00101111", 39 to 46=> "00000000", 
    47 => "00110001", 48 => "00110011", 49 to 50=> "00000000", 51 => "00110101", 
    52 => "00110111", 53 => "00111001", 54 => "00000000", 55 => "00111011", 
    56 => "00111101", 57 => "00111111", 58 => "01000001", 59 => "01000011", 
    60 => "00000000", 61 => "01000101", 62 to 66=> "00000000", 67 => "01000111", 
    68 => "01001001", 69 => "01001011", 70 to 72=> "00000000", 73 => "01001101", 
    74 => "01001111", 75 => "01010001", 76 => "00000000", 77 => "01010011", 
    78 => "01010101", 79 => "00000000", 80 => "01010111", 81 => "00000000", 
    82 => "01011001", 83 => "01011011", 84 => "01011101", 85 => "00000000", 
    86 => "01011111", 87 => "01100001", 88 => "01100011", 89 => "01100101", 
    90 => "01100111", 91 => "01101001", 92 to 93=> "00000000", 94 => "01101011", 
    95 => "01101101", 96 => "00000000", 97 => "01101111", 98 => "01110001", 
    99 to 100=> "00000000", 101 => "01110011", 102 to 103=> "00000000", 104 => "01110101", 
    105 => "01110111", 106 => "00000000", 107 => "01111001", 108 => "01111011", 
    109 to 113=> "00000000", 114 => "01111101", 115 => "00000000", 116 => "01111111", 
    117 => "00000000", 118 => "10000001", 119 => "00000000", 120 => "10000011", 
    121 => "10000101", 122 => "10000111", 123 to 124=> "00000000", 125 => "10001001", 
    126 => "10001011", 127 to 128=> "00000000", 129 => "10001101", 130 => "10001111", 
    131 to 133=> "00000000", 134 => "10010001", 135 => "00000000", 136 => "10010011", 
    137 to 140=> "00000000", 141 => "10010101", 142 => "10010111", 143 => "10011001", 
    144 => "10011011", 145 => "00000000", 146 => "10011101", 147 to 150=> "00000000", 
    151 => "10011111", 152 => "10100001", 153 to 155=> "00000000", 156 => "10100011", 
    157 => "10100101", 158 => "10100111", 159 to 161=> "00000000", 162 => "10101001", 
    163 => "10101011", 164 to 168=> "00000000", 169 => "10101101", 170 => "10101111", 
    171 to 172=> "00000000", 173 => "10110001", 174 => "10110011", 175 => "00000000", 
    176 => "10110101", 177 to 181=> "00000000", 182 => "10110111", 183 to 194=> "00000000" );


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

entity predict_ensemble_ocq is
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

architecture arch of predict_ensemble_ocq is
    component predict_ensemble_ocq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ocq_rom_U :  component predict_ensemble_ocq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


