-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_brm_rom is 
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


architecture rtl of predict_ensemble_brm_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 7=> "00000000", 8 => "00001001", 9 => "00001011", 
    10 => "00000000", 11 => "00001101", 12 => "00001111", 13 => "00010001", 
    14 => "00010011", 15 to 16=> "00000000", 17 => "00010101", 18 => "00010111", 
    19 => "00000000", 20 => "00011001", 21 => "00000000", 22 => "00011011", 
    23 => "00011101", 24 => "00011111", 25 => "00100001", 26 to 27=> "00000000", 
    28 => "00100011", 29 => "00100101", 30 => "00100111", 31 => "00101001", 
    32 => "00101011", 33 => "00101101", 34 => "00000000", 35 => "00101111", 
    36 => "00000000", 37 => "00110001", 38 to 39=> "00000000", 40 => "00110011", 
    41 to 43=> "00000000", 44 => "00110101", 45 to 46=> "00000000", 47 => "00110111", 
    48 => "00000000", 49 => "00111001", 50 => "00111011", 51 => "00111101", 
    52 => "00000000", 53 => "00111111", 54 to 56=> "00000000", 57 => "01000001", 
    58 => "00000000", 59 => "01000011", 60 to 62=> "00000000", 63 => "01000101", 
    64 => "01000111", 65 => "00000000", 66 => "01001001", 67 => "00000000", 
    68 => "01001011", 69 => "01001101", 70 => "01001111", 71 => "01010001", 
    72 to 73=> "00000000", 74 => "01010011", 75 => "00000000", 76 => "01010101", 
    77 => "00000000", 78 => "01010111", 79 => "01011001", 80 => "01011011", 
    81 => "01011101", 82 to 83=> "00000000", 84 => "01011111", 85 => "01100001", 
    86 to 88=> "00000000", 89 => "01100011", 90 to 91=> "00000000", 92 => "01100101", 
    93 => "01100111", 94 => "00000000", 95 => "01101001", 96 => "00000000", 
    97 => "01101011", 98 => "01101101", 99 => "00000000", 100 => "01101111", 
    101 => "00000000", 102 => "01110001", 103 => "01110011", 104 => "01110101", 
    105 => "00000000", 106 => "01110111", 107 => "01111001", 108 to 111=> "00000000", 
    112 => "01111011", 113 => "01111101", 114 => "00000000", 115 => "01111111", 
    116 => "10000001", 117 to 120=> "00000000", 121 => "10000011", 122 => "10000101", 
    123 to 124=> "00000000", 125 => "10000111", 126 to 128=> "00000000", 129 => "10001001", 
    130 to 131=> "00000000", 132 => "10001011", 133 => "00000000", 134 => "10001101", 
    135 => "10001111", 136 => "10010001", 137 => "10010011", 138 => "10010101", 
    139 to 140=> "00000000", 141 => "10010111", 142 => "10011001", 143 to 145=> "00000000", 
    146 => "10011011", 147 => "10011101", 148 => "00000000", 149 => "10011111", 
    150 => "10100001", 151 => "00000000", 152 => "10100011", 153 => "10100101", 
    154 => "10100111", 155 => "10101001", 156 => "10101011", 157 to 159=> "00000000", 
    160 => "10101101", 161 to 167=> "00000000", 168 => "10101111", 169 to 170=> "00000000", 
    171 => "10110001", 172 to 194=> "00000000" );


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

entity predict_ensemble_brm is
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

architecture arch of predict_ensemble_brm is
    component predict_ensemble_brm_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_brm_rom_U :  component predict_ensemble_brm_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


