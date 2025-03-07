-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Xh4_rom is 
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


architecture rtl of predict_ensemble_Xh4_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00001001", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 => "00001111", 11 => "00010001", 
    12 => "00010011", 13 => "00010101", 14 to 16=> "00000000", 17 => "00010111", 
    18 => "00011001", 19 => "00011011", 20 => "00011101", 21 to 22=> "00000000", 
    23 => "00011111", 24 to 26=> "00000000", 27 => "00100001", 28 => "00100011", 
    29 to 30=> "00000000", 31 => "00100101", 32 => "00100111", 33 => "00101001", 
    34 => "00000000", 35 => "00101011", 36 => "00101101", 37 to 40=> "00000000", 
    41 => "00101111", 42 => "00110001", 43 to 46=> "00000000", 47 => "00110011", 
    48 => "00110101", 49 => "00110111", 50 => "00111001", 51 => "00111011", 
    52 => "00111101", 53 to 54=> "00000000", 55 => "00111111", 56 => "00000000", 
    57 => "01000001", 58 => "01000011", 59 => "01000101", 60 => "00000000", 
    61 => "01000111", 62 => "01001001", 63 to 67=> "00000000", 68 => "01001011", 
    69 => "00000000", 70 => "01001101", 71 to 73=> "00000000", 74 => "01001111", 
    75 => "01010001", 76 => "01010011", 77 => "00000000", 78 => "01010101", 
    79 to 83=> "00000000", 84 => "01010111", 85 => "01011001", 86 to 87=> "00000000", 
    88 => "01011011", 89 => "01011101", 90 => "00000000", 91 => "01011111", 
    92 to 94=> "00000000", 95 => "01100001", 96 => "01100011", 97 => "01100101", 
    98 => "00000000", 99 => "01100111", 100 => "00000000", 101 => "01101001", 
    102 to 104=> "00000000", 105 => "01101011", 106 => "01101101", 107 => "01101111", 
    108 => "01110001", 109 => "00000000", 110 => "01110011", 111 to 113=> "00000000", 
    114 => "01110101", 115 => "01110111", 116 => "01111001", 117 => "00000000", 
    118 => "01111011", 119 => "00000000", 120 => "01111101", 121 => "00000000", 
    122 => "01111111", 123 => "10000001", 124 => "10000011", 125 => "00000000", 
    126 => "10000101", 127 => "00000000", 128 => "10000111", 129 to 131=> "00000000", 
    132 => "10001001", 133 => "10001011", 134 to 135=> "00000000", 136 => "10001101", 
    137 => "00000000", 138 => "10001111", 139 to 140=> "00000000", 141 => "10010001", 
    142 => "10010011", 143 => "10010101", 144 => "10010111", 145 to 146=> "00000000", 
    147 => "10011001", 148 => "10011011", 149 to 152=> "00000000", 153 => "10011101", 
    154 => "10011111", 155 => "00000000", 156 => "10100001", 157 => "10100011", 
    158 to 159=> "00000000", 160 => "10100101", 161 => "10100111", 162 to 164=> "00000000", 
    165 => "10101001", 166 => "10101011", 167 => "00000000", 168 => "10101101", 
    169 => "00000000", 170 => "10101111", 171 to 172=> "00000000", 173 => "10110001", 
    174 => "00000000", 175 => "10110011", 176 => "10110101", 177 to 178=> "00000000", 
    179 => "10110111", 180 => "00000000", 181 => "10111001", 182 => "10111011", 
    183 to 187=> "00000000", 188 => "10111101", 189 => "10111111", 190 => "00000000", 
    191 => "11000001", 192 to 194=> "00000000" );


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

entity predict_ensemble_Xh4 is
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

architecture arch of predict_ensemble_Xh4 is
    component predict_ensemble_Xh4_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Xh4_rom_U :  component predict_ensemble_Xh4_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


