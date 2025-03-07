-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e4X_rom is 
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


architecture rtl of predict_ensemble_e4X_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 => "00001111", 11 => "00000000", 
    12 => "00010001", 13 => "00010011", 14 => "00000000", 15 => "00010101", 
    16 => "00010111", 17 => "00011001", 18 to 19=> "00000000", 20 => "00011011", 
    21 => "00011101", 22 to 23=> "00000000", 24 => "00011111", 25 => "00100001", 
    26 to 27=> "00000000", 28 => "00100011", 29 to 30=> "00000000", 31 => "00100101", 
    32 to 34=> "00000000", 35 => "00100111", 36 => "00000000", 37 => "00101001", 
    38 => "00000000", 39 => "00101011", 40 => "00000000", 41 => "00101101", 
    42 to 43=> "00000000", 44 => "00101111", 45 => "00000000", 46 => "00110001", 
    47 => "00110011", 48 => "00110101", 49 => "00000000", 50 => "00110111", 
    51 to 55=> "00000000", 56 => "00111001", 57 => "00000000", 58 => "00111011", 
    59 => "00111101", 60 => "00000000", 61 => "00111111", 62 => "01000001", 
    63 => "01000011", 64 to 65=> "00000000", 66 => "01000101", 67 => "01000111", 
    68 => "01001001", 69 => "01001011", 70 => "01001101", 71 => "01001111", 
    72 => "01010001", 73 to 76=> "00000000", 77 => "01010011", 78 => "01010101", 
    79 => "00000000", 80 => "01010111", 81 => "01011001", 82 => "01011011", 
    83 to 84=> "00000000", 85 => "01011101", 86 to 88=> "00000000", 89 => "01011111", 
    90 to 92=> "00000000", 93 => "01100001", 94 to 95=> "00000000", 96 => "01100011", 
    97 => "01100101", 98 => "01100111", 99 => "01101001", 100 => "00000000", 
    101 => "01101011", 102 => "00000000", 103 => "01101101", 104 => "00000000", 
    105 => "01101111", 106 => "01110001", 107 => "01110011", 108 to 112=> "00000000", 
    113 => "01110101", 114 => "00000000", 115 => "01110111", 116 to 118=> "00000000", 
    119 => "01111001", 120 => "01111011", 121 => "01111101", 122 => "00000000", 
    123 => "01111111", 124 to 125=> "00000000", 126 => "10000001", 127 => "10000011", 
    128 => "00000000", 129 => "10000101", 130 => "10000111", 131 => "10001001", 
    132 => "10001011", 133 => "00000000", 134 => "10001101", 135 => "00000000", 
    136 => "10001111", 137 => "00000000", 138 => "10010001", 139 => "00000000", 
    140 => "10010011", 141 to 145=> "00000000", 146 => "10010101", 147 => "10010111", 
    148 => "00000000", 149 => "10011001", 150 => "00000000", 151 => "10011011", 
    152 => "00000000", 153 => "10011101", 154 => "00000000", 155 => "10011111", 
    156 => "10100001", 157 => "10100011", 158 to 162=> "00000000", 163 => "10100101", 
    164 => "10100111", 165 => "10101001", 166 to 168=> "00000000", 169 => "10101011", 
    170 => "00000000", 171 => "10101101", 172 => "10101111", 173 to 194=> "00000000" );


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

entity predict_ensemble_e4X is
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

architecture arch of predict_ensemble_e4X is
    component predict_ensemble_e4X_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e4X_rom_U :  component predict_ensemble_e4X_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


