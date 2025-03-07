-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bGp_rom is 
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


architecture rtl of predict_ensemble_bGp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 to 7=> "00000000", 8 => "00001001", 
    9 => "00000000", 10 => "00001011", 11 => "00001101", 12 => "00001111", 
    13 => "00010001", 14 to 15=> "00000000", 16 => "00010011", 17 => "00000000", 
    18 => "00010101", 19 => "00000000", 20 => "00010111", 21 to 22=> "00000000", 
    23 => "00011001", 24 => "00011011", 25 to 26=> "00000000", 27 => "00011101", 
    28 to 29=> "00000000", 30 => "00011111", 31 => "00000000", 32 => "00100001", 
    33 => "00000000", 34 => "00100011", 35 => "00000000", 36 => "00100101", 
    37 => "00000000", 38 => "00100111", 39 => "00000000", 40 => "00101001", 
    41 => "00101011", 42 => "00101101", 43 => "00101111", 44 => "00000000", 
    45 => "00110001", 46 to 48=> "00000000", 49 => "00110011", 50 => "00110101", 
    51 => "00110111", 52 => "00111001", 53 => "00111011", 54 => "00000000", 
    55 => "00111101", 56 to 58=> "00000000", 59 => "00111111", 60 => "01000001", 
    61 => "01000011", 62 => "01000101", 63 => "01000111", 64 => "00000000", 
    65 => "01001001", 66 => "00000000", 67 => "01001011", 68 => "00000000", 
    69 => "01001101", 70 => "00000000", 71 => "01001111", 72 to 75=> "00000000", 
    76 => "01010001", 77 => "01010011", 78 => "01010101", 79 => "01010111", 
    80 to 81=> "00000000", 82 => "01011001", 83 => "01011011", 84 => "01011101", 
    85 => "00000000", 86 => "01011111", 87 to 89=> "00000000", 90 => "01100001", 
    91 => "01100011", 92 => "00000000", 93 => "01100101", 94 => "01100111", 
    95 => "01101001", 96 => "01101011", 97 => "01101101", 98 => "00000000", 
    99 => "01101111", 100 => "01110001", 101 => "00000000", 102 => "01110011", 
    103 => "01110101", 104 => "01110111", 105 to 109=> "00000000", 110 => "01111001", 
    111 to 113=> "00000000", 114 => "01111011", 115 to 116=> "00000000", 117 => "01111101", 
    118 => "00000000", 119 => "01111111", 120 => "10000001", 121 to 122=> "00000000", 
    123 => "10000011", 124 => "10000101", 125 => "10000111", 126 to 128=> "00000000", 
    129 => "10001001", 130 => "00000000", 131 => "10001011", 132 => "10001101", 
    133 => "10001111", 134 => "10010001", 135 => "10010011", 136 => "10010101", 
    137 => "00000000", 138 => "10010111", 139 => "10011001", 140 => "10011011", 
    141 to 144=> "00000000", 145 => "10011101", 146 => "10011111", 147 => "10100001", 
    148 => "00000000", 149 => "10100011", 150 to 153=> "00000000", 154 => "10100101", 
    155 => "00000000", 156 => "10100111", 157 to 158=> "00000000", 159 => "10101001", 
    160 => "00000000", 161 => "10101011", 162 to 170=> "00000000", 171 => "10101101", 
    172 to 173=> "00000000", 174 => "10101111", 175 => "00000000", 176 => "10110001", 
    177 => "00000000", 178 => "10110011", 179 => "00000000", 180 => "10110101", 
    181 => "00000000", 182 => "10110111", 183 => "00000000", 184 => "10111001", 
    185 to 194=> "00000000" );


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

entity predict_ensemble_bGp is
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

architecture arch of predict_ensemble_bGp is
    component predict_ensemble_bGp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bGp_rom_U :  component predict_ensemble_bGp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


