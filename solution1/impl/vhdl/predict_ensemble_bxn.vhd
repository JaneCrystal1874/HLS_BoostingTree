-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bxn_rom is 
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


architecture rtl of predict_ensemble_bxn_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 to 7=> "00000000", 8 => "00001010", 
    9 => "00001100", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 => "00010010", 14 => "00000000", 15 => "00010100", 16 => "00010110", 
    17 to 18=> "00000000", 19 => "00011000", 20 => "00000000", 21 => "00011010", 
    22 => "00011100", 23 => "00011110", 24 to 25=> "00000000", 26 => "00100000", 
    27 => "00100010", 28 to 30=> "00000000", 31 => "00100100", 32 => "00000000", 
    33 => "00100110", 34 => "00101000", 35 to 38=> "00000000", 39 => "00101010", 
    40 => "00101100", 41 => "00101110", 42 to 44=> "00000000", 45 => "00110000", 
    46 => "00000000", 47 => "00110010", 48 => "00110100", 49 => "00110110", 
    50 => "00111000", 51 to 53=> "00000000", 54 => "00111010", 55 => "00111100", 
    56 => "00000000", 57 => "00111110", 58 => "01000000", 59 => "01000010", 
    60 to 62=> "00000000", 63 => "01000100", 64 => "01000110", 65 => "00000000", 
    66 => "01001000", 67 => "00000000", 68 => "01001010", 69 => "00000000", 
    70 => "01001100", 71 => "00000000", 72 => "01001110", 73 => "01010000", 
    74 => "01010010", 75 to 76=> "00000000", 77 => "01010100", 78 => "01010110", 
    79 => "01011000", 80 => "01011010", 81 => "01011100", 82 => "01011110", 
    83 => "00000000", 84 => "01100000", 85 => "01100010", 86 => "01100100", 
    87 => "01100110", 88 to 89=> "00000000", 90 => "01101000", 91 => "00000000", 
    92 => "01101010", 93 => "00000000", 94 => "01101100", 95 => "00000000", 
    96 => "01101110", 97 => "00000000", 98 => "01110000", 99 => "01110010", 
    100 => "01110100", 101 => "01110110", 102 to 104=> "00000000", 105 => "01111000", 
    106 to 111=> "00000000", 112 => "01111010", 113 to 116=> "00000000", 117 => "01111100", 
    118 => "00000000", 119 => "01111110", 120 to 121=> "00000000", 122 => "10000000", 
    123 to 124=> "00000000", 125 => "10000010", 126 => "10000100", 127 => "10000110", 
    128 => "10001000", 129 => "00000000", 130 => "10001010", 131 => "10001100", 
    132 => "10001110", 133 => "10010000", 134 => "10010010", 135 to 136=> "00000000", 
    137 => "10010100", 138 => "10010110", 139 to 141=> "00000000", 142 => "10011000", 
    143 => "10011010", 144 => "10011100", 145 => "10011110", 146 => "00000000", 
    147 => "10100000", 148 => "10100010", 149 to 150=> "00000000", 151 => "10100100", 
    152 => "10100110", 153 to 156=> "00000000", 157 => "10101000", 158 to 159=> "00000000", 
    160 => "10101010", 161 to 164=> "00000000", 165 => "10101100", 166 => "00000000", 
    167 => "10101110", 168 to 169=> "00000000", 170 => "10110000", 171 => "10110010", 
    172 to 176=> "00000000", 177 => "10110100", 178 => "00000000", 179 => "10110110", 
    180 => "00000000", 181 => "10111000", 182 to 183=> "00000000", 184 => "10111010", 
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

entity predict_ensemble_bxn is
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

architecture arch of predict_ensemble_bxn is
    component predict_ensemble_bxn_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bxn_rom_U :  component predict_ensemble_bxn_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


