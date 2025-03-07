-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_jbC_rom is 
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


architecture rtl of predict_ensemble_jbC_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00001001", 5 => "00001011", 6 => "00001101", 7 => "00001111", 
    8 => "00010001", 9 to 10=> "00000000", 11 => "00010011", 12 to 13=> "00000000", 
    14 => "00010101", 15 => "00010111", 16 => "00011001", 17 => "00011011", 
    18 => "00000000", 19 => "00011101", 20 to 21=> "00000000", 22 => "00011111", 
    23 => "00000000", 24 => "00100001", 25 => "00000000", 26 => "00100011", 
    27 => "00100101", 28 => "00100111", 29 => "00101001", 30 => "00101011", 
    31 => "00000000", 32 => "00101101", 33 => "00000000", 34 => "00101111", 
    35 => "00000000", 36 => "00110001", 37 => "00000000", 38 => "00110011", 
    39 => "00110101", 40 => "00000000", 41 => "00110111", 42 to 44=> "00000000", 
    45 => "00111001", 46 => "00111011", 47 => "00111101", 48 => "00000000", 
    49 => "00111111", 50 to 51=> "00000000", 52 => "01000001", 53 => "01000011", 
    54 to 55=> "00000000", 56 => "01000101", 57 => "00000000", 58 => "01000111", 
    59 => "00000000", 60 => "01001001", 61 => "01001011", 62 => "01001101", 
    63 => "00000000", 64 => "01001111", 65 to 70=> "00000000", 71 => "01010001", 
    72 to 73=> "00000000", 74 => "01010011", 75 to 77=> "00000000", 78 => "01010101", 
    79 to 82=> "00000000", 83 => "01010111", 84 => "01011001", 85 => "01011011", 
    86 => "01011101", 87 => "00000000", 88 => "01011111", 89 => "01100001", 
    90 => "01100011", 91 => "01100101", 92 => "00000000", 93 => "01100111", 
    94 => "01101001", 95 => "00000000", 96 => "01101011", 97 to 98=> "00000000", 
    99 => "01101101", 100 => "01101111", 101 to 102=> "00000000", 103 => "01110001", 
    104 => "00000000", 105 => "01110011", 106 to 108=> "00000000", 109 => "01110101", 
    110 => "01110111", 111 => "01111001", 112 => "01111011", 113 => "01111101", 
    114 to 115=> "00000000", 116 => "01111111", 117 => "00000000", 118 => "10000001", 
    119 => "00000000", 120 => "10000011", 121 => "10000101", 122 => "10000111", 
    123 => "00000000", 124 => "10001001", 125 to 132=> "00000000", 133 => "10001011", 
    134 => "00000000", 135 => "10001101", 136 => "10001111", 137 => "10010001", 
    138 => "10010011", 139 to 140=> "00000000", 141 => "10010101", 142 => "10010111", 
    143 => "00000000", 144 => "10011001", 145 => "00000000", 146 => "10011011", 
    147 => "10011101", 148 => "10011111", 149 to 154=> "00000000", 155 => "10100001", 
    156 => "10100011", 157 => "10100101", 158 to 162=> "00000000", 163 => "10100111", 
    164 => "10101001", 165 to 168=> "00000000", 169 => "10101011", 170 => "10101101", 
    171 to 172=> "00000000", 173 => "10101111", 174 to 175=> "00000000", 176 => "10110001", 
    177 to 194=> "00000000" );


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

entity predict_ensemble_jbC is
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

architecture arch of predict_ensemble_jbC is
    component predict_ensemble_jbC_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_jbC_rom_U :  component predict_ensemble_jbC_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


