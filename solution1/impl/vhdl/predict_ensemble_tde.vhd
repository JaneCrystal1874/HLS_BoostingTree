-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_tde_rom is 
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


architecture rtl of predict_ensemble_tde_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00001011", 7 => "00001101", 
    8 to 10=> "00000000", 11 => "00001111", 12 => "00010001", 13 => "00010011", 
    14 => "00000000", 15 => "00010101", 16 => "00010111", 17 to 22=> "00000000", 
    23 => "00011001", 24 => "00011011", 25 => "00011101", 26 => "00011111", 
    27 => "00100001", 28 => "00100011", 29 to 33=> "00000000", 34 => "00100101", 
    35 to 37=> "00000000", 38 => "00100111", 39 => "00101001", 40 => "00101011", 
    41 to 42=> "00000000", 43 => "00101101", 44 => "00101111", 45 => "00110001", 
    46 => "00110011", 47 => "00110101", 48 to 51=> "00000000", 52 => "00110111", 
    53 => "00111001", 54 => "00111011", 55 => "00111101", 56 => "00111111", 
    57 => "01000001", 58 => "01000011", 59 => "01000101", 60 => "01000111", 
    61 => "01001001", 62 => "01001011", 63 to 66=> "00000000", 67 => "01001101", 
    68 => "01001111", 69 => "01010001", 70 => "00000000", 71 => "01010011", 
    72 to 76=> "00000000", 77 => "01010101", 78 => "01010111", 79 => "01011001", 
    80 => "01011011", 81 => "00000000", 82 => "01011101", 83 => "01011111", 
    84 => "01100001", 85 to 86=> "00000000", 87 => "01100011", 88 => "01100101", 
    89 => "01100111", 90 to 94=> "00000000", 95 => "01101001", 96 => "01101011", 
    97 => "01101101", 98 => "01101111", 99 => "00000000", 100 => "01110001", 
    101 to 103=> "00000000", 104 => "01110011", 105 => "00000000", 106 => "01110101", 
    107 to 108=> "00000000", 109 => "01110111", 110 => "01111001", 111 => "01111011", 
    112 => "01111101", 113 => "01111111", 114 to 116=> "00000000", 117 => "10000001", 
    118 => "10000011", 119 => "10000101", 120 => "10000111", 121 => "10001001", 
    122 to 124=> "00000000", 125 => "10001011", 126 => "10001101", 127 to 133=> "00000000", 
    134 => "10001111", 135 to 138=> "00000000", 139 => "10010001", 140 => "00000000", 
    141 => "10010011", 142 => "10010101", 143 to 144=> "00000000", 145 => "10010111", 
    146 to 147=> "00000000", 148 => "10011001", 149 => "10011011", 150 => "10011101", 
    151 => "00000000", 152 => "10011111", 153 => "00000000", 154 => "10100001", 
    155 => "00000000", 156 => "10100011", 157 => "10100101", 158 => "10100111", 
    159 => "10101001", 160 => "10101011", 161 to 163=> "00000000", 164 => "10101101", 
    165 to 166=> "00000000", 167 => "10101111", 168 => "10110001", 169 => "10110011", 
    170 to 173=> "00000000", 174 => "10110101", 175 to 176=> "00000000", 177 => "10110111", 
    178 to 182=> "00000000", 183 => "10111001", 184 to 194=> "00000000" );


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

entity predict_ensemble_tde is
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

architecture arch of predict_ensemble_tde is
    component predict_ensemble_tde_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_tde_rom_U :  component predict_ensemble_tde_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


