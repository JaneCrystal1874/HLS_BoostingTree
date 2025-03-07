-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e9X_rom is 
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


architecture rtl of predict_ensemble_e9X_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00001001", 5 => "00000000", 6 => "00001011", 7 => "00001101", 
    8 => "00000000", 9 => "00001111", 10 => "00000000", 11 => "00010001", 
    12 to 16=> "00000000", 17 => "00010011", 18 => "00010101", 19 => "00010111", 
    20 => "00000000", 21 => "00011001", 22 => "00011011", 23 to 24=> "00000000", 
    25 => "00011101", 26 => "00011111", 27 => "00100001", 28 => "00100011", 
    29 => "00000000", 30 => "00100101", 31 => "00000000", 32 => "00100111", 
    33 => "00101001", 34 => "00101011", 35 => "00000000", 36 => "00101101", 
    37 => "00101111", 38 to 41=> "00000000", 42 => "00110001", 43 to 44=> "00000000", 
    45 => "00110011", 46 to 49=> "00000000", 50 => "00110101", 51 => "00110111", 
    52 => "00111001", 53 => "00111011", 54 => "00111101", 55 to 56=> "00000000", 
    57 => "00111111", 58 => "01000001", 59 => "01000011", 60 => "01000101", 
    61 => "01000111", 62 => "00000000", 63 => "01001001", 64 to 65=> "00000000", 
    66 => "01001011", 67 => "01001101", 68 => "00000000", 69 => "01001111", 
    70 to 73=> "00000000", 74 => "01010001", 75 => "01010011", 76 => "01010101", 
    77 => "01010111", 78 => "00000000", 79 => "01011001", 80 to 84=> "00000000", 
    85 => "01011011", 86 => "01011101", 87 => "01011111", 88 => "01100001", 
    89 => "00000000", 90 => "01100011", 91 => "01100101", 92 => "01100111", 
    93 => "01101001", 94 => "01101011", 95 => "01101101", 96 to 101=> "00000000", 
    102 => "01101111", 103 to 107=> "00000000", 108 => "01110001", 109 => "00000000", 
    110 => "01110011", 111 => "01110101", 112 => "01110111", 113 to 114=> "00000000", 
    115 => "01111001", 116 => "01111011", 117 to 118=> "00000000", 119 => "01111101", 
    120 => "01111111", 121 to 123=> "00000000", 124 => "10000001", 125 => "00000000", 
    126 => "10000011", 127 => "10000101", 128 => "10000111", 129 => "10001001", 
    130 => "10001011", 131 to 133=> "00000000", 134 => "10001101", 135 => "10001111", 
    136 => "10010001", 137 => "10010011", 138 => "00000000", 139 => "10010101", 
    140 => "10010111", 141 to 143=> "00000000", 144 => "10011001", 145 => "00000000", 
    146 => "10011011", 147 => "10011101", 148 => "10011111", 149 => "10100001", 
    150 => "00000000", 151 => "10100011", 152 => "00000000", 153 => "10100101", 
    154 => "10100111", 155 => "00000000", 156 => "10101001", 157 to 159=> "00000000", 
    160 => "10101011", 161 to 163=> "00000000", 164 => "10101101", 165 => "10101111", 
    166 to 171=> "00000000", 172 => "10110001", 173 to 194=> "00000000" );


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

entity predict_ensemble_e9X is
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

architecture arch of predict_ensemble_e9X is
    component predict_ensemble_e9X_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e9X_rom_U :  component predict_ensemble_e9X_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


