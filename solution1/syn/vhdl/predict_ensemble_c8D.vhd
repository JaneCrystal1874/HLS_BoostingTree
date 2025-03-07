-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c8D_rom is 
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


architecture rtl of predict_ensemble_c8D_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 to 7=> "00000000", 8 => "00001011", 
    9 => "00000000", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 => "00000000", 16 => "00010101", 
    17 => "00010111", 18 => "00000000", 19 => "00011001", 20 => "00000000", 
    21 => "00011011", 22 => "00011101", 23 => "00000000", 24 => "00011111", 
    25 => "00100001", 26 => "00100011", 27 => "00000000", 28 => "00100101", 
    29 => "00100111", 30 to 31=> "00000000", 32 => "00101001", 33 to 34=> "00000000", 
    35 => "00101011", 36 => "00101101", 37 => "00101111", 38 to 39=> "00000000", 
    40 => "00110001", 41 => "00110011", 42 => "00110101", 43 => "00110111", 
    44 => "00111001", 45 => "00000000", 46 => "00111011", 47 to 48=> "00000000", 
    49 => "00111101", 50 to 53=> "00000000", 54 => "00111111", 55 => "00000000", 
    56 => "01000001", 57 to 59=> "00000000", 60 => "01000011", 61 => "01000101", 
    62 => "01000111", 63 => "00000000", 64 => "01001001", 65 => "01001011", 
    66 to 67=> "00000000", 68 => "01001101", 69 => "01001111", 70 => "01010001", 
    71 to 73=> "00000000", 74 => "01010011", 75 => "01010101", 76 to 77=> "00000000", 
    78 => "01010111", 79 => "01011001", 80 to 81=> "00000000", 82 => "01011011", 
    83 => "00000000", 84 => "01011101", 85 => "00000000", 86 => "01011111", 
    87 to 90=> "00000000", 91 => "01100001", 92 => "01100011", 93 => "00000000", 
    94 => "01100101", 95 => "00000000", 96 => "01100111", 97 => "01101001", 
    98 => "00000000", 99 => "01101011", 100 => "00000000", 101 => "01101101", 
    102 => "01101111", 103 => "01110001", 104 to 105=> "00000000", 106 => "01110011", 
    107 to 109=> "00000000", 110 => "01110101", 111 => "01110111", 112 => "00000000", 
    113 => "01111001", 114 to 118=> "00000000", 119 => "01111011", 120 => "00000000", 
    121 => "01111101", 122 to 123=> "00000000", 124 => "01111111", 125 => "10000001", 
    126 to 127=> "00000000", 128 => "10000011", 129 => "00000000", 130 => "10000101", 
    131 to 133=> "00000000", 134 => "10000111", 135 => "10001001", 136 => "10001011", 
    137 to 138=> "00000000", 139 => "10001101", 140 to 141=> "00000000", 142 => "10001111", 
    143 => "10010001", 144 => "10010011", 145 => "10010101", 146 => "00000000", 
    147 => "10010111", 148 => "10011001", 149 => "00000000", 150 => "10011011", 
    151 => "10011101", 152 to 153=> "00000000", 154 => "10011111", 155 to 158=> "00000000", 
    159 => "10100001", 160 => "10100011", 161 => "10100101", 162 => "10100111", 
    163 => "00000000", 164 => "10101001", 165 to 168=> "00000000", 169 => "10101011", 
    170 => "10101101", 171 => "00000000", 172 => "10101111", 173 => "00000000", 
    174 => "10110001", 175 => "10110011", 176 => "00000000", 177 => "10110101", 
    178 => "00000000", 179 => "10110111", 180 => "00000000", 181 => "10111001", 
    182 => "00000000", 183 => "10111011", 184 to 187=> "00000000", 188 => "10111101", 
    189 to 194=> "00000000" );


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

entity predict_ensemble_c8D is
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

architecture arch of predict_ensemble_c8D is
    component predict_ensemble_c8D_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c8D_rom_U :  component predict_ensemble_c8D_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


