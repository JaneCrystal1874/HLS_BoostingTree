-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bCo_rom is 
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


architecture rtl of predict_ensemble_bCo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00001010", 7 => "00001100", 
    8 to 9=> "00000000", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 => "00000000", 14 => "00010010", 15 => "00000000", 16 => "00010100", 
    17 => "00000000", 18 => "00010110", 19 to 20=> "00000000", 21 => "00011000", 
    22 => "00011010", 23 to 24=> "00000000", 25 => "00011100", 26 => "00011110", 
    27 to 29=> "00000000", 30 => "00100000", 31 => "00100010", 32 => "00000000", 
    33 => "00100100", 34 => "00000000", 35 => "00100110", 36 => "00101000", 
    37 => "00101010", 38 => "00101100", 39 to 43=> "00000000", 44 => "00101110", 
    45 => "00000000", 46 => "00110000", 47 => "00110010", 48 => "00110100", 
    49 => "00000000", 50 => "00110110", 51 => "00111000", 52 => "00111010", 
    53 to 54=> "00000000", 55 => "00111100", 56 to 59=> "00000000", 60 => "00111110", 
    61 => "01000000", 62 => "00000000", 63 => "01000010", 64 => "01000100", 
    65 => "01000110", 66 => "01001000", 67 to 68=> "00000000", 69 => "01001010", 
    70 => "00000000", 71 => "01001100", 72 => "01001110", 73 => "01010000", 
    74 => "01010010", 75 to 77=> "00000000", 78 => "01010100", 79 to 82=> "00000000", 
    83 => "01010110", 84 => "01011000", 85 => "00000000", 86 => "01011010", 
    87 => "00000000", 88 => "01011100", 89 to 90=> "00000000", 91 => "01011110", 
    92 => "01100000", 93 => "01100010", 94 to 96=> "00000000", 97 => "01100100", 
    98 => "01100110", 99 => "01101000", 100 => "01101010", 101 => "01101100", 
    102 => "01101110", 103 to 105=> "00000000", 106 => "01110000", 107 => "00000000", 
    108 => "01110010", 109 => "01110100", 110 => "01110110", 111 => "01111000", 
    112 to 113=> "00000000", 114 => "01111010", 115 to 116=> "00000000", 117 => "01111100", 
    118 => "01111110", 119 => "10000000", 120 to 122=> "00000000", 123 => "10000010", 
    124 => "10000100", 125 => "00000000", 126 => "10000110", 127 => "10001000", 
    128 => "00000000", 129 => "10001010", 130 => "10001100", 131 => "10001110", 
    132 => "10010000", 133 => "10010010", 134 => "00000000", 135 => "10010100", 
    136 => "00000000", 137 => "10010110", 138 => "10011000", 139 to 142=> "00000000", 
    143 => "10011010", 144 => "10011100", 145 => "10011110", 146 to 147=> "00000000", 
    148 => "10100000", 149 => "10100010", 150 to 151=> "00000000", 152 => "10100100", 
    153 => "10100110", 154 to 155=> "00000000", 156 => "10101000", 157 => "00000000", 
    158 => "10101010", 159 => "10101100", 160 => "00000000", 161 => "10101110", 
    162 to 164=> "00000000", 165 => "10110000", 166 to 170=> "00000000", 171 => "10110010", 
    172 => "00000000", 173 => "10110100", 174 => "10110110", 175 => "10111000", 
    176 => "10111010", 177 => "10111100", 178 => "00000000", 179 => "10111110", 
    180 => "00000000", 181 => "11000000", 182 to 194=> "00000000" );


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

entity predict_ensemble_bCo is
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

architecture arch of predict_ensemble_bCo is
    component predict_ensemble_bCo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bCo_rom_U :  component predict_ensemble_bCo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


