-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cTB_rom is 
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


architecture rtl of predict_ensemble_cTB_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000000", 5 => "00000111", 6 => "00001001", 7 => "00001011", 
    8 => "00001101", 9 => "00000000", 10 => "00001111", 11 => "00010001", 
    12 => "00010011", 13 to 14=> "00000000", 15 => "00010101", 16 => "00000000", 
    17 => "00010111", 18 => "00000000", 19 => "00011001", 20 => "00000000", 
    21 => "00011011", 22 to 23=> "00000000", 24 => "00011101", 25 => "00011111", 
    26 => "00100001", 27 => "00100011", 28 => "00000000", 29 => "00100101", 
    30 to 34=> "00000000", 35 => "00100111", 36 => "00101001", 37 => "00101011", 
    38 => "00101101", 39 => "00101111", 40 => "00110001", 41 to 42=> "00000000", 
    43 => "00110011", 44 => "00110101", 45 to 46=> "00000000", 47 => "00110111", 
    48 => "00000000", 49 => "00111001", 50 => "00111011", 51 to 53=> "00000000", 
    54 => "00111101", 55 => "00111111", 56 => "00000000", 57 => "01000001", 
    58 => "01000011", 59 => "00000000", 60 => "01000101", 61 to 62=> "00000000", 
    63 => "01000111", 64 => "00000000", 65 => "01001001", 66 => "01001011", 
    67 => "00000000", 68 => "01001101", 69 => "00000000", 70 => "01001111", 
    71 => "01010001", 72 => "01010011", 73 => "01010101", 74 => "01010111", 
    75 => "00000000", 76 => "01011001", 77 to 78=> "00000000", 79 => "01011011", 
    80 => "00000000", 81 => "01011101", 82 to 84=> "00000000", 85 => "01011111", 
    86 => "01100001", 87 to 88=> "00000000", 89 => "01100011", 90 => "01100101", 
    91 to 92=> "00000000", 93 => "01100111", 94 => "01101001", 95 => "01101011", 
    96 => "01101101", 97 => "01101111", 98 => "00000000", 99 => "01110001", 
    100 => "00000000", 101 => "01110011", 102 => "00000000", 103 => "01110101", 
    104 => "01110111", 105 => "01111001", 106 => "01111011", 107 => "01111101", 
    108 => "00000000", 109 => "01111111", 110 => "10000001", 111 to 113=> "00000000", 
    114 => "10000011", 115 to 117=> "00000000", 118 => "10000101", 119 to 120=> "00000000", 
    121 => "10000111", 122 => "00000000", 123 => "10001001", 124 => "00000000", 
    125 => "10001011", 126 to 130=> "00000000", 131 => "10001101", 132 => "10001111", 
    133 => "10010001", 134 to 135=> "00000000", 136 => "10010011", 137 to 143=> "00000000", 
    144 => "10010101", 145 to 147=> "00000000", 148 => "10010111", 149 => "00000000", 
    150 => "10011001", 151 => "10011011", 152 => "10011101", 153 to 154=> "00000000", 
    155 => "10011111", 156 => "00000000", 157 => "10100001", 158 => "00000000", 
    159 => "10100011", 160 to 161=> "00000000", 162 => "10100101", 163 => "10100111", 
    164 => "10101001", 165 => "00000000", 166 => "10101011", 167 => "10101101", 
    168 => "00000000", 169 => "10101111", 170 => "00000000", 171 => "10110001", 
    172 to 173=> "00000000", 174 => "10110011", 175 to 194=> "00000000" );


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

entity predict_ensemble_cTB is
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

architecture arch of predict_ensemble_cTB is
    component predict_ensemble_cTB_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cTB_rom_U :  component predict_ensemble_cTB_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


