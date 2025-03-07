-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eVV_rom is 
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


architecture rtl of predict_ensemble_eVV_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 => "00000000", 11 => "00010000", 
    12 => "00000000", 13 => "00010010", 14 => "00000000", 15 => "00010100", 
    16 => "00000000", 17 => "00010110", 18 => "00011000", 19 to 23=> "00000000", 
    24 => "00011010", 25 => "00000000", 26 => "00011100", 27 => "00000000", 
    28 => "00011110", 29 => "00100000", 30 to 31=> "00000000", 32 => "00100010", 
    33 => "00100100", 34 => "00100110", 35 => "00101000", 36 => "00101010", 
    37 => "00101100", 38 => "00101110", 39 => "00110000", 40 => "00000000", 
    41 => "00110010", 42 to 46=> "00000000", 47 => "00110100", 48 to 50=> "00000000", 
    51 => "00110110", 52 => "00111000", 53 => "00111010", 54 to 57=> "00000000", 
    58 => "00111100", 59 => "00000000", 60 => "00111110", 61 => "01000000", 
    62 => "01000010", 63 to 65=> "00000000", 66 => "01000100", 67 => "01000110", 
    68 => "01001000", 69 => "00000000", 70 => "01001010", 71 => "00000000", 
    72 => "01001100", 73 => "01001110", 74 => "01010000", 75 => "00000000", 
    76 => "01010010", 77 => "01010100", 78 => "01010110", 79 to 81=> "00000000", 
    82 => "01011000", 83 => "01011010", 84 to 86=> "00000000", 87 => "01011100", 
    88 => "00000000", 89 => "01011110", 90 => "01100000", 91 => "00000000", 
    92 => "01100010", 93 => "00000000", 94 => "01100100", 95 => "01100110", 
    96 to 97=> "00000000", 98 => "01101000", 99 => "00000000", 100 => "01101010", 
    101 => "01101100", 102 to 103=> "00000000", 104 => "01101110", 105 => "00000000", 
    106 => "01110000", 107 => "01110010", 108 to 109=> "00000000", 110 => "01110100", 
    111 => "01110110", 112 => "01111000", 113 to 115=> "00000000", 116 => "01111010", 
    117 => "01111100", 118 => "01111110", 119 => "10000000", 120 => "10000010", 
    121 => "10000100", 122 to 123=> "00000000", 124 => "10000110", 125 to 129=> "00000000", 
    130 => "10001000", 131 => "10001010", 132 to 135=> "00000000", 136 => "10001100", 
    137 => "00000000", 138 => "10001110", 139 => "10010000", 140 => "10010010", 
    141 => "10010100", 142 => "00000000", 143 => "10010110", 144 to 146=> "00000000", 
    147 => "10011000", 148 => "10011010", 149 => "00000000", 150 => "10011100", 
    151 to 152=> "00000000", 153 => "10011110", 154 => "10100000", 155 => "10100010", 
    156 => "00000000", 157 => "10100100", 158 => "10100110", 159 to 162=> "00000000", 
    163 => "10101000", 164 => "10101010", 165 => "10101100", 166 => "00000000", 
    167 => "10101110", 168 to 170=> "00000000", 171 => "10110000", 172 => "10110010", 
    173 to 194=> "00000000" );


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

entity predict_ensemble_eVV is
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

architecture arch of predict_ensemble_eVV is
    component predict_ensemble_eVV_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eVV_rom_U :  component predict_ensemble_eVV_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


