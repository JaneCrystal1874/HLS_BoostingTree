-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_OgC_rom is 
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


architecture rtl of predict_ensemble_OgC_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00001100", 
    9 => "00000000", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 to 15=> "00000000", 16 => "00010010", 17 => "00000000", 18 => "00010100", 
    19 => "00000000", 20 => "00010110", 21 => "00000000", 22 => "00011000", 
    23 => "00011010", 24 => "00011100", 25 => "00011110", 26 to 27=> "00000000", 
    28 => "00100000", 29 to 30=> "00000000", 31 => "00100010", 32 => "00100100", 
    33 => "00100110", 34 => "00101000", 35 to 36=> "00000000", 37 => "00101010", 
    38 => "00101100", 39 => "00101110", 40 => "00110000", 41 => "00110010", 
    42 to 43=> "00000000", 44 => "00110100", 45 => "00000000", 46 => "00110110", 
    47 => "00111000", 48 to 49=> "00000000", 50 => "00111010", 51 => "00000000", 
    52 => "00111100", 53 to 55=> "00000000", 56 => "00111110", 57 => "00000000", 
    58 => "01000000", 59 => "01000010", 60 => "01000100", 61 => "01000110", 
    62 => "01001000", 63 => "00000000", 64 => "01001010", 65 => "01001100", 
    66 to 67=> "00000000", 68 => "01001110", 69 => "01010000", 70 => "01010010", 
    71 => "00000000", 72 => "01010100", 73 to 79=> "00000000", 80 => "01010110", 
    81 to 82=> "00000000", 83 => "01011000", 84 => "01011010", 85 to 86=> "00000000", 
    87 => "01011100", 88 => "01011110", 89 => "00000000", 90 => "01100000", 
    91 to 92=> "00000000", 93 => "01100010", 94 => "01100100", 95 => "01100110", 
    96 => "00000000", 97 => "01101000", 98 to 99=> "00000000", 100 => "01101010", 
    101 => "01101100", 102 to 106=> "00000000", 107 => "01101110", 108 => "01110000", 
    109 to 111=> "00000000", 112 => "01110010", 113 => "01110100", 114 => "01110110", 
    115 => "00000000", 116 => "01111000", 117 => "01111010", 118 => "01111100", 
    119 => "00000000", 120 => "01111110", 121 => "10000000", 122 to 123=> "00000000", 
    124 => "10000010", 125 to 126=> "00000000", 127 => "10000100", 128 => "10000110", 
    129 => "10001000", 130 to 131=> "00000000", 132 => "10001010", 133 => "00000000", 
    134 => "10001100", 135 => "10001110", 136 => "10010000", 137 => "00000000", 
    138 => "10010010", 139 => "10010100", 140 => "10010110", 141 => "10011000", 
    142 => "00000000", 143 => "10011010", 144 => "10011100", 145 to 146=> "00000000", 
    147 => "10011110", 148 => "00000000", 149 => "10100000", 150 => "10100010", 
    151 => "10100100", 152 => "10100110", 153 to 156=> "00000000", 157 => "10101000", 
    158 => "10101010", 159 => "00000000", 160 => "10101100", 161 => "10101110", 
    162 to 164=> "00000000", 165 => "10110000", 166 to 168=> "00000000", 169 => "10110010", 
    170 to 172=> "00000000", 173 => "10110100", 174 => "00000000", 175 => "10110110", 
    176 to 177=> "00000000", 178 => "10111000", 179 => "10111010", 180 to 182=> "00000000", 
    183 => "10111100", 184 to 185=> "00000000", 186 => "10111110", 187 to 194=> "00000000" );


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

entity predict_ensemble_OgC is
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

architecture arch of predict_ensemble_OgC is
    component predict_ensemble_OgC_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_OgC_rom_U :  component predict_ensemble_OgC_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


