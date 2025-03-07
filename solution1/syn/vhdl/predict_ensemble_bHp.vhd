-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bHp_rom is 
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


architecture rtl of predict_ensemble_bHp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 to 7=> "00000000", 8 => "00001010", 
    9 => "00000000", 10 => "00001100", 11 => "00001110", 12 => "00010000", 
    13 => "00010010", 14 to 15=> "00000000", 16 => "00010100", 17 => "00000000", 
    18 => "00010110", 19 => "00000000", 20 => "00011000", 21 to 22=> "00000000", 
    23 => "00011010", 24 => "00011100", 25 to 26=> "00000000", 27 => "00011110", 
    28 to 29=> "00000000", 30 => "00100000", 31 => "00000000", 32 => "00100010", 
    33 => "00000000", 34 => "00100100", 35 => "00000000", 36 => "00100110", 
    37 => "00000000", 38 => "00101000", 39 => "00000000", 40 => "00101010", 
    41 => "00101100", 42 => "00101110", 43 => "00110000", 44 => "00000000", 
    45 => "00110010", 46 to 48=> "00000000", 49 => "00110100", 50 => "00110110", 
    51 => "00111000", 52 => "00111010", 53 => "00111100", 54 => "00000000", 
    55 => "00111110", 56 to 58=> "00000000", 59 => "01000000", 60 => "01000010", 
    61 => "01000100", 62 => "01000110", 63 => "01001000", 64 => "00000000", 
    65 => "01001010", 66 => "00000000", 67 => "01001100", 68 => "00000000", 
    69 => "01001110", 70 => "00000000", 71 => "01010000", 72 to 75=> "00000000", 
    76 => "01010010", 77 => "01010100", 78 => "01010110", 79 => "01011000", 
    80 to 81=> "00000000", 82 => "01011010", 83 => "01011100", 84 => "01011110", 
    85 => "00000000", 86 => "01100000", 87 to 89=> "00000000", 90 => "01100010", 
    91 => "01100100", 92 => "00000000", 93 => "01100110", 94 => "01101000", 
    95 => "01101010", 96 => "01101100", 97 => "01101110", 98 => "00000000", 
    99 => "01110000", 100 => "01110010", 101 => "00000000", 102 => "01110100", 
    103 => "01110110", 104 => "01111000", 105 to 109=> "00000000", 110 => "01111010", 
    111 to 113=> "00000000", 114 => "01111100", 115 to 116=> "00000000", 117 => "01111110", 
    118 => "00000000", 119 => "10000000", 120 => "10000010", 121 to 122=> "00000000", 
    123 => "10000100", 124 => "10000110", 125 => "10001000", 126 to 128=> "00000000", 
    129 => "10001010", 130 => "00000000", 131 => "10001100", 132 => "10001110", 
    133 => "10010000", 134 => "10010010", 135 => "10010100", 136 => "10010110", 
    137 => "00000000", 138 => "10011000", 139 => "10011010", 140 => "10011100", 
    141 to 144=> "00000000", 145 => "10011110", 146 => "10100000", 147 => "10100010", 
    148 => "00000000", 149 => "10100100", 150 to 153=> "00000000", 154 => "10100110", 
    155 => "00000000", 156 => "10101000", 157 to 158=> "00000000", 159 => "10101010", 
    160 => "00000000", 161 => "10101100", 162 to 170=> "00000000", 171 => "10101110", 
    172 to 173=> "00000000", 174 => "10110000", 175 => "00000000", 176 => "10110010", 
    177 => "00000000", 178 => "10110100", 179 => "00000000", 180 => "10110110", 
    181 => "00000000", 182 => "10111000", 183 => "00000000", 184 => "10111010", 
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

entity predict_ensemble_bHp is
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

architecture arch of predict_ensemble_bHp is
    component predict_ensemble_bHp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bHp_rom_U :  component predict_ensemble_bHp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


