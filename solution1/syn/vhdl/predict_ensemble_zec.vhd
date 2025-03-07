-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_zec_rom is 
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


architecture rtl of predict_ensemble_zec_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 to 3=> "00000000", 4 => "00000110", 
    5 => "00000000", 6 => "00001000", 7 => "00001010", 8 => "00001100", 
    9 => "00001110", 10 => "00010000", 11 => "00000000", 12 => "00010010", 
    13 => "00010100", 14 to 17=> "00000000", 18 => "00010110", 19 to 20=> "00000000", 
    21 => "00011000", 22 => "00011010", 23 => "00011100", 24 => "00000000", 
    25 => "00011110", 26 to 28=> "00000000", 29 => "00100000", 30 => "00000000", 
    31 => "00100010", 32 => "00100100", 33 => "00100110", 34 => "00101000", 
    35 => "00000000", 36 => "00101010", 37 => "00101100", 38 => "00000000", 
    39 => "00101110", 40 => "00110000", 41 to 46=> "00000000", 47 => "00110010", 
    48 => "00110100", 49 => "00000000", 50 => "00110110", 51 => "00111000", 
    52 => "00000000", 53 => "00111010", 54 => "00111100", 55 => "00111110", 
    56 => "00000000", 57 => "01000000", 58 to 60=> "00000000", 61 => "01000010", 
    62 => "01000100", 63 => "00000000", 64 => "01000110", 65 => "01001000", 
    66 => "01001010", 67 => "01001100", 68 => "00000000", 69 => "01001110", 
    70 => "01010000", 71 to 72=> "00000000", 73 => "01010010", 74 => "00000000", 
    75 => "01010100", 76 => "01010110", 77 to 78=> "00000000", 79 => "01011000", 
    80 => "00000000", 81 => "01011010", 82 => "01011100", 83 => "00000000", 
    84 => "01011110", 85 => "01100000", 86 to 93=> "00000000", 94 => "01100010", 
    95 => "01100100", 96 => "01100110", 97 to 98=> "00000000", 99 => "01101000", 
    100 => "01101010", 101 => "00000000", 102 => "01101100", 103 => "01101110", 
    104 => "01110000", 105 => "00000000", 106 => "01110010", 107 => "00000000", 
    108 => "01110100", 109 => "01110110", 110 => "00000000", 111 => "01111000", 
    112 => "00000000", 113 => "01111010", 114 to 117=> "00000000", 118 => "01111100", 
    119 to 120=> "00000000", 121 => "01111110", 122 => "10000000", 123 => "10000010", 
    124 => "00000000", 125 => "10000100", 126 => "00000000", 127 => "10000110", 
    128 => "00000000", 129 => "10001000", 130 => "10001010", 131 => "10001100", 
    132 => "10001110", 133 => "00000000", 134 => "10010000", 135 to 137=> "00000000", 
    138 => "10010010", 139 to 140=> "00000000", 141 => "10010100", 142 => "10010110", 
    143 to 144=> "00000000", 145 => "10011000", 146 => "00000000", 147 => "10011010", 
    148 => "00000000", 149 => "10011100", 150 => "10011110", 151 => "10100000", 
    152 => "00000000", 153 => "10100010", 154 => "00000000", 155 => "10100100", 
    156 to 157=> "00000000", 158 => "10100110", 159 => "10101000", 160 => "00000000", 
    161 => "10101010", 162 => "10101100", 163 to 167=> "00000000", 168 => "10101110", 
    169 => "10110000", 170 => "10110010", 171 => "10110100", 172 to 175=> "00000000", 
    176 => "10110110", 177 => "10111000", 178 => "10111010", 179 to 180=> "00000000", 
    181 => "10111100", 182 to 185=> "00000000", 186 => "10111110", 187 to 194=> "00000000" );


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

entity predict_ensemble_zec is
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

architecture arch of predict_ensemble_zec is
    component predict_ensemble_zec_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_zec_rom_U :  component predict_ensemble_zec_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


