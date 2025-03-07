-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cAy_rom is 
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


architecture rtl of predict_ensemble_cAy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00000000", 6 => "00001000", 7 => "00001010", 
    8 => "00000000", 9 => "00001100", 10 => "00001110", 11 to 13=> "00000000", 
    14 => "00010000", 15 => "00000000", 16 => "00010010", 17 => "00010100", 
    18 => "00000000", 19 => "00010110", 20 => "00000000", 21 => "00011000", 
    22 => "00000000", 23 => "00011010", 24 => "00011100", 25 => "00011110", 
    26 => "00100000", 27 to 28=> "00000000", 29 => "00100010", 30 to 31=> "00000000", 
    32 => "00100100", 33 => "00100110", 34 => "00000000", 35 => "00101000", 
    36 => "00101010", 37 to 41=> "00000000", 42 => "00101100", 43 => "00101110", 
    44 to 45=> "00000000", 46 => "00110000", 47 => "00110010", 48 => "00000000", 
    49 => "00110100", 50 => "00110110", 51 => "00111000", 52 to 53=> "00000000", 
    54 => "00111010", 55 => "00111100", 56 => "00111110", 57 => "01000000", 
    58 => "01000010", 59 => "01000100", 60 => "01000110", 61 to 63=> "00000000", 
    64 => "01001000", 65 => "00000000", 66 => "01001010", 67 to 71=> "00000000", 
    72 => "01001100", 73 => "01001110", 74 => "00000000", 75 => "01010000", 
    76 => "00000000", 77 => "01010010", 78 to 80=> "00000000", 81 => "01010100", 
    82 => "00000000", 83 => "01010110", 84 => "01011000", 85 => "00000000", 
    86 => "01011010", 87 => "01011100", 88 => "01011110", 89 to 90=> "00000000", 
    91 => "01100000", 92 to 94=> "00000000", 95 => "01100010", 96 to 97=> "00000000", 
    98 => "01100100", 99 => "01100110", 100 => "01101000", 101 => "01101010", 
    102 to 103=> "00000000", 104 => "01101100", 105 => "00000000", 106 => "01101110", 
    107 => "01110000", 108 => "01110010", 109 to 112=> "00000000", 113 => "01110100", 
    114 to 115=> "00000000", 116 => "01110110", 117 => "01111000", 118 => "00000000", 
    119 => "01111010", 120 => "01111100", 121 => "01111110", 122 to 123=> "00000000", 
    124 => "10000000", 125 to 126=> "00000000", 127 => "10000010", 128 => "10000100", 
    129 => "00000000", 130 => "10000110", 131 => "10001000", 132 => "10001010", 
    133 to 136=> "00000000", 137 => "10001100", 138 => "10001110", 139 => "10010000", 
    140 => "10010010", 141 => "00000000", 142 => "10010100", 143 to 146=> "00000000", 
    147 => "10010110", 148 => "10011000", 149 => "10011010", 150 => "10011100", 
    151 => "00000000", 152 => "10011110", 153 to 155=> "00000000", 156 => "10100000", 
    157 => "10100010", 158 to 159=> "00000000", 160 => "10100100", 161 => "10100110", 
    162 => "10101000", 163 => "10101010", 164 => "10101100", 165 => "10101110", 
    166 => "10110000", 167 => "10110010", 168 to 169=> "00000000", 170 => "10110100", 
    171 to 173=> "00000000", 174 => "10110110", 175 => "00000000", 176 => "10111000", 
    177 to 179=> "00000000", 180 => "10111010", 181 to 184=> "00000000", 185 => "10111100", 
    186 => "10111110", 187 to 194=> "00000000" );


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

entity predict_ensemble_cAy is
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

architecture arch of predict_ensemble_cAy is
    component predict_ensemble_cAy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cAy_rom_U :  component predict_ensemble_cAy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


