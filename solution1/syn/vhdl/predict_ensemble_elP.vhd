-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_elP_rom is 
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


architecture rtl of predict_ensemble_elP_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00001011", 
    8 => "00001101", 9 => "00001111", 10 => "00000000", 11 => "00010001", 
    12 to 13=> "00000000", 14 => "00010011", 15 to 16=> "00000000", 17 => "00010101", 
    18 to 21=> "00000000", 22 => "00010111", 23 => "00000000", 24 => "00011001", 
    25 => "00011011", 26 => "00000000", 27 => "00011101", 28 => "00011111", 
    29 => "00100001", 30 => "00100011", 31 => "00100101", 32 to 33=> "00000000", 
    34 => "00100111", 35 => "00101001", 36 => "00101011", 37 to 42=> "00000000", 
    43 => "00101101", 44 => "00101111", 45 => "00110001", 46 to 47=> "00000000", 
    48 => "00110011", 49 => "00110101", 50 => "00110111", 51 to 53=> "00000000", 
    54 => "00111001", 55 => "00000000", 56 => "00111011", 57 => "00000000", 
    58 => "00111101", 59 => "00111111", 60 => "00000000", 61 => "01000001", 
    62 => "01000011", 63 => "01000101", 64 => "01000111", 65 => "01001001", 
    66 to 68=> "00000000", 69 => "01001011", 70 => "01001101", 71 to 72=> "00000000", 
    73 => "01001111", 74 to 75=> "00000000", 76 => "01010001", 77 to 79=> "00000000", 
    80 => "01010011", 81 => "01010101", 82 to 83=> "00000000", 84 => "01010111", 
    85 => "00000000", 86 => "01011001", 87 => "00000000", 88 => "01011011", 
    89 => "00000000", 90 => "01011101", 91 => "00000000", 92 => "01011111", 
    93 to 94=> "00000000", 95 => "01100001", 96 => "00000000", 97 => "01100011", 
    98 => "00000000", 99 => "01100101", 100 to 101=> "00000000", 102 => "01100111", 
    103 => "01101001", 104 => "01101011", 105 to 107=> "00000000", 108 => "01101101", 
    109 => "00000000", 110 => "01101111", 111 => "01110001", 112 => "00000000", 
    113 => "01110011", 114 => "00000000", 115 => "01110101", 116 => "01110111", 
    117 => "01111001", 118 => "01111011", 119 => "01111101", 120 => "00000000", 
    121 => "01111111", 122 => "10000001", 123 => "00000000", 124 => "10000011", 
    125 => "10000101", 126 => "00000000", 127 => "10000111", 128 => "00000000", 
    129 => "10001001", 130 to 132=> "00000000", 133 => "10001011", 134 to 137=> "00000000", 
    138 => "10001101", 139 => "10001111", 140 => "10010001", 141 to 142=> "00000000", 
    143 => "10010011", 144 => "10010101", 145 => "00000000", 146 => "10010111", 
    147 to 148=> "00000000", 149 => "10011001", 150 => "10011011", 151 => "10011101", 
    152 to 155=> "00000000", 156 => "10011111", 157 => "00000000", 158 => "10100001", 
    159 => "10100011", 160 to 162=> "00000000", 163 => "10100101", 164 => "00000000", 
    165 => "10100111", 166 => "00000000", 167 => "10101001", 168 => "10101011", 
    169 => "10101101", 170 to 194=> "00000000" );


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

entity predict_ensemble_elP is
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

architecture arch of predict_ensemble_elP is
    component predict_ensemble_elP_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_elP_rom_U :  component predict_ensemble_elP_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


