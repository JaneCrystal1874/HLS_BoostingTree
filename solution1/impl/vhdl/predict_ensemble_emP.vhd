-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_emP_rom is 
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


architecture rtl of predict_ensemble_emP_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00001100", 
    8 => "00001110", 9 => "00010000", 10 => "00000000", 11 => "00010010", 
    12 to 13=> "00000000", 14 => "00010100", 15 to 16=> "00000000", 17 => "00010110", 
    18 to 21=> "00000000", 22 => "00011000", 23 => "00000000", 24 => "00011010", 
    25 => "00011100", 26 => "00000000", 27 => "00011110", 28 => "00100000", 
    29 => "00100010", 30 => "00100100", 31 => "00100110", 32 to 33=> "00000000", 
    34 => "00101000", 35 => "00101010", 36 => "00101100", 37 to 42=> "00000000", 
    43 => "00101110", 44 => "00110000", 45 => "00110010", 46 to 47=> "00000000", 
    48 => "00110100", 49 => "00110110", 50 => "00111000", 51 to 53=> "00000000", 
    54 => "00111010", 55 => "00000000", 56 => "00111100", 57 => "00000000", 
    58 => "00111110", 59 => "01000000", 60 => "00000000", 61 => "01000010", 
    62 => "01000100", 63 => "01000110", 64 => "01001000", 65 => "01001010", 
    66 to 68=> "00000000", 69 => "01001100", 70 => "01001110", 71 to 72=> "00000000", 
    73 => "01010000", 74 to 75=> "00000000", 76 => "01010010", 77 to 79=> "00000000", 
    80 => "01010100", 81 => "01010110", 82 to 83=> "00000000", 84 => "01011000", 
    85 => "00000000", 86 => "01011010", 87 => "00000000", 88 => "01011100", 
    89 => "00000000", 90 => "01011110", 91 => "00000000", 92 => "01100000", 
    93 to 94=> "00000000", 95 => "01100010", 96 => "00000000", 97 => "01100100", 
    98 => "00000000", 99 => "01100110", 100 to 101=> "00000000", 102 => "01101000", 
    103 => "01101010", 104 => "01101100", 105 to 107=> "00000000", 108 => "01101110", 
    109 => "00000000", 110 => "01110000", 111 => "01110010", 112 => "00000000", 
    113 => "01110100", 114 => "00000000", 115 => "01110110", 116 => "01111000", 
    117 => "01111010", 118 => "01111100", 119 => "01111110", 120 => "00000000", 
    121 => "10000000", 122 => "10000010", 123 => "00000000", 124 => "10000100", 
    125 => "10000110", 126 => "00000000", 127 => "10001000", 128 => "00000000", 
    129 => "10001010", 130 to 132=> "00000000", 133 => "10001100", 134 to 137=> "00000000", 
    138 => "10001110", 139 => "10010000", 140 => "10010010", 141 to 142=> "00000000", 
    143 => "10010100", 144 => "10010110", 145 => "00000000", 146 => "10011000", 
    147 to 148=> "00000000", 149 => "10011010", 150 => "10011100", 151 => "10011110", 
    152 to 155=> "00000000", 156 => "10100000", 157 => "00000000", 158 => "10100010", 
    159 => "10100100", 160 to 162=> "00000000", 163 => "10100110", 164 => "00000000", 
    165 => "10101000", 166 => "00000000", 167 => "10101010", 168 => "10101100", 
    169 => "10101110", 170 to 194=> "00000000" );


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

entity predict_ensemble_emP is
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

architecture arch of predict_ensemble_emP is
    component predict_ensemble_emP_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_emP_rom_U :  component predict_ensemble_emP_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


