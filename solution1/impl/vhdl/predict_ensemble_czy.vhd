-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_czy_rom is 
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


architecture rtl of predict_ensemble_czy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000000", 6 => "00000111", 7 => "00001001", 
    8 => "00000000", 9 => "00001011", 10 => "00001101", 11 to 13=> "00000000", 
    14 => "00001111", 15 => "00000000", 16 => "00010001", 17 => "00010011", 
    18 => "00000000", 19 => "00010101", 20 => "00000000", 21 => "00010111", 
    22 => "00000000", 23 => "00011001", 24 => "00011011", 25 => "00011101", 
    26 => "00011111", 27 to 28=> "00000000", 29 => "00100001", 30 to 31=> "00000000", 
    32 => "00100011", 33 => "00100101", 34 => "00000000", 35 => "00100111", 
    36 => "00101001", 37 to 41=> "00000000", 42 => "00101011", 43 => "00101101", 
    44 to 45=> "00000000", 46 => "00101111", 47 => "00110001", 48 => "00000000", 
    49 => "00110011", 50 => "00110101", 51 => "00110111", 52 to 53=> "00000000", 
    54 => "00111001", 55 => "00111011", 56 => "00111101", 57 => "00111111", 
    58 => "01000001", 59 => "01000011", 60 => "01000101", 61 to 63=> "00000000", 
    64 => "01000111", 65 => "00000000", 66 => "01001001", 67 to 71=> "00000000", 
    72 => "01001011", 73 => "01001101", 74 => "00000000", 75 => "01001111", 
    76 => "00000000", 77 => "01010001", 78 to 80=> "00000000", 81 => "01010011", 
    82 => "00000000", 83 => "01010101", 84 => "01010111", 85 => "00000000", 
    86 => "01011001", 87 => "01011011", 88 => "01011101", 89 to 90=> "00000000", 
    91 => "01011111", 92 to 94=> "00000000", 95 => "01100001", 96 to 97=> "00000000", 
    98 => "01100011", 99 => "01100101", 100 => "01100111", 101 => "01101001", 
    102 to 103=> "00000000", 104 => "01101011", 105 => "00000000", 106 => "01101101", 
    107 => "01101111", 108 => "01110001", 109 to 112=> "00000000", 113 => "01110011", 
    114 to 115=> "00000000", 116 => "01110101", 117 => "01110111", 118 => "00000000", 
    119 => "01111001", 120 => "01111011", 121 => "01111101", 122 to 123=> "00000000", 
    124 => "01111111", 125 to 126=> "00000000", 127 => "10000001", 128 => "10000011", 
    129 => "00000000", 130 => "10000101", 131 => "10000111", 132 => "10001001", 
    133 to 136=> "00000000", 137 => "10001011", 138 => "10001101", 139 => "10001111", 
    140 => "10010001", 141 => "00000000", 142 => "10010011", 143 to 146=> "00000000", 
    147 => "10010101", 148 => "10010111", 149 => "10011001", 150 => "10011011", 
    151 => "00000000", 152 => "10011101", 153 to 155=> "00000000", 156 => "10011111", 
    157 => "10100001", 158 to 159=> "00000000", 160 => "10100011", 161 => "10100101", 
    162 => "10100111", 163 => "10101001", 164 => "10101011", 165 => "10101101", 
    166 => "10101111", 167 => "10110001", 168 to 169=> "00000000", 170 => "10110011", 
    171 to 173=> "00000000", 174 => "10110101", 175 => "00000000", 176 => "10110111", 
    177 to 179=> "00000000", 180 => "10111001", 181 to 184=> "00000000", 185 => "10111011", 
    186 => "10111101", 187 to 194=> "00000000" );


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

entity predict_ensemble_czy is
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

architecture arch of predict_ensemble_czy is
    component predict_ensemble_czy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_czy_rom_U :  component predict_ensemble_czy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


