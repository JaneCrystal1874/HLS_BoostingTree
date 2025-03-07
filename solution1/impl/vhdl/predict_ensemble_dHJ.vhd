-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dHJ_rom is 
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


architecture rtl of predict_ensemble_dHJ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00001001", 7 to 9=> "00000000", 
    10 => "00001011", 11 => "00001101", 12 => "00001111", 13 => "00010001", 
    14 to 16=> "00000000", 17 => "00010011", 18 => "00010101", 19 => "00010111", 
    20 => "00000000", 21 => "00011001", 22 => "00000000", 23 => "00011011", 
    24 to 25=> "00000000", 26 => "00011101", 27 => "00011111", 28 => "00000000", 
    29 => "00100001", 30 => "00100011", 31 => "00000000", 32 => "00100101", 
    33 => "00100111", 34 to 35=> "00000000", 36 => "00101001", 37 => "00101011", 
    38 to 41=> "00000000", 42 => "00101101", 43 to 44=> "00000000", 45 => "00101111", 
    46 => "00110001", 47 => "00110011", 48 => "00110101", 49 => "00110111", 
    50 => "00000000", 51 => "00111001", 52 to 53=> "00000000", 54 => "00111011", 
    55 to 56=> "00000000", 57 => "00111101", 58 => "00111111", 59 => "00000000", 
    60 => "01000001", 61 => "01000011", 62 => "00000000", 63 => "01000101", 
    64 => "00000000", 65 => "01000111", 66 to 67=> "00000000", 68 => "01001001", 
    69 => "01001011", 70 => "00000000", 71 => "01001101", 72 => "01001111", 
    73 => "00000000", 74 => "01010001", 75 => "01010011", 76 to 79=> "00000000", 
    80 => "01010101", 81 to 84=> "00000000", 85 => "01010111", 86 => "01011001", 
    87 => "01011011", 88 => "00000000", 89 => "01011101", 90 => "00000000", 
    91 => "01011111", 92 => "01100001", 93 to 94=> "00000000", 95 => "01100011", 
    96 => "01100101", 97 to 99=> "00000000", 100 => "01100111", 101 => "00000000", 
    102 => "01101001", 103 => "01101011", 104 => "00000000", 105 => "01101101", 
    106 => "01101111", 107 => "01110001", 108 to 109=> "00000000", 110 => "01110011", 
    111 to 112=> "00000000", 113 => "01110101", 114 => "00000000", 115 => "01110111", 
    116 to 117=> "00000000", 118 => "01111001", 119 => "01111011", 120 => "01111101", 
    121 => "01111111", 122 => "00000000", 123 => "10000001", 124 to 126=> "00000000", 
    127 => "10000011", 128 => "00000000", 129 => "10000101", 130 => "10000111", 
    131 => "10001001", 132 to 136=> "00000000", 137 => "10001011", 138 to 139=> "00000000", 
    140 => "10001101", 141 => "00000000", 142 => "10001111", 143 => "10010001", 
    144 => "10010011", 145 => "10010101", 146 => "10010111", 147 => "00000000", 
    148 => "10011001", 149 => "10011011", 150 => "10011101", 151 => "00000000", 
    152 => "10011111", 153 => "10100001", 154 => "00000000", 155 => "10100011", 
    156 => "10100101", 157 => "00000000", 158 => "10100111", 159 to 161=> "00000000", 
    162 => "10101001", 163 to 167=> "00000000", 168 => "10101011", 169 to 170=> "00000000", 
    171 => "10101101", 172 => "10101111", 173 to 194=> "00000000" );


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

entity predict_ensemble_dHJ is
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

architecture arch of predict_ensemble_dHJ is
    component predict_ensemble_dHJ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dHJ_rom_U :  component predict_ensemble_dHJ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


