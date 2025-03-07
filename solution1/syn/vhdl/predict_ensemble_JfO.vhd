-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_JfO_rom is 
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


architecture rtl of predict_ensemble_JfO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00001010", 5 => "00001100", 6 => "00001110", 7 => "00000000", 
    8 => "00010000", 9 => "00000000", 10 => "00010010", 11 to 12=> "00000000", 
    13 => "00010100", 14 => "00010110", 15 => "00000000", 16 => "00011000", 
    17 => "00000000", 18 => "00011010", 19 => "00000000", 20 => "00011100", 
    21 => "00011110", 22 => "00100000", 23 => "00100010", 24 => "00100100", 
    25 => "00000000", 26 => "00100110", 27 to 28=> "00000000", 29 => "00101000", 
    30 => "00101010", 31 => "00101100", 32 => "00101110", 33 => "00000000", 
    34 => "00110000", 35 => "00110010", 36 => "00110100", 37 => "00000000", 
    38 => "00110110", 39 to 42=> "00000000", 43 => "00111000", 44 => "00111010", 
    45 => "00111100", 46 => "00000000", 47 => "00111110", 48 => "00000000", 
    49 => "01000000", 50 => "01000010", 51 => "00000000", 52 => "01000100", 
    53 to 57=> "00000000", 58 => "01000110", 59 => "01001000", 60 => "00000000", 
    61 => "01001010", 62 to 64=> "00000000", 65 => "01001100", 66 to 73=> "00000000", 
    74 => "01001110", 75 => "01010000", 76 to 79=> "00000000", 80 => "01010010", 
    81 => "00000000", 82 => "01010100", 83 => "01010110", 84 => "01011000", 
    85 => "01011010", 86 => "01011100", 87 => "00000000", 88 => "01011110", 
    89 to 90=> "00000000", 91 => "01100000", 92 => "01100010", 93 => "00000000", 
    94 => "01100100", 95 to 96=> "00000000", 97 => "01100110", 98 => "00000000", 
    99 => "01101000", 100 => "01101010", 101 => "01101100", 102 => "00000000", 
    103 => "01101110", 104 => "00000000", 105 => "01110000", 106 => "01110010", 
    107 => "00000000", 108 => "01110100", 109 => "01110110", 110 => "00000000", 
    111 => "01111000", 112 => "01111010", 113 => "00000000", 114 => "01111100", 
    115 to 116=> "00000000", 117 => "01111110", 118 => "10000000", 119 => "00000000", 
    120 => "10000010", 121 to 122=> "00000000", 123 => "10000100", 124 => "10000110", 
    125 => "00000000", 126 => "10001000", 127 => "10001010", 128 => "10001100", 
    129 => "00000000", 130 => "10001110", 131 to 132=> "00000000", 133 => "10010000", 
    134 => "10010010", 135 => "10010100", 136 to 138=> "00000000", 139 => "10010110", 
    140 => "10011000", 141 => "10011010", 142 to 147=> "00000000", 148 => "10011100", 
    149 => "10011110", 150 => "10100000", 151 => "00000000", 152 => "10100010", 
    153 => "10100100", 154 => "10100110", 155 to 156=> "00000000", 157 => "10101000", 
    158 to 160=> "00000000", 161 => "10101010", 162 => "10101100", 163 => "00000000", 
    164 => "10101110", 165 to 166=> "00000000", 167 => "10110000", 168 => "00000000", 
    169 => "10110010", 170 => "00000000", 171 => "10110100", 172 to 175=> "00000000", 
    176 => "10110110", 177 to 178=> "00000000", 179 => "10111000", 180 => "10111010", 
    181 to 182=> "00000000", 183 => "10111100", 184 => "10111110", 185 => "11000000", 
    186 to 194=> "00000000" );


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

entity predict_ensemble_JfO is
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

architecture arch of predict_ensemble_JfO is
    component predict_ensemble_JfO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_JfO_rom_U :  component predict_ensemble_JfO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


