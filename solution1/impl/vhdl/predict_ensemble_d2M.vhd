-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d2M_rom is 
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


architecture rtl of predict_ensemble_d2M_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 to 7=> "00000000", 8 => "00001100", 
    9 => "00001110", 10 => "00000000", 11 => "00010000", 12 to 14=> "00000000", 
    15 => "00010010", 16 to 17=> "00000000", 18 => "00010100", 19 => "00000000", 
    20 => "00010110", 21 => "00011000", 22 => "00011010", 23 to 25=> "00000000", 
    26 => "00011100", 27 => "00011110", 28 => "00100000", 29 => "00100010", 
    30 to 31=> "00000000", 32 => "00100100", 33 => "00100110", 34 to 35=> "00000000", 
    36 => "00101000", 37 => "00101010", 38 to 39=> "00000000", 40 => "00101100", 
    41 to 42=> "00000000", 43 => "00101110", 44 to 45=> "00000000", 46 => "00110000", 
    47 => "00000000", 48 => "00110010", 49 => "00110100", 50 => "00000000", 
    51 => "00110110", 52 => "00111000", 53 to 55=> "00000000", 56 => "00111010", 
    57 => "00000000", 58 => "00111100", 59 => "00111110", 60 => "00000000", 
    61 => "01000000", 62 => "01000010", 63 => "01000100", 64 => "01000110", 
    65 to 66=> "00000000", 67 => "01001000", 68 => "01001010", 69 => "01001100", 
    70 => "01001110", 71 to 74=> "00000000", 75 => "01010000", 76 => "00000000", 
    77 => "01010010", 78 => "01010100", 79 => "01010110", 80 => "01011000", 
    81 => "01011010", 82 => "00000000", 83 => "01011100", 84 => "01011110", 
    85 => "01100000", 86 => "00000000", 87 => "01100010", 88 => "01100100", 
    89 to 90=> "00000000", 91 => "01100110", 92 to 93=> "00000000", 94 => "01101000", 
    95 to 96=> "00000000", 97 => "01101010", 98 to 101=> "00000000", 102 => "01101100", 
    103 => "01101110", 104 => "01110000", 105 to 106=> "00000000", 107 => "01110010", 
    108 to 110=> "00000000", 111 => "01110100", 112 => "01110110", 113 to 114=> "00000000", 
    115 => "01111000", 116 to 117=> "00000000", 118 => "01111010", 119 => "01111100", 
    120 => "00000000", 121 => "01111110", 122 to 123=> "00000000", 124 => "10000000", 
    125 => "10000010", 126 => "10000100", 127 => "10000110", 128 to 131=> "00000000", 
    132 => "10001000", 133 to 135=> "00000000", 136 => "10001010", 137 => "10001100", 
    138 => "10001110", 139 => "10010000", 140 => "00000000", 141 => "10010010", 
    142 => "10010100", 143 => "00000000", 144 => "10010110", 145 => "10011000", 
    146 => "10011010", 147 => "00000000", 148 => "10011100", 149 => "10011110", 
    150 => "10100000", 151 to 153=> "00000000", 154 => "10100010", 155 => "10100100", 
    156 => "10100110", 157 => "00000000", 158 => "10101000", 159 to 162=> "00000000", 
    163 => "10101010", 164 => "00000000", 165 => "10101100", 166 to 169=> "00000000", 
    170 => "10101110", 171 => "10110000", 172 => "10110010", 173 => "10110100", 
    174 to 175=> "00000000", 176 => "10110110", 177 => "10111000", 178 to 181=> "00000000", 
    182 => "10111010", 183 to 194=> "00000000" );


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

entity predict_ensemble_d2M is
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

architecture arch of predict_ensemble_d2M is
    component predict_ensemble_d2M_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d2M_rom_U :  component predict_ensemble_d2M_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


