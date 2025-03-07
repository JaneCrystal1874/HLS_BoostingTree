-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_IfE_rom is 
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


architecture rtl of predict_ensemble_IfE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00001001", 5 => "00001011", 6 => "00001101", 7 => "00000000", 
    8 => "00001111", 9 => "00000000", 10 => "00010001", 11 to 12=> "00000000", 
    13 => "00010011", 14 => "00010101", 15 => "00000000", 16 => "00010111", 
    17 => "00000000", 18 => "00011001", 19 => "00000000", 20 => "00011011", 
    21 => "00011101", 22 => "00011111", 23 => "00100001", 24 => "00100011", 
    25 => "00000000", 26 => "00100101", 27 to 28=> "00000000", 29 => "00100111", 
    30 => "00101001", 31 => "00101011", 32 => "00101101", 33 => "00000000", 
    34 => "00101111", 35 => "00110001", 36 => "00110011", 37 => "00000000", 
    38 => "00110101", 39 to 42=> "00000000", 43 => "00110111", 44 => "00111001", 
    45 => "00111011", 46 => "00000000", 47 => "00111101", 48 => "00000000", 
    49 => "00111111", 50 => "01000001", 51 => "00000000", 52 => "01000011", 
    53 to 57=> "00000000", 58 => "01000101", 59 => "01000111", 60 => "00000000", 
    61 => "01001001", 62 to 64=> "00000000", 65 => "01001011", 66 to 73=> "00000000", 
    74 => "01001101", 75 => "01001111", 76 to 79=> "00000000", 80 => "01010001", 
    81 => "00000000", 82 => "01010011", 83 => "01010101", 84 => "01010111", 
    85 => "01011001", 86 => "01011011", 87 => "00000000", 88 => "01011101", 
    89 to 90=> "00000000", 91 => "01011111", 92 => "01100001", 93 => "00000000", 
    94 => "01100011", 95 to 96=> "00000000", 97 => "01100101", 98 => "00000000", 
    99 => "01100111", 100 => "01101001", 101 => "01101011", 102 => "00000000", 
    103 => "01101101", 104 => "00000000", 105 => "01101111", 106 => "01110001", 
    107 => "00000000", 108 => "01110011", 109 => "01110101", 110 => "00000000", 
    111 => "01110111", 112 => "01111001", 113 => "00000000", 114 => "01111011", 
    115 to 116=> "00000000", 117 => "01111101", 118 => "01111111", 119 => "00000000", 
    120 => "10000001", 121 to 122=> "00000000", 123 => "10000011", 124 => "10000101", 
    125 => "00000000", 126 => "10000111", 127 => "10001001", 128 => "10001011", 
    129 => "00000000", 130 => "10001101", 131 to 132=> "00000000", 133 => "10001111", 
    134 => "10010001", 135 => "10010011", 136 to 138=> "00000000", 139 => "10010101", 
    140 => "10010111", 141 => "10011001", 142 to 147=> "00000000", 148 => "10011011", 
    149 => "10011101", 150 => "10011111", 151 => "00000000", 152 => "10100001", 
    153 => "10100011", 154 => "10100101", 155 to 156=> "00000000", 157 => "10100111", 
    158 to 160=> "00000000", 161 => "10101001", 162 => "10101011", 163 => "00000000", 
    164 => "10101101", 165 to 166=> "00000000", 167 => "10101111", 168 => "00000000", 
    169 => "10110001", 170 => "00000000", 171 => "10110011", 172 to 175=> "00000000", 
    176 => "10110101", 177 to 178=> "00000000", 179 => "10110111", 180 => "10111001", 
    181 to 182=> "00000000", 183 => "10111011", 184 => "10111101", 185 => "10111111", 
    186 to 194=> "00000000" );


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

entity predict_ensemble_IfE is
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

architecture arch of predict_ensemble_IfE is
    component predict_ensemble_IfE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_IfE_rom_U :  component predict_ensemble_IfE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


