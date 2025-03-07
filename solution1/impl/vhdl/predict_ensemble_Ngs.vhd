-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Ngs_rom is 
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


architecture rtl of predict_ensemble_Ngs_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00001011", 
    9 => "00000000", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 to 15=> "00000000", 16 => "00010001", 17 => "00000000", 18 => "00010011", 
    19 => "00000000", 20 => "00010101", 21 => "00000000", 22 => "00010111", 
    23 => "00011001", 24 => "00011011", 25 => "00011101", 26 to 27=> "00000000", 
    28 => "00011111", 29 to 30=> "00000000", 31 => "00100001", 32 => "00100011", 
    33 => "00100101", 34 => "00100111", 35 to 36=> "00000000", 37 => "00101001", 
    38 => "00101011", 39 => "00101101", 40 => "00101111", 41 => "00110001", 
    42 to 43=> "00000000", 44 => "00110011", 45 => "00000000", 46 => "00110101", 
    47 => "00110111", 48 to 49=> "00000000", 50 => "00111001", 51 => "00000000", 
    52 => "00111011", 53 to 55=> "00000000", 56 => "00111101", 57 => "00000000", 
    58 => "00111111", 59 => "01000001", 60 => "01000011", 61 => "01000101", 
    62 => "01000111", 63 => "00000000", 64 => "01001001", 65 => "01001011", 
    66 to 67=> "00000000", 68 => "01001101", 69 => "01001111", 70 => "01010001", 
    71 => "00000000", 72 => "01010011", 73 to 79=> "00000000", 80 => "01010101", 
    81 to 82=> "00000000", 83 => "01010111", 84 => "01011001", 85 to 86=> "00000000", 
    87 => "01011011", 88 => "01011101", 89 => "00000000", 90 => "01011111", 
    91 to 92=> "00000000", 93 => "01100001", 94 => "01100011", 95 => "01100101", 
    96 => "00000000", 97 => "01100111", 98 to 99=> "00000000", 100 => "01101001", 
    101 => "01101011", 102 to 106=> "00000000", 107 => "01101101", 108 => "01101111", 
    109 to 111=> "00000000", 112 => "01110001", 113 => "01110011", 114 => "01110101", 
    115 => "00000000", 116 => "01110111", 117 => "01111001", 118 => "01111011", 
    119 => "00000000", 120 => "01111101", 121 => "01111111", 122 to 123=> "00000000", 
    124 => "10000001", 125 to 126=> "00000000", 127 => "10000011", 128 => "10000101", 
    129 => "10000111", 130 to 131=> "00000000", 132 => "10001001", 133 => "00000000", 
    134 => "10001011", 135 => "10001101", 136 => "10001111", 137 => "00000000", 
    138 => "10010001", 139 => "10010011", 140 => "10010101", 141 => "10010111", 
    142 => "00000000", 143 => "10011001", 144 => "10011011", 145 to 146=> "00000000", 
    147 => "10011101", 148 => "00000000", 149 => "10011111", 150 => "10100001", 
    151 => "10100011", 152 => "10100101", 153 to 156=> "00000000", 157 => "10100111", 
    158 => "10101001", 159 => "00000000", 160 => "10101011", 161 => "10101101", 
    162 to 164=> "00000000", 165 => "10101111", 166 to 168=> "00000000", 169 => "10110001", 
    170 to 172=> "00000000", 173 => "10110011", 174 => "00000000", 175 => "10110101", 
    176 to 177=> "00000000", 178 => "10110111", 179 => "10111001", 180 to 182=> "00000000", 
    183 => "10111011", 184 to 185=> "00000000", 186 => "10111101", 187 to 194=> "00000000" );


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

entity predict_ensemble_Ngs is
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

architecture arch of predict_ensemble_Ngs is
    component predict_ensemble_Ngs_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Ngs_rom_U :  component predict_ensemble_Ngs_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


