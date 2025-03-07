-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_feY_rom is 
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


architecture rtl of predict_ensemble_feY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00001011", 7 => "00001101", 
    8 => "00001111", 9 to 11=> "00000000", 12 => "00010001", 13 => "00010011", 
    14 => "00000000", 15 => "00010101", 16 => "00010111", 17 => "00000000", 
    18 => "00011001", 19 => "00011011", 20 => "00000000", 21 => "00011101", 
    22 => "00011111", 23 => "00000000", 24 => "00100001", 25 => "00100011", 
    26 => "00000000", 27 => "00100101", 28 => "00000000", 29 => "00100111", 
    30 => "00000000", 31 => "00101001", 32 => "00101011", 33 => "00101101", 
    34 => "00101111", 35 => "00110001", 36 => "00110011", 37 => "00110101", 
    38 => "00110111", 39 => "00111001", 40 to 43=> "00000000", 44 => "00111011", 
    45 => "00000000", 46 => "00111101", 47 => "00000000", 48 => "00111111", 
    49 => "01000001", 50 => "01000011", 51 => "01000101", 52 => "01000111", 
    53 => "00000000", 54 => "01001001", 55 => "01001011", 56 => "00000000", 
    57 => "01001101", 58 => "01001111", 59 to 60=> "00000000", 61 => "01010001", 
    62 => "01010011", 63 => "01010101", 64 => "01010111", 65 => "01011001", 
    66 to 70=> "00000000", 71 => "01011011", 72 => "00000000", 73 => "01011101", 
    74 => "01011111", 75 to 76=> "00000000", 77 => "01100001", 78 to 83=> "00000000", 
    84 => "01100011", 85 => "01100101", 86 => "01100111", 87 => "00000000", 
    88 => "01101001", 89 => "01101011", 90 => "00000000", 91 => "01101101", 
    92 to 93=> "00000000", 94 => "01101111", 95 => "01110001", 96 => "01110011", 
    97 => "00000000", 98 => "01110101", 99 to 104=> "00000000", 105 => "01110111", 
    106 => "01111001", 107 to 108=> "00000000", 109 => "01111011", 110 => "01111101", 
    111 to 113=> "00000000", 114 => "01111111", 115 => "10000001", 116 => "10000011", 
    117 to 121=> "00000000", 122 => "10000101", 123 => "10000111", 124 => "10001001", 
    125 => "00000000", 126 => "10001011", 127 => "10001101", 128 to 133=> "00000000", 
    134 => "10001111", 135 to 136=> "00000000", 137 => "10010001", 138 to 139=> "00000000", 
    140 => "10010011", 141 => "10010101", 142 => "10010111", 143 to 148=> "00000000", 
    149 => "10011001", 150 => "00000000", 151 => "10011011", 152 to 154=> "00000000", 
    155 => "10011101", 156 => "00000000", 157 => "10011111", 158 => "10100001", 
    159 => "10100011", 160 to 161=> "00000000", 162 => "10100101", 163 => "10100111", 
    164 => "10101001", 165 to 166=> "00000000", 167 => "10101011", 168 => "10101101", 
    169 to 171=> "00000000", 172 => "10101111", 173 => "00000000", 174 => "10110001", 
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

entity predict_ensemble_feY is
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

architecture arch of predict_ensemble_feY is
    component predict_ensemble_feY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_feY_rom_U :  component predict_ensemble_feY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


