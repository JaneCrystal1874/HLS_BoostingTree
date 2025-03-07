-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cUB_rom is 
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


architecture rtl of predict_ensemble_cUB_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00000000", 5 => "00001000", 6 => "00001010", 7 => "00001100", 
    8 => "00001110", 9 => "00000000", 10 => "00010000", 11 => "00010010", 
    12 => "00010100", 13 to 14=> "00000000", 15 => "00010110", 16 => "00000000", 
    17 => "00011000", 18 => "00000000", 19 => "00011010", 20 => "00000000", 
    21 => "00011100", 22 to 23=> "00000000", 24 => "00011110", 25 => "00100000", 
    26 => "00100010", 27 => "00100100", 28 => "00000000", 29 => "00100110", 
    30 to 34=> "00000000", 35 => "00101000", 36 => "00101010", 37 => "00101100", 
    38 => "00101110", 39 => "00110000", 40 => "00110010", 41 to 42=> "00000000", 
    43 => "00110100", 44 => "00110110", 45 to 46=> "00000000", 47 => "00111000", 
    48 => "00000000", 49 => "00111010", 50 => "00111100", 51 to 53=> "00000000", 
    54 => "00111110", 55 => "01000000", 56 => "00000000", 57 => "01000010", 
    58 => "01000100", 59 => "00000000", 60 => "01000110", 61 to 62=> "00000000", 
    63 => "01001000", 64 => "00000000", 65 => "01001010", 66 => "01001100", 
    67 => "00000000", 68 => "01001110", 69 => "00000000", 70 => "01010000", 
    71 => "01010010", 72 => "01010100", 73 => "01010110", 74 => "01011000", 
    75 => "00000000", 76 => "01011010", 77 to 78=> "00000000", 79 => "01011100", 
    80 => "00000000", 81 => "01011110", 82 to 84=> "00000000", 85 => "01100000", 
    86 => "01100010", 87 to 88=> "00000000", 89 => "01100100", 90 => "01100110", 
    91 to 92=> "00000000", 93 => "01101000", 94 => "01101010", 95 => "01101100", 
    96 => "01101110", 97 => "01110000", 98 => "00000000", 99 => "01110010", 
    100 => "00000000", 101 => "01110100", 102 => "00000000", 103 => "01110110", 
    104 => "01111000", 105 => "01111010", 106 => "01111100", 107 => "01111110", 
    108 => "00000000", 109 => "10000000", 110 => "10000010", 111 to 113=> "00000000", 
    114 => "10000100", 115 to 117=> "00000000", 118 => "10000110", 119 to 120=> "00000000", 
    121 => "10001000", 122 => "00000000", 123 => "10001010", 124 => "00000000", 
    125 => "10001100", 126 to 130=> "00000000", 131 => "10001110", 132 => "10010000", 
    133 => "10010010", 134 to 135=> "00000000", 136 => "10010100", 137 to 143=> "00000000", 
    144 => "10010110", 145 to 147=> "00000000", 148 => "10011000", 149 => "00000000", 
    150 => "10011010", 151 => "10011100", 152 => "10011110", 153 to 154=> "00000000", 
    155 => "10100000", 156 => "00000000", 157 => "10100010", 158 => "00000000", 
    159 => "10100100", 160 to 161=> "00000000", 162 => "10100110", 163 => "10101000", 
    164 => "10101010", 165 => "00000000", 166 => "10101100", 167 => "10101110", 
    168 => "00000000", 169 => "10110000", 170 => "00000000", 171 => "10110010", 
    172 to 173=> "00000000", 174 => "10110100", 175 to 194=> "00000000" );


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

entity predict_ensemble_cUB is
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

architecture arch of predict_ensemble_cUB is
    component predict_ensemble_cUB_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cUB_rom_U :  component predict_ensemble_cUB_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


