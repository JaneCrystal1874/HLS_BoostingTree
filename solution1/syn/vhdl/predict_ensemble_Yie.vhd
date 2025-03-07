-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Yie_rom is 
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


architecture rtl of predict_ensemble_Yie_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00001010", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 => "00010000", 11 => "00010010", 
    12 => "00010100", 13 => "00010110", 14 to 16=> "00000000", 17 => "00011000", 
    18 => "00011010", 19 => "00011100", 20 => "00011110", 21 to 22=> "00000000", 
    23 => "00100000", 24 to 26=> "00000000", 27 => "00100010", 28 => "00100100", 
    29 to 30=> "00000000", 31 => "00100110", 32 => "00101000", 33 => "00101010", 
    34 => "00000000", 35 => "00101100", 36 => "00101110", 37 to 40=> "00000000", 
    41 => "00110000", 42 => "00110010", 43 to 46=> "00000000", 47 => "00110100", 
    48 => "00110110", 49 => "00111000", 50 => "00111010", 51 => "00111100", 
    52 => "00111110", 53 to 54=> "00000000", 55 => "01000000", 56 => "00000000", 
    57 => "01000010", 58 => "01000100", 59 => "01000110", 60 => "00000000", 
    61 => "01001000", 62 => "01001010", 63 to 67=> "00000000", 68 => "01001100", 
    69 => "00000000", 70 => "01001110", 71 to 73=> "00000000", 74 => "01010000", 
    75 => "01010010", 76 => "01010100", 77 => "00000000", 78 => "01010110", 
    79 to 83=> "00000000", 84 => "01011000", 85 => "01011010", 86 to 87=> "00000000", 
    88 => "01011100", 89 => "01011110", 90 => "00000000", 91 => "01100000", 
    92 to 94=> "00000000", 95 => "01100010", 96 => "01100100", 97 => "01100110", 
    98 => "00000000", 99 => "01101000", 100 => "00000000", 101 => "01101010", 
    102 to 104=> "00000000", 105 => "01101100", 106 => "01101110", 107 => "01110000", 
    108 => "01110010", 109 => "00000000", 110 => "01110100", 111 to 113=> "00000000", 
    114 => "01110110", 115 => "01111000", 116 => "01111010", 117 => "00000000", 
    118 => "01111100", 119 => "00000000", 120 => "01111110", 121 => "00000000", 
    122 => "10000000", 123 => "10000010", 124 => "10000100", 125 => "00000000", 
    126 => "10000110", 127 => "00000000", 128 => "10001000", 129 to 131=> "00000000", 
    132 => "10001010", 133 => "10001100", 134 to 135=> "00000000", 136 => "10001110", 
    137 => "00000000", 138 => "10010000", 139 to 140=> "00000000", 141 => "10010010", 
    142 => "10010100", 143 => "10010110", 144 => "10011000", 145 to 146=> "00000000", 
    147 => "10011010", 148 => "10011100", 149 to 152=> "00000000", 153 => "10011110", 
    154 => "10100000", 155 => "00000000", 156 => "10100010", 157 => "10100100", 
    158 to 159=> "00000000", 160 => "10100110", 161 => "10101000", 162 to 164=> "00000000", 
    165 => "10101010", 166 => "10101100", 167 => "00000000", 168 => "10101110", 
    169 => "00000000", 170 => "10110000", 171 to 172=> "00000000", 173 => "10110010", 
    174 => "00000000", 175 => "10110100", 176 => "10110110", 177 to 178=> "00000000", 
    179 => "10111000", 180 => "00000000", 181 => "10111010", 182 => "10111100", 
    183 to 187=> "00000000", 188 => "10111110", 189 => "11000000", 190 => "00000000", 
    191 => "11000010", 192 to 194=> "00000000" );


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

entity predict_ensemble_Yie is
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

architecture arch of predict_ensemble_Yie is
    component predict_ensemble_Yie_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Yie_rom_U :  component predict_ensemble_Yie_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


