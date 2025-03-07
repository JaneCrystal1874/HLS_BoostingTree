-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dMK_rom is 
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


architecture rtl of predict_ensemble_dMK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 to 5=> "00000000", 6 => "00001001", 7 => "00001011", 8 => "00000000", 
    9 => "00001101", 10 => "00001111", 11 to 12=> "00000000", 13 => "00010001", 
    14 => "00010011", 15 => "00010101", 16 => "00010111", 17 => "00000000", 
    18 => "00011001", 19 => "00000000", 20 => "00011011", 21 to 22=> "00000000", 
    23 => "00011101", 24 => "00011111", 25 => "00100001", 26 => "00100011", 
    27 to 29=> "00000000", 30 => "00100101", 31 => "00100111", 32 => "00101001", 
    33 => "00101011", 34 => "00101101", 35 => "00101111", 36 => "00110001", 
    37 => "00000000", 38 => "00110011", 39 to 41=> "00000000", 42 => "00110101", 
    43 => "00110111", 44 to 45=> "00000000", 46 => "00111001", 47 => "00111011", 
    48 => "00111101", 49 => "00000000", 50 => "00111111", 51 to 52=> "00000000", 
    53 => "01000001", 54 => "01000011", 55 => "01000101", 56 => "00000000", 
    57 => "01000111", 58 => "00000000", 59 => "01001001", 60 => "01001011", 
    61 => "00000000", 62 => "01001101", 63 => "01001111", 64 to 67=> "00000000", 
    68 => "01010001", 69 => "00000000", 70 => "01010011", 71 => "01010101", 
    72 => "01010111", 73 => "01011001", 74 => "01011011", 75 => "00000000", 
    76 => "01011101", 77 to 78=> "00000000", 79 => "01011111", 80 => "01100001", 
    81 => "00000000", 82 => "01100011", 83 => "01100101", 84 => "01100111", 
    85 => "00000000", 86 => "01101001", 87 to 89=> "00000000", 90 => "01101011", 
    91 => "01101101", 92 => "01101111", 93 to 94=> "00000000", 95 => "01110001", 
    96 to 99=> "00000000", 100 => "01110011", 101 to 103=> "00000000", 104 => "01110101", 
    105 to 106=> "00000000", 107 => "01110111", 108 => "00000000", 109 => "01111001", 
    110 to 115=> "00000000", 116 => "01111011", 117 to 118=> "00000000", 119 => "01111101", 
    120 => "01111111", 121 to 123=> "00000000", 124 => "10000001", 125 => "10000011", 
    126 => "00000000", 127 => "10000101", 128 to 129=> "00000000", 130 => "10000111", 
    131 => "10001001", 132 => "10001011", 133 => "00000000", 134 => "10001101", 
    135 to 136=> "00000000", 137 => "10001111", 138 => "00000000", 139 => "10010001", 
    140 => "00000000", 141 => "10010011", 142 => "10010101", 143 to 146=> "00000000", 
    147 => "10010111", 148 => "10011001", 149 => "10011011", 150 => "10011101", 
    151 => "10011111", 152 => "10100001", 153 to 154=> "00000000", 155 => "10100011", 
    156 => "10100101", 157 => "10100111", 158 => "00000000", 159 => "10101001", 
    160 => "10101011", 161 => "00000000", 162 => "10101101", 163 => "10101111", 
    164 => "10110001", 165 to 168=> "00000000", 169 => "10110011", 170 to 171=> "00000000", 
    172 => "10110101", 173 to 194=> "00000000" );


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

entity predict_ensemble_dMK is
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

architecture arch of predict_ensemble_dMK is
    component predict_ensemble_dMK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dMK_rom_U :  component predict_ensemble_dMK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


