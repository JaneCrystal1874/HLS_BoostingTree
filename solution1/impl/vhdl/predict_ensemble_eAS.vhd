-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eAS_rom is 
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


architecture rtl of predict_ensemble_eAS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 => "00000000", 11 => "00001111", 
    12 => "00010001", 13 => "00000000", 14 => "00010011", 15 => "00000000", 
    16 => "00010101", 17 => "00010111", 18 => "00000000", 19 => "00011001", 
    20 to 21=> "00000000", 22 => "00011011", 23 to 24=> "00000000", 25 => "00011101", 
    26 => "00011111", 27 => "00100001", 28 => "00000000", 29 => "00100011", 
    30 => "00000000", 31 => "00100101", 32 => "00100111", 33 => "00000000", 
    34 => "00101001", 35 to 39=> "00000000", 40 => "00101011", 41 => "00000000", 
    42 => "00101101", 43 to 45=> "00000000", 46 => "00101111", 47 => "00000000", 
    48 => "00110001", 49 => "00110011", 50 => "00110101", 51 => "00110111", 
    52 to 53=> "00000000", 54 => "00111001", 55 => "00111011", 56 to 57=> "00000000", 
    58 => "00111101", 59 to 60=> "00000000", 61 => "00111111", 62 => "01000001", 
    63 => "01000011", 64 to 65=> "00000000", 66 => "01000101", 67 => "01000111", 
    68 to 70=> "00000000", 71 => "01001001", 72 => "00000000", 73 => "01001011", 
    74 => "01001101", 75 to 77=> "00000000", 78 => "01001111", 79 => "01010001", 
    80 => "01010011", 81 => "01010101", 82 => "01010111", 83 => "01011001", 
    84 => "01011011", 85 => "01011101", 86 => "00000000", 87 => "01011111", 
    88 => "00000000", 89 => "01100001", 90 => "00000000", 91 => "01100011", 
    92 to 94=> "00000000", 95 => "01100101", 96 to 98=> "00000000", 99 => "01100111", 
    100 => "00000000", 101 => "01101001", 102 to 103=> "00000000", 104 => "01101011", 
    105 to 106=> "00000000", 107 => "01101101", 108 => "01101111", 109 => "01110001", 
    110 => "00000000", 111 => "01110011", 112 to 113=> "00000000", 114 => "01110101", 
    115 => "01110111", 116 => "01111001", 117 => "00000000", 118 => "01111011", 
    119 => "01111101", 120 to 122=> "00000000", 123 => "01111111", 124 => "10000001", 
    125 to 128=> "00000000", 129 => "10000011", 130 => "00000000", 131 => "10000101", 
    132 to 133=> "00000000", 134 => "10000111", 135 => "10001001", 136 => "10001011", 
    137 => "00000000", 138 => "10001101", 139 => "10001111", 140 => "10010001", 
    141 => "00000000", 142 => "10010011", 143 to 145=> "00000000", 146 => "10010101", 
    147 => "10010111", 148 => "10011001", 149 => "10011011", 150 to 152=> "00000000", 
    153 => "10011101", 154 => "00000000", 155 => "10011111", 156 => "00000000", 
    157 => "10100001", 158 to 161=> "00000000", 162 => "10100011", 163 to 194=> "00000000" );


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

entity predict_ensemble_eAS is
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

architecture arch of predict_ensemble_eAS is
    component predict_ensemble_eAS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eAS_rom_U :  component predict_ensemble_eAS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


