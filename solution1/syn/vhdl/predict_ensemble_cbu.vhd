-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cbu_rom is 
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


architecture rtl of predict_ensemble_cbu_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00000000", 6 => "00001000", 7 => "00001010", 
    8 => "00000000", 9 => "00001100", 10 => "00001110", 11 to 12=> "00000000", 
    13 => "00010000", 14 to 15=> "00000000", 16 => "00010010", 17 => "00010100", 
    18 => "00010110", 19 to 21=> "00000000", 22 => "00011000", 23 => "00011010", 
    24 => "00000000", 25 => "00011100", 26 => "00000000", 27 => "00011110", 
    28 => "00100000", 29 => "00000000", 30 => "00100010", 31 => "00000000", 
    32 => "00100100", 33 => "00100110", 34 to 35=> "00000000", 36 => "00101000", 
    37 => "00000000", 38 => "00101010", 39 => "00101100", 40 to 41=> "00000000", 
    42 => "00101110", 43 => "00000000", 44 => "00110000", 45 => "00110010", 
    46 => "00000000", 47 => "00110100", 48 => "00110110", 49 => "00111000", 
    50 => "00000000", 51 => "00111010", 52 => "00000000", 53 => "00111100", 
    54 => "00000000", 55 => "00111110", 56 => "01000000", 57 => "00000000", 
    58 => "01000010", 59 => "00000000", 60 => "01000100", 61 => "00000000", 
    62 => "01000110", 63 to 65=> "00000000", 66 => "01001000", 67 => "01001010", 
    68 to 73=> "00000000", 74 => "01001100", 75 => "01001110", 76 => "00000000", 
    77 => "01010000", 78 => "01010010", 79 => "01010100", 80 => "01010110", 
    81 to 83=> "00000000", 84 => "01011000", 85 => "01011010", 86 => "01011100", 
    87 => "00000000", 88 => "01011110", 89 => "01100000", 90 => "00000000", 
    91 => "01100010", 92 => "01100100", 93 => "00000000", 94 => "01100110", 
    95 => "01101000", 96 to 98=> "00000000", 99 => "01101010", 100 => "01101100", 
    101 => "01101110", 102 to 105=> "00000000", 106 => "01110000", 107 => "00000000", 
    108 => "01110010", 109 => "00000000", 110 => "01110100", 111 to 112=> "00000000", 
    113 => "01110110", 114 => "00000000", 115 => "01111000", 116 => "00000000", 
    117 => "01111010", 118 => "01111100", 119 => "00000000", 120 => "01111110", 
    121 => "00000000", 122 => "10000000", 123 => "00000000", 124 => "10000010", 
    125 to 126=> "00000000", 127 => "10000100", 128 => "10000110", 129 => "10001000", 
    130 to 131=> "00000000", 132 => "10001010", 133 => "10001100", 134 => "10001110", 
    135 to 136=> "00000000", 137 => "10010000", 138 => "10010010", 139 to 141=> "00000000", 
    142 => "10010100", 143 => "10010110", 144 to 146=> "00000000", 147 => "10011000", 
    148 => "10011010", 149 to 150=> "00000000", 151 => "10011100", 152 to 154=> "00000000", 
    155 => "10011110", 156 => "00000000", 157 => "10100000", 158 => "10100010", 
    159 => "00000000", 160 => "10100100", 161 => "00000000", 162 => "10100110", 
    163 => "10101000", 164 to 165=> "00000000", 166 => "10101010", 167 => "10101100", 
    168 => "10101110", 169 to 173=> "00000000", 174 => "10110000", 175 => "00000000", 
    176 => "10110010", 177 => "10110100", 178 to 179=> "00000000", 180 => "10110110", 
    181 => "10111000", 182 => "10111010", 183 to 194=> "00000000" );


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

entity predict_ensemble_cbu is
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

architecture arch of predict_ensemble_cbu is
    component predict_ensemble_cbu_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cbu_rom_U :  component predict_ensemble_cbu_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


