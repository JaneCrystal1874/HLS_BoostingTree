-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dxH_rom is 
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


architecture rtl of predict_ensemble_dxH_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 to 5=> "00000000", 6 => "00000111", 7 => "00001001", 8 => "00001011", 
    9 => "00000000", 10 => "00001101", 11 => "00001111", 12 => "00010001", 
    13 => "00000000", 14 => "00010011", 15 to 16=> "00000000", 17 => "00010101", 
    18 => "00000000", 19 => "00010111", 20 => "00011001", 21 => "00000000", 
    22 => "00011011", 23 to 25=> "00000000", 26 => "00011101", 27 => "00011111", 
    28 => "00100001", 29 => "00000000", 30 => "00100011", 31 => "00000000", 
    32 => "00100101", 33 to 34=> "00000000", 35 => "00100111", 36 => "00101001", 
    37 => "00000000", 38 => "00101011", 39 => "00101101", 40 => "00000000", 
    41 => "00101111", 42 to 43=> "00000000", 44 => "00110001", 45 to 46=> "00000000", 
    47 => "00110011", 48 to 49=> "00000000", 50 => "00110101", 51 => "00110111", 
    52 => "00000000", 53 => "00111001", 54 => "00111011", 55 => "00111101", 
    56 to 57=> "00000000", 58 => "00111111", 59 => "00000000", 60 => "01000001", 
    61 => "01000011", 62 => "01000101", 63 to 65=> "00000000", 66 => "01000111", 
    67 => "00000000", 68 => "01001001", 69 => "01001011", 70 => "00000000", 
    71 => "01001101", 72 to 73=> "00000000", 74 => "01001111", 75 => "01010001", 
    76 => "00000000", 77 => "01010011", 78 to 81=> "00000000", 82 => "01010101", 
    83 => "01010111", 84 => "01011001", 85 => "01011011", 86 => "00000000", 
    87 => "01011101", 88 to 90=> "00000000", 91 => "01011111", 92 => "00000000", 
    93 => "01100001", 94 => "01100011", 95 => "01100101", 96 => "01100111", 
    97 to 98=> "00000000", 99 => "01101001", 100 to 103=> "00000000", 104 => "01101011", 
    105 => "01101101", 106 => "01101111", 107 => "01110001", 108 => "00000000", 
    109 => "01110011", 110 to 111=> "00000000", 112 => "01110101", 113 => "01110111", 
    114 => "00000000", 115 => "01111001", 116 => "01111011", 117 to 118=> "00000000", 
    119 => "01111101", 120 to 121=> "00000000", 122 => "01111111", 123 to 124=> "00000000", 
    125 => "10000001", 126 to 128=> "00000000", 129 => "10000011", 130 => "00000000", 
    131 => "10000101", 132 => "10000111", 133 => "10001001", 134 => "00000000", 
    135 => "10001011", 136 => "00000000", 137 => "10001101", 138 => "10001111", 
    139 => "10010001", 140 => "10010011", 141 => "10010101", 142 => "10010111", 
    143 to 144=> "00000000", 145 => "10011001", 146 => "10011011", 147 to 148=> "00000000", 
    149 => "10011101", 150 => "10011111", 151 => "00000000", 152 => "10100001", 
    153 => "10100011", 154 => "10100101", 155 => "00000000", 156 => "10100111", 
    157 => "10101001", 158 => "10101011", 159 to 169=> "00000000", 170 => "10101101", 
    171 => "00000000", 172 => "10101111", 173 => "00000000", 174 => "10110001", 
    175 => "00000000", 176 => "10110011", 177 to 194=> "00000000" );


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

entity predict_ensemble_dxH is
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

architecture arch of predict_ensemble_dxH is
    component predict_ensemble_dxH_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dxH_rom_U :  component predict_ensemble_dxH_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


