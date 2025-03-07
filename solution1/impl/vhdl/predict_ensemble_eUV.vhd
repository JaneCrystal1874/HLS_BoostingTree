-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eUV_rom is 
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


architecture rtl of predict_ensemble_eUV_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 => "00000000", 11 => "00001111", 
    12 => "00000000", 13 => "00010001", 14 => "00000000", 15 => "00010011", 
    16 => "00000000", 17 => "00010101", 18 => "00010111", 19 to 23=> "00000000", 
    24 => "00011001", 25 => "00000000", 26 => "00011011", 27 => "00000000", 
    28 => "00011101", 29 => "00011111", 30 to 31=> "00000000", 32 => "00100001", 
    33 => "00100011", 34 => "00100101", 35 => "00100111", 36 => "00101001", 
    37 => "00101011", 38 => "00101101", 39 => "00101111", 40 => "00000000", 
    41 => "00110001", 42 to 46=> "00000000", 47 => "00110011", 48 to 50=> "00000000", 
    51 => "00110101", 52 => "00110111", 53 => "00111001", 54 to 57=> "00000000", 
    58 => "00111011", 59 => "00000000", 60 => "00111101", 61 => "00111111", 
    62 => "01000001", 63 to 65=> "00000000", 66 => "01000011", 67 => "01000101", 
    68 => "01000111", 69 => "00000000", 70 => "01001001", 71 => "00000000", 
    72 => "01001011", 73 => "01001101", 74 => "01001111", 75 => "00000000", 
    76 => "01010001", 77 => "01010011", 78 => "01010101", 79 to 81=> "00000000", 
    82 => "01010111", 83 => "01011001", 84 to 86=> "00000000", 87 => "01011011", 
    88 => "00000000", 89 => "01011101", 90 => "01011111", 91 => "00000000", 
    92 => "01100001", 93 => "00000000", 94 => "01100011", 95 => "01100101", 
    96 to 97=> "00000000", 98 => "01100111", 99 => "00000000", 100 => "01101001", 
    101 => "01101011", 102 to 103=> "00000000", 104 => "01101101", 105 => "00000000", 
    106 => "01101111", 107 => "01110001", 108 to 109=> "00000000", 110 => "01110011", 
    111 => "01110101", 112 => "01110111", 113 to 115=> "00000000", 116 => "01111001", 
    117 => "01111011", 118 => "01111101", 119 => "01111111", 120 => "10000001", 
    121 => "10000011", 122 to 123=> "00000000", 124 => "10000101", 125 to 129=> "00000000", 
    130 => "10000111", 131 => "10001001", 132 to 135=> "00000000", 136 => "10001011", 
    137 => "00000000", 138 => "10001101", 139 => "10001111", 140 => "10010001", 
    141 => "10010011", 142 => "00000000", 143 => "10010101", 144 to 146=> "00000000", 
    147 => "10010111", 148 => "10011001", 149 => "00000000", 150 => "10011011", 
    151 to 152=> "00000000", 153 => "10011101", 154 => "10011111", 155 => "10100001", 
    156 => "00000000", 157 => "10100011", 158 => "10100101", 159 to 162=> "00000000", 
    163 => "10100111", 164 => "10101001", 165 => "10101011", 166 => "00000000", 
    167 => "10101101", 168 to 170=> "00000000", 171 => "10101111", 172 => "10110001", 
    173 to 194=> "00000000" );


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

entity predict_ensemble_eUV is
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

architecture arch of predict_ensemble_eUV is
    component predict_ensemble_eUV_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eUV_rom_U :  component predict_ensemble_eUV_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


