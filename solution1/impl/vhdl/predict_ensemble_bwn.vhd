-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bwn_rom is 
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


architecture rtl of predict_ensemble_bwn_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 to 7=> "00000000", 8 => "00001001", 
    9 => "00001011", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 => "00010001", 14 => "00000000", 15 => "00010011", 16 => "00010101", 
    17 to 18=> "00000000", 19 => "00010111", 20 => "00000000", 21 => "00011001", 
    22 => "00011011", 23 => "00011101", 24 to 25=> "00000000", 26 => "00011111", 
    27 => "00100001", 28 to 30=> "00000000", 31 => "00100011", 32 => "00000000", 
    33 => "00100101", 34 => "00100111", 35 to 38=> "00000000", 39 => "00101001", 
    40 => "00101011", 41 => "00101101", 42 to 44=> "00000000", 45 => "00101111", 
    46 => "00000000", 47 => "00110001", 48 => "00110011", 49 => "00110101", 
    50 => "00110111", 51 to 53=> "00000000", 54 => "00111001", 55 => "00111011", 
    56 => "00000000", 57 => "00111101", 58 => "00111111", 59 => "01000001", 
    60 to 62=> "00000000", 63 => "01000011", 64 => "01000101", 65 => "00000000", 
    66 => "01000111", 67 => "00000000", 68 => "01001001", 69 => "00000000", 
    70 => "01001011", 71 => "00000000", 72 => "01001101", 73 => "01001111", 
    74 => "01010001", 75 to 76=> "00000000", 77 => "01010011", 78 => "01010101", 
    79 => "01010111", 80 => "01011001", 81 => "01011011", 82 => "01011101", 
    83 => "00000000", 84 => "01011111", 85 => "01100001", 86 => "01100011", 
    87 => "01100101", 88 to 89=> "00000000", 90 => "01100111", 91 => "00000000", 
    92 => "01101001", 93 => "00000000", 94 => "01101011", 95 => "00000000", 
    96 => "01101101", 97 => "00000000", 98 => "01101111", 99 => "01110001", 
    100 => "01110011", 101 => "01110101", 102 to 104=> "00000000", 105 => "01110111", 
    106 to 111=> "00000000", 112 => "01111001", 113 to 116=> "00000000", 117 => "01111011", 
    118 => "00000000", 119 => "01111101", 120 to 121=> "00000000", 122 => "01111111", 
    123 to 124=> "00000000", 125 => "10000001", 126 => "10000011", 127 => "10000101", 
    128 => "10000111", 129 => "00000000", 130 => "10001001", 131 => "10001011", 
    132 => "10001101", 133 => "10001111", 134 => "10010001", 135 to 136=> "00000000", 
    137 => "10010011", 138 => "10010101", 139 to 141=> "00000000", 142 => "10010111", 
    143 => "10011001", 144 => "10011011", 145 => "10011101", 146 => "00000000", 
    147 => "10011111", 148 => "10100001", 149 to 150=> "00000000", 151 => "10100011", 
    152 => "10100101", 153 to 156=> "00000000", 157 => "10100111", 158 to 159=> "00000000", 
    160 => "10101001", 161 to 164=> "00000000", 165 => "10101011", 166 => "00000000", 
    167 => "10101101", 168 to 169=> "00000000", 170 => "10101111", 171 => "10110001", 
    172 to 176=> "00000000", 177 => "10110011", 178 => "00000000", 179 => "10110101", 
    180 => "00000000", 181 => "10110111", 182 to 183=> "00000000", 184 => "10111001", 
    185 to 194=> "00000000" );


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

entity predict_ensemble_bwn is
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

architecture arch of predict_ensemble_bwn is
    component predict_ensemble_bwn_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bwn_rom_U :  component predict_ensemble_bwn_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


