-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cEy_rom is 
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


architecture rtl of predict_ensemble_cEy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00000000", 
    8 => "00001011", 9 => "00000000", 10 => "00001101", 11 => "00001111", 
    12 => "00010001", 13 => "00000000", 14 => "00010011", 15 => "00010101", 
    16 to 19=> "00000000", 20 => "00010111", 21 => "00011001", 22 => "00011011", 
    23 to 24=> "00000000", 25 => "00011101", 26 to 27=> "00000000", 28 => "00011111", 
    29 to 31=> "00000000", 32 => "00100001", 33 => "00100011", 34 => "00000000", 
    35 => "00100101", 36 => "00000000", 37 => "00100111", 38 => "00101001", 
    39 => "00000000", 40 => "00101011", 41 to 43=> "00000000", 44 => "00101101", 
    45 => "00101111", 46 => "00110001", 47 => "00110011", 48 to 49=> "00000000", 
    50 => "00110101", 51 => "00110111", 52 to 53=> "00000000", 54 => "00111001", 
    55 to 56=> "00000000", 57 => "00111011", 58 => "00111101", 59 => "00111111", 
    60 => "01000001", 61 to 65=> "00000000", 66 => "01000011", 67 => "01000101", 
    68 => "00000000", 69 => "01000111", 70 => "00000000", 71 => "01001001", 
    72 => "00000000", 73 => "01001011", 74 to 75=> "00000000", 76 => "01001101", 
    77 => "00000000", 78 => "01001111", 79 => "00000000", 80 => "01010001", 
    81 => "01010011", 82 => "01010101", 83 => "01010111", 84 => "00000000", 
    85 => "01011001", 86 => "01011011", 87 => "01011101", 88 => "00000000", 
    89 => "01011111", 90 => "01100001", 91 => "00000000", 92 => "01100011", 
    93 => "00000000", 94 => "01100101", 95 => "01100111", 96 to 99=> "00000000", 
    100 => "01101001", 101 => "00000000", 102 => "01101011", 103 to 104=> "00000000", 
    105 => "01101101", 106 to 107=> "00000000", 108 => "01101111", 109 => "01110001", 
    110 to 113=> "00000000", 114 => "01110011", 115 => "00000000", 116 => "01110101", 
    117 => "01110111", 118 => "01111001", 119 => "01111011", 120 => "01111101", 
    121 to 125=> "00000000", 126 => "01111111", 127 => "10000001", 128 => "00000000", 
    129 => "10000011", 130 => "10000101", 131 => "10000111", 132 => "10001001", 
    133 to 137=> "00000000", 138 => "10001011", 139 => "10001101", 140 => "10001111", 
    141 => "10010001", 142 => "10010011", 143 => "10010101", 144 => "10010111", 
    145 to 150=> "00000000", 151 => "10011001", 152 => "10011011", 153 => "10011101", 
    154 => "10011111", 155 => "00000000", 156 => "10100001", 157 => "00000000", 
    158 => "10100011", 159 to 161=> "00000000", 162 => "10100101", 163 to 165=> "00000000", 
    166 => "10100111", 167 => "10101001", 168 => "10101011", 169 => "10101101", 
    170 => "10101111", 171 to 174=> "00000000", 175 => "10110001", 176 to 177=> "00000000", 
    178 => "10110011", 179 => "10110101", 180 to 194=> "00000000" );


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

entity predict_ensemble_cEy is
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

architecture arch of predict_ensemble_cEy is
    component predict_ensemble_cEy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cEy_rom_U :  component predict_ensemble_cEy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


