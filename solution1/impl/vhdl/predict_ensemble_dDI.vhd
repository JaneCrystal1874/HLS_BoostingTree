-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dDI_rom is 
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


architecture rtl of predict_ensemble_dDI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00000000", 5 => "00001000", 6 => "00000000", 7 => "00001010", 
    8 => "00000000", 9 => "00001100", 10 to 11=> "00000000", 12 => "00001110", 
    13 => "00000000", 14 => "00010000", 15 => "00000000", 16 => "00010010", 
    17 => "00000000", 18 => "00010100", 19 => "00010110", 20 => "00000000", 
    21 => "00011000", 22 => "00011010", 23 => "00011100", 24 => "00000000", 
    25 => "00011110", 26 => "00100000", 27 => "00100010", 28 => "00000000", 
    29 => "00100100", 30 => "00000000", 31 => "00100110", 32 => "00101000", 
    33 to 37=> "00000000", 38 => "00101010", 39 => "00000000", 40 => "00101100", 
    41 => "00000000", 42 => "00101110", 43 => "00000000", 44 => "00110000", 
    45 => "00000000", 46 => "00110010", 47 => "00110100", 48 => "00110110", 
    49 => "00111000", 50 => "00000000", 51 => "00111010", 52 to 53=> "00000000", 
    54 => "00111100", 55 => "00000000", 56 => "00111110", 57 => "01000000", 
    58 => "01000010", 59 => "00000000", 60 => "01000100", 61 => "00000000", 
    62 => "01000110", 63 => "01001000", 64 to 66=> "00000000", 67 => "01001010", 
    68 => "01001100", 69 => "00000000", 70 => "01001110", 71 => "00000000", 
    72 => "01010000", 73 => "01010010", 74 to 76=> "00000000", 77 => "01010100", 
    78 => "00000000", 79 => "01010110", 80 => "01011000", 81 => "01011010", 
    82 => "01011100", 83 => "00000000", 84 => "01011110", 85 => "01100000", 
    86 => "01100010", 87 to 90=> "00000000", 91 => "01100100", 92 => "00000000", 
    93 => "01100110", 94 to 95=> "00000000", 96 => "01101000", 97 to 99=> "00000000", 
    100 => "01101010", 101 to 102=> "00000000", 103 => "01101100", 104 => "00000000", 
    105 => "01101110", 106 => "00000000", 107 => "01110000", 108 => "00000000", 
    109 => "01110010", 110 => "00000000", 111 => "01110100", 112 => "00000000", 
    113 => "01110110", 114 => "00000000", 115 => "01111000", 116 => "01111010", 
    117 => "01111100", 118 to 122=> "00000000", 123 => "01111110", 124 => "10000000", 
    125 => "10000010", 126 => "00000000", 127 => "10000100", 128 => "00000000", 
    129 => "10000110", 130 to 132=> "00000000", 133 => "10001000", 134 => "00000000", 
    135 => "10001010", 136 => "00000000", 137 => "10001100", 138 => "00000000", 
    139 => "10001110", 140 => "10010000", 141 => "10010010", 142 to 144=> "00000000", 
    145 => "10010100", 146 => "10010110", 147 => "10011000", 148 => "00000000", 
    149 => "10011010", 150 => "10011100", 151 to 152=> "00000000", 153 => "10011110", 
    154 => "10100000", 155 => "00000000", 156 => "10100010", 157 => "10100100", 
    158 => "00000000", 159 => "10100110", 160 to 162=> "00000000", 163 => "10101000", 
    164 => "10101010", 165 to 166=> "00000000", 167 => "10101100", 168 to 170=> "00000000", 
    171 => "10101110", 172 => "10110000", 173 => "00000000", 174 => "10110010", 
    175 to 194=> "00000000" );


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

entity predict_ensemble_dDI is
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

architecture arch of predict_ensemble_dDI is
    component predict_ensemble_dDI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dDI_rom_U :  component predict_ensemble_dDI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


