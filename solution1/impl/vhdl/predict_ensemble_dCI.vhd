-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dCI_rom is 
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


architecture rtl of predict_ensemble_dCI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000000", 5 => "00000111", 6 => "00000000", 7 => "00001001", 
    8 => "00000000", 9 => "00001011", 10 to 11=> "00000000", 12 => "00001101", 
    13 => "00000000", 14 => "00001111", 15 => "00000000", 16 => "00010001", 
    17 => "00000000", 18 => "00010011", 19 => "00010101", 20 => "00000000", 
    21 => "00010111", 22 => "00011001", 23 => "00011011", 24 => "00000000", 
    25 => "00011101", 26 => "00011111", 27 => "00100001", 28 => "00000000", 
    29 => "00100011", 30 => "00000000", 31 => "00100101", 32 => "00100111", 
    33 to 37=> "00000000", 38 => "00101001", 39 => "00000000", 40 => "00101011", 
    41 => "00000000", 42 => "00101101", 43 => "00000000", 44 => "00101111", 
    45 => "00000000", 46 => "00110001", 47 => "00110011", 48 => "00110101", 
    49 => "00110111", 50 => "00000000", 51 => "00111001", 52 to 53=> "00000000", 
    54 => "00111011", 55 => "00000000", 56 => "00111101", 57 => "00111111", 
    58 => "01000001", 59 => "00000000", 60 => "01000011", 61 => "00000000", 
    62 => "01000101", 63 => "01000111", 64 to 66=> "00000000", 67 => "01001001", 
    68 => "01001011", 69 => "00000000", 70 => "01001101", 71 => "00000000", 
    72 => "01001111", 73 => "01010001", 74 to 76=> "00000000", 77 => "01010011", 
    78 => "00000000", 79 => "01010101", 80 => "01010111", 81 => "01011001", 
    82 => "01011011", 83 => "00000000", 84 => "01011101", 85 => "01011111", 
    86 => "01100001", 87 to 90=> "00000000", 91 => "01100011", 92 => "00000000", 
    93 => "01100101", 94 to 95=> "00000000", 96 => "01100111", 97 to 99=> "00000000", 
    100 => "01101001", 101 to 102=> "00000000", 103 => "01101011", 104 => "00000000", 
    105 => "01101101", 106 => "00000000", 107 => "01101111", 108 => "00000000", 
    109 => "01110001", 110 => "00000000", 111 => "01110011", 112 => "00000000", 
    113 => "01110101", 114 => "00000000", 115 => "01110111", 116 => "01111001", 
    117 => "01111011", 118 to 122=> "00000000", 123 => "01111101", 124 => "01111111", 
    125 => "10000001", 126 => "00000000", 127 => "10000011", 128 => "00000000", 
    129 => "10000101", 130 to 132=> "00000000", 133 => "10000111", 134 => "00000000", 
    135 => "10001001", 136 => "00000000", 137 => "10001011", 138 => "00000000", 
    139 => "10001101", 140 => "10001111", 141 => "10010001", 142 to 144=> "00000000", 
    145 => "10010011", 146 => "10010101", 147 => "10010111", 148 => "00000000", 
    149 => "10011001", 150 => "10011011", 151 to 152=> "00000000", 153 => "10011101", 
    154 => "10011111", 155 => "00000000", 156 => "10100001", 157 => "10100011", 
    158 => "00000000", 159 => "10100101", 160 to 162=> "00000000", 163 => "10100111", 
    164 => "10101001", 165 to 166=> "00000000", 167 => "10101011", 168 to 170=> "00000000", 
    171 => "10101101", 172 => "10101111", 173 => "00000000", 174 => "10110001", 
    175 to 194=> "00000000" );


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

entity predict_ensemble_dCI is
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

architecture arch of predict_ensemble_dCI is
    component predict_ensemble_dCI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dCI_rom_U :  component predict_ensemble_dCI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


