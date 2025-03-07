-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_yd2_rom is 
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


architecture rtl of predict_ensemble_yd2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 to 3=> "00000000", 4 => "00000101", 
    5 => "00000000", 6 => "00000111", 7 => "00001001", 8 => "00001011", 
    9 => "00001101", 10 => "00001111", 11 => "00000000", 12 => "00010001", 
    13 => "00010011", 14 to 17=> "00000000", 18 => "00010101", 19 to 20=> "00000000", 
    21 => "00010111", 22 => "00011001", 23 => "00011011", 24 => "00000000", 
    25 => "00011101", 26 to 28=> "00000000", 29 => "00011111", 30 => "00000000", 
    31 => "00100001", 32 => "00100011", 33 => "00100101", 34 => "00100111", 
    35 => "00000000", 36 => "00101001", 37 => "00101011", 38 => "00000000", 
    39 => "00101101", 40 => "00101111", 41 to 46=> "00000000", 47 => "00110001", 
    48 => "00110011", 49 => "00000000", 50 => "00110101", 51 => "00110111", 
    52 => "00000000", 53 => "00111001", 54 => "00111011", 55 => "00111101", 
    56 => "00000000", 57 => "00111111", 58 to 60=> "00000000", 61 => "01000001", 
    62 => "01000011", 63 => "00000000", 64 => "01000101", 65 => "01000111", 
    66 => "01001001", 67 => "01001011", 68 => "00000000", 69 => "01001101", 
    70 => "01001111", 71 to 72=> "00000000", 73 => "01010001", 74 => "00000000", 
    75 => "01010011", 76 => "01010101", 77 to 78=> "00000000", 79 => "01010111", 
    80 => "00000000", 81 => "01011001", 82 => "01011011", 83 => "00000000", 
    84 => "01011101", 85 => "01011111", 86 to 93=> "00000000", 94 => "01100001", 
    95 => "01100011", 96 => "01100101", 97 to 98=> "00000000", 99 => "01100111", 
    100 => "01101001", 101 => "00000000", 102 => "01101011", 103 => "01101101", 
    104 => "01101111", 105 => "00000000", 106 => "01110001", 107 => "00000000", 
    108 => "01110011", 109 => "01110101", 110 => "00000000", 111 => "01110111", 
    112 => "00000000", 113 => "01111001", 114 to 117=> "00000000", 118 => "01111011", 
    119 to 120=> "00000000", 121 => "01111101", 122 => "01111111", 123 => "10000001", 
    124 => "00000000", 125 => "10000011", 126 => "00000000", 127 => "10000101", 
    128 => "00000000", 129 => "10000111", 130 => "10001001", 131 => "10001011", 
    132 => "10001101", 133 => "00000000", 134 => "10001111", 135 to 137=> "00000000", 
    138 => "10010001", 139 to 140=> "00000000", 141 => "10010011", 142 => "10010101", 
    143 to 144=> "00000000", 145 => "10010111", 146 => "00000000", 147 => "10011001", 
    148 => "00000000", 149 => "10011011", 150 => "10011101", 151 => "10011111", 
    152 => "00000000", 153 => "10100001", 154 => "00000000", 155 => "10100011", 
    156 to 157=> "00000000", 158 => "10100101", 159 => "10100111", 160 => "00000000", 
    161 => "10101001", 162 => "10101011", 163 to 167=> "00000000", 168 => "10101101", 
    169 => "10101111", 170 => "10110001", 171 => "10110011", 172 to 175=> "00000000", 
    176 => "10110101", 177 => "10110111", 178 => "10111001", 179 to 180=> "00000000", 
    181 => "10111011", 182 to 185=> "00000000", 186 => "10111101", 187 to 194=> "00000000" );


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

entity predict_ensemble_yd2 is
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

architecture arch of predict_ensemble_yd2 is
    component predict_ensemble_yd2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_yd2_rom_U :  component predict_ensemble_yd2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


