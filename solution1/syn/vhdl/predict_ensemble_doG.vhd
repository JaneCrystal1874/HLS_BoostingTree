-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_doG_rom is 
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


architecture rtl of predict_ensemble_doG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00000000", 
    8 => "00001100", 9 to 10=> "00000000", 11 => "00001110", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 to 19=> "00000000", 20 => "00010110", 
    21 => "00000000", 22 => "00011000", 23 => "00011010", 24 => "00000000", 
    25 => "00011100", 26 to 27=> "00000000", 28 => "00011110", 29 => "00100000", 
    30 => "00100010", 31 => "00100100", 32 => "00000000", 33 => "00100110", 
    34 => "00000000", 35 => "00101000", 36 => "00101010", 37 to 38=> "00000000", 
    39 => "00101100", 40 to 41=> "00000000", 42 => "00101110", 43 => "00110000", 
    44 to 47=> "00000000", 48 => "00110010", 49 => "00000000", 50 => "00110100", 
    51 => "00000000", 52 => "00110110", 53 => "00000000", 54 => "00111000", 
    55 => "00111010", 56 => "00000000", 57 => "00111100", 58 => "00111110", 
    59 => "01000000", 60 to 61=> "00000000", 62 => "01000010", 63 to 64=> "00000000", 
    65 => "01000100", 66 => "01000110", 67 to 69=> "00000000", 70 => "01001000", 
    71 => "00000000", 72 => "01001010", 73 => "01001100", 74 => "01001110", 
    75 => "01010000", 76 => "00000000", 77 => "01010010", 78 => "00000000", 
    79 => "01010100", 80 => "01010110", 81 => "01011000", 82 => "01011010", 
    83 => "01011100", 84 to 85=> "00000000", 86 => "01011110", 87 => "00000000", 
    88 => "01100000", 89 => "01100010", 90 => "01100100", 91 => "00000000", 
    92 => "01100110", 93 => "01101000", 94 => "00000000", 95 => "01101010", 
    96 to 99=> "00000000", 100 => "01101100", 101 => "01101110", 102 => "01110000", 
    103 => "01110010", 104 to 106=> "00000000", 107 => "01110100", 108 => "00000000", 
    109 => "01110110", 110 to 111=> "00000000", 112 => "01111000", 113 => "00000000", 
    114 => "01111010", 115 => "01111100", 116 => "01111110", 117 => "10000000", 
    118 => "10000010", 119 => "00000000", 120 => "10000100", 121 to 125=> "00000000", 
    126 => "10000110", 127 => "10001000", 128 => "00000000", 129 => "10001010", 
    130 => "10001100", 131 to 132=> "00000000", 133 => "10001110", 134 to 139=> "00000000", 
    140 => "10010000", 141 => "10010010", 142 => "10010100", 143 => "10010110", 
    144 to 147=> "00000000", 148 => "10011000", 149 => "00000000", 150 => "10011010", 
    151 => "10011100", 152 => "10011110", 153 to 156=> "00000000", 157 => "10100000", 
    158 => "10100010", 159 => "10100100", 160 => "10100110", 161 => "00000000", 
    162 => "10101000", 163 to 164=> "00000000", 165 => "10101010", 166 => "10101100", 
    167 to 168=> "00000000", 169 => "10101110", 170 to 171=> "00000000", 172 => "10110000", 
    173 to 175=> "00000000", 176 => "10110010", 177 to 194=> "00000000" );


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

entity predict_ensemble_doG is
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

architecture arch of predict_ensemble_doG is
    component predict_ensemble_doG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_doG_rom_U :  component predict_ensemble_doG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


