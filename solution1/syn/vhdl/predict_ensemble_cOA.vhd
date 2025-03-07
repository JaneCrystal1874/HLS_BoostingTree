-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cOA_rom is 
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


architecture rtl of predict_ensemble_cOA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00001011", 
    8 => "00001101", 9 => "00000000", 10 => "00001111", 11 to 12=> "00000000", 
    13 => "00010001", 14 to 16=> "00000000", 17 => "00010011", 18 => "00010101", 
    19 => "00000000", 20 => "00010111", 21 to 23=> "00000000", 24 => "00011001", 
    25 => "00011011", 26 to 27=> "00000000", 28 => "00011101", 29 => "00000000", 
    30 => "00011111", 31 => "00100001", 32 => "00000000", 33 => "00100011", 
    34 => "00000000", 35 => "00100101", 36 => "00000000", 37 => "00100111", 
    38 => "00000000", 39 => "00101001", 40 => "00000000", 41 => "00101011", 
    42 => "00101101", 43 => "00000000", 44 => "00101111", 45 => "00110001", 
    46 => "00110011", 47 => "00000000", 48 => "00110101", 49 => "00110111", 
    50 to 51=> "00000000", 52 => "00111001", 53 => "00000000", 54 => "00111011", 
    55 => "00000000", 56 => "00111101", 57 => "00000000", 58 => "00111111", 
    59 => "00000000", 60 => "01000001", 61 => "00000000", 62 => "01000011", 
    63 to 64=> "00000000", 65 => "01000101", 66 => "00000000", 67 => "01000111", 
    68 => "01001001", 69 => "01001011", 70 => "01001101", 71 to 72=> "00000000", 
    73 => "01001111", 74 => "01010001", 75 => "01010011", 76 to 81=> "00000000", 
    82 => "01010101", 83 => "00000000", 84 => "01010111", 85 => "00000000", 
    86 => "01011001", 87 => "00000000", 88 => "01011011", 89 => "01011101", 
    90 => "00000000", 91 => "01011111", 92 => "00000000", 93 => "01100001", 
    94 to 95=> "00000000", 96 => "01100011", 97 => "01100101", 98 => "00000000", 
    99 => "01100111", 100 => "01101001", 101 => "01101011", 102 => "01101101", 
    103 => "01101111", 104 => "01110001", 105 => "00000000", 106 => "01110011", 
    107 => "00000000", 108 => "01110101", 109 => "01110111", 110 => "01111001", 
    111 => "01111011", 112 => "01111101", 113 to 119=> "00000000", 120 => "01111111", 
    121 => "00000000", 122 => "10000001", 123 => "00000000", 124 => "10000011", 
    125 to 126=> "00000000", 127 => "10000101", 128 => "00000000", 129 => "10000111", 
    130 => "10001001", 131 => "00000000", 132 => "10001011", 133 => "10001101", 
    134 to 136=> "00000000", 137 => "10001111", 138 to 139=> "00000000", 140 => "10010001", 
    141 to 142=> "00000000", 143 => "10010011", 144 => "10010101", 145 to 146=> "00000000", 
    147 => "10010111", 148 => "10011001", 149 => "00000000", 150 => "10011011", 
    151 to 154=> "00000000", 155 => "10011101", 156 => "10011111", 157 => "10100001", 
    158 => "10100011", 159 => "00000000", 160 => "10100101", 161 => "00000000", 
    162 => "10100111", 163 => "10101001", 164 to 166=> "00000000", 167 => "10101011", 
    168 => "10101101", 169 => "00000000", 170 => "10101111", 171 => "00000000", 
    172 => "10110001", 173 => "10110011", 174 to 176=> "00000000", 177 => "10110101", 
    178 to 179=> "00000000", 180 => "10110111", 181 to 182=> "00000000", 183 => "10111001", 
    184 to 194=> "00000000" );


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

entity predict_ensemble_cOA is
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

architecture arch of predict_ensemble_cOA is
    component predict_ensemble_cOA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cOA_rom_U :  component predict_ensemble_cOA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


