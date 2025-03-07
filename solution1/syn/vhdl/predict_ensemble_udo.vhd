-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_udo_rom is 
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


architecture rtl of predict_ensemble_udo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00001100", 7 => "00001110", 
    8 to 10=> "00000000", 11 => "00010000", 12 => "00010010", 13 => "00010100", 
    14 => "00000000", 15 => "00010110", 16 => "00011000", 17 to 22=> "00000000", 
    23 => "00011010", 24 => "00011100", 25 => "00011110", 26 => "00100000", 
    27 => "00100010", 28 => "00100100", 29 to 33=> "00000000", 34 => "00100110", 
    35 to 37=> "00000000", 38 => "00101000", 39 => "00101010", 40 => "00101100", 
    41 to 42=> "00000000", 43 => "00101110", 44 => "00110000", 45 => "00110010", 
    46 => "00110100", 47 => "00110110", 48 to 51=> "00000000", 52 => "00111000", 
    53 => "00111010", 54 => "00111100", 55 => "00111110", 56 => "01000000", 
    57 => "01000010", 58 => "01000100", 59 => "01000110", 60 => "01001000", 
    61 => "01001010", 62 => "01001100", 63 to 66=> "00000000", 67 => "01001110", 
    68 => "01010000", 69 => "01010010", 70 => "00000000", 71 => "01010100", 
    72 to 76=> "00000000", 77 => "01010110", 78 => "01011000", 79 => "01011010", 
    80 => "01011100", 81 => "00000000", 82 => "01011110", 83 => "01100000", 
    84 => "01100010", 85 to 86=> "00000000", 87 => "01100100", 88 => "01100110", 
    89 => "01101000", 90 to 94=> "00000000", 95 => "01101010", 96 => "01101100", 
    97 => "01101110", 98 => "01110000", 99 => "00000000", 100 => "01110010", 
    101 to 103=> "00000000", 104 => "01110100", 105 => "00000000", 106 => "01110110", 
    107 to 108=> "00000000", 109 => "01111000", 110 => "01111010", 111 => "01111100", 
    112 => "01111110", 113 => "10000000", 114 to 116=> "00000000", 117 => "10000010", 
    118 => "10000100", 119 => "10000110", 120 => "10001000", 121 => "10001010", 
    122 to 124=> "00000000", 125 => "10001100", 126 => "10001110", 127 to 133=> "00000000", 
    134 => "10010000", 135 to 138=> "00000000", 139 => "10010010", 140 => "00000000", 
    141 => "10010100", 142 => "10010110", 143 to 144=> "00000000", 145 => "10011000", 
    146 to 147=> "00000000", 148 => "10011010", 149 => "10011100", 150 => "10011110", 
    151 => "00000000", 152 => "10100000", 153 => "00000000", 154 => "10100010", 
    155 => "00000000", 156 => "10100100", 157 => "10100110", 158 => "10101000", 
    159 => "10101010", 160 => "10101100", 161 to 163=> "00000000", 164 => "10101110", 
    165 to 166=> "00000000", 167 => "10110000", 168 => "10110010", 169 => "10110100", 
    170 to 173=> "00000000", 174 => "10110110", 175 to 176=> "00000000", 177 => "10111000", 
    178 to 182=> "00000000", 183 => "10111010", 184 to 194=> "00000000" );


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

entity predict_ensemble_udo is
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

architecture arch of predict_ensemble_udo is
    component predict_ensemble_udo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_udo_rom_U :  component predict_ensemble_udo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


