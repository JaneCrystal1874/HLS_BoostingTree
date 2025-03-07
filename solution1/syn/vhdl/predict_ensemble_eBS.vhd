-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eBS_rom is 
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


architecture rtl of predict_ensemble_eBS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 => "00000000", 11 => "00010000", 
    12 => "00010010", 13 => "00000000", 14 => "00010100", 15 => "00000000", 
    16 => "00010110", 17 => "00011000", 18 => "00000000", 19 => "00011010", 
    20 to 21=> "00000000", 22 => "00011100", 23 to 24=> "00000000", 25 => "00011110", 
    26 => "00100000", 27 => "00100010", 28 => "00000000", 29 => "00100100", 
    30 => "00000000", 31 => "00100110", 32 => "00101000", 33 => "00000000", 
    34 => "00101010", 35 to 39=> "00000000", 40 => "00101100", 41 => "00000000", 
    42 => "00101110", 43 to 45=> "00000000", 46 => "00110000", 47 => "00000000", 
    48 => "00110010", 49 => "00110100", 50 => "00110110", 51 => "00111000", 
    52 to 53=> "00000000", 54 => "00111010", 55 => "00111100", 56 to 57=> "00000000", 
    58 => "00111110", 59 to 60=> "00000000", 61 => "01000000", 62 => "01000010", 
    63 => "01000100", 64 to 65=> "00000000", 66 => "01000110", 67 => "01001000", 
    68 to 70=> "00000000", 71 => "01001010", 72 => "00000000", 73 => "01001100", 
    74 => "01001110", 75 to 77=> "00000000", 78 => "01010000", 79 => "01010010", 
    80 => "01010100", 81 => "01010110", 82 => "01011000", 83 => "01011010", 
    84 => "01011100", 85 => "01011110", 86 => "00000000", 87 => "01100000", 
    88 => "00000000", 89 => "01100010", 90 => "00000000", 91 => "01100100", 
    92 to 94=> "00000000", 95 => "01100110", 96 to 98=> "00000000", 99 => "01101000", 
    100 => "00000000", 101 => "01101010", 102 to 103=> "00000000", 104 => "01101100", 
    105 to 106=> "00000000", 107 => "01101110", 108 => "01110000", 109 => "01110010", 
    110 => "00000000", 111 => "01110100", 112 to 113=> "00000000", 114 => "01110110", 
    115 => "01111000", 116 => "01111010", 117 => "00000000", 118 => "01111100", 
    119 => "01111110", 120 to 122=> "00000000", 123 => "10000000", 124 => "10000010", 
    125 to 128=> "00000000", 129 => "10000100", 130 => "00000000", 131 => "10000110", 
    132 to 133=> "00000000", 134 => "10001000", 135 => "10001010", 136 => "10001100", 
    137 => "00000000", 138 => "10001110", 139 => "10010000", 140 => "10010010", 
    141 => "00000000", 142 => "10010100", 143 to 145=> "00000000", 146 => "10010110", 
    147 => "10011000", 148 => "10011010", 149 => "10011100", 150 to 152=> "00000000", 
    153 => "10011110", 154 => "00000000", 155 => "10100000", 156 => "00000000", 
    157 => "10100010", 158 to 161=> "00000000", 162 => "10100100", 163 to 194=> "00000000" );


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

entity predict_ensemble_eBS is
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

architecture arch of predict_ensemble_eBS is
    component predict_ensemble_eBS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eBS_rom_U :  component predict_ensemble_eBS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


