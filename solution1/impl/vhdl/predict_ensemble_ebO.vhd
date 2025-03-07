-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ebO_rom is 
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


architecture rtl of predict_ensemble_ebO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00001011", 
    9 to 11=> "00000000", 12 => "00001101", 13 => "00001111", 14 => "00000000", 
    15 => "00010001", 16 to 17=> "00000000", 18 => "00010011", 19 => "00000000", 
    20 => "00010101", 21 => "00000000", 22 => "00010111", 23 => "00000000", 
    24 => "00011001", 25 => "00011011", 26 => "00011101", 27 => "00011111", 
    28 to 29=> "00000000", 30 => "00100001", 31 => "00000000", 32 => "00100011", 
    33 => "00000000", 34 => "00100101", 35 => "00100111", 36 => "00000000", 
    37 => "00101001", 38 => "00101011", 39 => "00000000", 40 => "00101101", 
    41 => "00101111", 42 to 43=> "00000000", 44 => "00110001", 45 => "00000000", 
    46 => "00110011", 47 to 48=> "00000000", 49 => "00110101", 50 => "00110111", 
    51 => "00000000", 52 => "00111001", 53 => "00111011", 54 => "00111101", 
    55 => "00000000", 56 => "00111111", 57 => "00000000", 58 => "01000001", 
    59 => "00000000", 60 => "01000011", 61 => "00000000", 62 => "01000101", 
    63 => "01000111", 64 to 65=> "00000000", 66 => "01001001", 67 to 69=> "00000000", 
    70 => "01001011", 71 => "01001101", 72 => "00000000", 73 => "01001111", 
    74 => "01010001", 75 => "01010011", 76 to 77=> "00000000", 78 => "01010101", 
    79 => "00000000", 80 => "01010111", 81 => "00000000", 82 => "01011001", 
    83 => "00000000", 84 => "01011011", 85 to 87=> "00000000", 88 => "01011101", 
    89 to 90=> "00000000", 91 => "01011111", 92 => "01100001", 93 => "00000000", 
    94 => "01100011", 95 to 99=> "00000000", 100 => "01100101", 101 => "00000000", 
    102 => "01100111", 103 => "01101001", 104 => "00000000", 105 => "01101011", 
    106 to 107=> "00000000", 108 => "01101101", 109 => "00000000", 110 => "01101111", 
    111 => "00000000", 112 => "01110001", 113 => "01110011", 114 => "01110101", 
    115 to 117=> "00000000", 118 => "01110111", 119 => "01111001", 120 => "00000000", 
    121 => "01111011", 122 => "00000000", 123 => "01111101", 124 => "00000000", 
    125 => "01111111", 126 => "00000000", 127 => "10000001", 128 => "10000011", 
    129 => "10000101", 130 to 132=> "00000000", 133 => "10000111", 134 => "10001001", 
    135 => "10001011", 136 => "00000000", 137 => "10001101", 138 to 140=> "00000000", 
    141 => "10001111", 142 => "10010001", 143 => "00000000", 144 => "10010011", 
    145 => "00000000", 146 => "10010101", 147 => "00000000", 148 => "10010111", 
    149 => "10011001", 150 => "10011011", 151 => "10011101", 152 => "10011111", 
    153 => "10100001", 154 => "00000000", 155 => "10100011", 156 to 158=> "00000000", 
    159 => "10100101", 160 => "10100111", 161 => "10101001", 162 to 164=> "00000000", 
    165 => "10101011", 166 to 169=> "00000000", 170 => "10101101", 171 => "10101111", 
    172 to 194=> "00000000" );


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

entity predict_ensemble_ebO is
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

architecture arch of predict_ensemble_ebO is
    component predict_ensemble_ebO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ebO_rom_U :  component predict_ensemble_ebO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


