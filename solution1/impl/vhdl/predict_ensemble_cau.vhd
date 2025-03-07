-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cau_rom is 
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


architecture rtl of predict_ensemble_cau_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000000", 6 => "00000111", 7 => "00001001", 
    8 => "00000000", 9 => "00001011", 10 => "00001101", 11 to 12=> "00000000", 
    13 => "00001111", 14 to 15=> "00000000", 16 => "00010001", 17 => "00010011", 
    18 => "00010101", 19 to 21=> "00000000", 22 => "00010111", 23 => "00011001", 
    24 => "00000000", 25 => "00011011", 26 => "00000000", 27 => "00011101", 
    28 => "00011111", 29 => "00000000", 30 => "00100001", 31 => "00000000", 
    32 => "00100011", 33 => "00100101", 34 to 35=> "00000000", 36 => "00100111", 
    37 => "00000000", 38 => "00101001", 39 => "00101011", 40 to 41=> "00000000", 
    42 => "00101101", 43 => "00000000", 44 => "00101111", 45 => "00110001", 
    46 => "00000000", 47 => "00110011", 48 => "00110101", 49 => "00110111", 
    50 => "00000000", 51 => "00111001", 52 => "00000000", 53 => "00111011", 
    54 => "00000000", 55 => "00111101", 56 => "00111111", 57 => "00000000", 
    58 => "01000001", 59 => "00000000", 60 => "01000011", 61 => "00000000", 
    62 => "01000101", 63 to 65=> "00000000", 66 => "01000111", 67 => "01001001", 
    68 to 73=> "00000000", 74 => "01001011", 75 => "01001101", 76 => "00000000", 
    77 => "01001111", 78 => "01010001", 79 => "01010011", 80 => "01010101", 
    81 to 83=> "00000000", 84 => "01010111", 85 => "01011001", 86 => "01011011", 
    87 => "00000000", 88 => "01011101", 89 => "01011111", 90 => "00000000", 
    91 => "01100001", 92 => "01100011", 93 => "00000000", 94 => "01100101", 
    95 => "01100111", 96 to 98=> "00000000", 99 => "01101001", 100 => "01101011", 
    101 => "01101101", 102 to 105=> "00000000", 106 => "01101111", 107 => "00000000", 
    108 => "01110001", 109 => "00000000", 110 => "01110011", 111 to 112=> "00000000", 
    113 => "01110101", 114 => "00000000", 115 => "01110111", 116 => "00000000", 
    117 => "01111001", 118 => "01111011", 119 => "00000000", 120 => "01111101", 
    121 => "00000000", 122 => "01111111", 123 => "00000000", 124 => "10000001", 
    125 to 126=> "00000000", 127 => "10000011", 128 => "10000101", 129 => "10000111", 
    130 to 131=> "00000000", 132 => "10001001", 133 => "10001011", 134 => "10001101", 
    135 to 136=> "00000000", 137 => "10001111", 138 => "10010001", 139 to 141=> "00000000", 
    142 => "10010011", 143 => "10010101", 144 to 146=> "00000000", 147 => "10010111", 
    148 => "10011001", 149 to 150=> "00000000", 151 => "10011011", 152 to 154=> "00000000", 
    155 => "10011101", 156 => "00000000", 157 => "10011111", 158 => "10100001", 
    159 => "00000000", 160 => "10100011", 161 => "00000000", 162 => "10100101", 
    163 => "10100111", 164 to 165=> "00000000", 166 => "10101001", 167 => "10101011", 
    168 => "10101101", 169 to 173=> "00000000", 174 => "10101111", 175 => "00000000", 
    176 => "10110001", 177 => "10110011", 178 to 179=> "00000000", 180 => "10110101", 
    181 => "10110111", 182 => "10111001", 183 to 194=> "00000000" );


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

entity predict_ensemble_cau is
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

architecture arch of predict_ensemble_cau is
    component predict_ensemble_cau_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cau_rom_U :  component predict_ensemble_cau_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


