-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bck_rom is 
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


architecture rtl of predict_ensemble_bck_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00001001", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 => "00000000", 11 => "00001111", 
    12 => "00010001", 13 => "00000000", 14 => "00010011", 15 => "00010101", 
    16 => "00000000", 17 => "00010111", 18 => "00011001", 19 to 22=> "00000000", 
    23 => "00011011", 24 => "00000000", 25 => "00011101", 26 to 28=> "00000000", 
    29 => "00011111", 30 => "00100001", 31 => "00000000", 32 => "00100011", 
    33 => "00100101", 34 => "00100111", 35 to 38=> "00000000", 39 => "00101001", 
    40 => "00000000", 41 => "00101011", 42 => "00101101", 43 => "00101111", 
    44 to 45=> "00000000", 46 => "00110001", 47 => "00000000", 48 => "00110011", 
    49 => "00000000", 50 => "00110101", 51 => "00000000", 52 => "00110111", 
    53 => "00111001", 54 => "00111011", 55 to 56=> "00000000", 57 => "00111101", 
    58 => "00111111", 59 to 60=> "00000000", 61 => "01000001", 62 to 63=> "00000000", 
    64 => "01000011", 65 => "01000101", 66 => "00000000", 67 => "01000111", 
    68 => "01001001", 69 => "01001011", 70 => "01001101", 71 => "00000000", 
    72 => "01001111", 73 to 74=> "00000000", 75 => "01010001", 76 => "01010011", 
    77 => "00000000", 78 => "01010101", 79 => "01010111", 80 => "00000000", 
    81 => "01011001", 82 to 83=> "00000000", 84 => "01011011", 85 => "01011101", 
    86 => "00000000", 87 => "01011111", 88 => "00000000", 89 => "01100001", 
    90 => "01100011", 91 => "00000000", 92 => "01100101", 93 => "00000000", 
    94 => "01100111", 95 => "01101001", 96 to 98=> "00000000", 99 => "01101011", 
    100 => "01101101", 101 => "00000000", 102 => "01101111", 103 => "01110001", 
    104 => "01110011", 105 to 106=> "00000000", 107 => "01110101", 108 => "00000000", 
    109 => "01110111", 110 to 111=> "00000000", 112 => "01111001", 113 to 114=> "00000000", 
    115 => "01111011", 116 => "01111101", 117 => "01111111", 118 to 120=> "00000000", 
    121 => "10000001", 122 => "10000011", 123 to 124=> "00000000", 125 => "10000101", 
    126 => "00000000", 127 => "10000111", 128 => "00000000", 129 => "10001001", 
    130 => "10001011", 131 => "00000000", 132 => "10001101", 133 => "10001111", 
    134 => "10010001", 135 to 140=> "00000000", 141 => "10010011", 142 => "10010101", 
    143 => "00000000", 144 => "10010111", 145 => "10011001", 146 => "10011011", 
    147 => "10011101", 148 => "10011111", 149 to 151=> "00000000", 152 => "10100001", 
    153 to 156=> "00000000", 157 => "10100011", 158 => "10100101", 159 => "10100111", 
    160 to 162=> "00000000", 163 => "10101001", 164 => "10101011", 165 => "00000000", 
    166 => "10101101", 167 => "00000000", 168 => "10101111", 169 to 170=> "00000000", 
    171 => "10110001", 172 => "00000000", 173 => "10110011", 174 => "10110101", 
    175 => "00000000", 176 => "10110111", 177 to 181=> "00000000", 182 => "10111001", 
    183 to 185=> "00000000", 186 => "10111011", 187 to 194=> "00000000" );


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

entity predict_ensemble_bck is
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

architecture arch of predict_ensemble_bck is
    component predict_ensemble_bck_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bck_rom_U :  component predict_ensemble_bck_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


