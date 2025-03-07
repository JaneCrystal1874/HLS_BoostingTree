-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eKT_rom is 
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


architecture rtl of predict_ensemble_eKT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 to 3=> "00000000", 4 => "00000101", 
    5 => "00000000", 6 => "00000111", 7 => "00000000", 8 => "00001001", 
    9 => "00001011", 10 => "00000000", 11 => "00001101", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 to 19=> "00000000", 20 => "00010101", 
    21 => "00010111", 22 => "00011001", 23 => "00011011", 24 to 25=> "00000000", 
    26 => "00011101", 27 => "00000000", 28 => "00011111", 29 => "00100001", 
    30 => "00100011", 31 => "00100101", 32 to 35=> "00000000", 36 => "00100111", 
    37 => "00000000", 38 => "00101001", 39 => "00000000", 40 => "00101011", 
    41 => "00000000", 42 => "00101101", 43 => "00101111", 44 => "00110001", 
    45 => "00110011", 46 => "00000000", 47 => "00110101", 48 => "00000000", 
    49 => "00110111", 50 => "00111001", 51 => "00000000", 52 => "00111011", 
    53 to 55=> "00000000", 56 => "00111101", 57 to 58=> "00000000", 59 => "00111111", 
    60 to 61=> "00000000", 62 => "01000001", 63 to 64=> "00000000", 65 => "01000011", 
    66 => "00000000", 67 => "01000101", 68 => "00000000", 69 => "01000111", 
    70 => "00000000", 71 => "01001001", 72 => "01001011", 73 => "01001101", 
    74 to 77=> "00000000", 78 => "01001111", 79 => "01010001", 80 => "01010011", 
    81 => "01010101", 82 => "00000000", 83 => "01010111", 84 to 85=> "00000000", 
    86 => "01011001", 87 => "00000000", 88 => "01011011", 89 => "01011101", 
    90 => "00000000", 91 => "01011111", 92 => "01100001", 93 => "01100011", 
    94 => "01100101", 95 => "00000000", 96 => "01100111", 97 => "00000000", 
    98 => "01101001", 99 => "01101011", 100 => "01101101", 101 => "01101111", 
    102 => "01110001", 103 => "01110011", 104 to 105=> "00000000", 106 => "01110101", 
    107 to 110=> "00000000", 111 => "01110111", 112 => "00000000", 113 => "01111001", 
    114 => "01111011", 115 to 116=> "00000000", 117 => "01111101", 118 => "01111111", 
    119 to 120=> "00000000", 121 => "10000001", 122 to 124=> "00000000", 125 => "10000011", 
    126 to 129=> "00000000", 130 => "10000101", 131 => "10000111", 132 => "00000000", 
    133 => "10001001", 134 => "00000000", 135 => "10001011", 136 => "00000000", 
    137 => "10001101", 138 => "10001111", 139 => "10010001", 140 => "00000000", 
    141 => "10010011", 142 => "10010101", 143 to 146=> "00000000", 147 => "10010111", 
    148 to 150=> "00000000", 151 => "10011001", 152 => "10011011", 153 to 155=> "00000000", 
    156 => "10011101", 157 => "10011111", 158 => "10100001", 159 => "00000000", 
    160 => "10100011", 161 => "00000000", 162 => "10100101", 163 to 194=> "00000000" );


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

entity predict_ensemble_eKT is
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

architecture arch of predict_ensemble_eKT is
    component predict_ensemble_eKT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eKT_rom_U :  component predict_ensemble_eKT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


