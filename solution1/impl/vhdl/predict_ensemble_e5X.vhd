-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e5X_rom is 
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


architecture rtl of predict_ensemble_e5X_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 => "00010000", 11 => "00000000", 
    12 => "00010010", 13 => "00010100", 14 => "00000000", 15 => "00010110", 
    16 => "00011000", 17 => "00011010", 18 to 19=> "00000000", 20 => "00011100", 
    21 => "00011110", 22 to 23=> "00000000", 24 => "00100000", 25 => "00100010", 
    26 to 27=> "00000000", 28 => "00100100", 29 to 30=> "00000000", 31 => "00100110", 
    32 to 34=> "00000000", 35 => "00101000", 36 => "00000000", 37 => "00101010", 
    38 => "00000000", 39 => "00101100", 40 => "00000000", 41 => "00101110", 
    42 to 43=> "00000000", 44 => "00110000", 45 => "00000000", 46 => "00110010", 
    47 => "00110100", 48 => "00110110", 49 => "00000000", 50 => "00111000", 
    51 to 55=> "00000000", 56 => "00111010", 57 => "00000000", 58 => "00111100", 
    59 => "00111110", 60 => "00000000", 61 => "01000000", 62 => "01000010", 
    63 => "01000100", 64 to 65=> "00000000", 66 => "01000110", 67 => "01001000", 
    68 => "01001010", 69 => "01001100", 70 => "01001110", 71 => "01010000", 
    72 => "01010010", 73 to 76=> "00000000", 77 => "01010100", 78 => "01010110", 
    79 => "00000000", 80 => "01011000", 81 => "01011010", 82 => "01011100", 
    83 to 84=> "00000000", 85 => "01011110", 86 to 88=> "00000000", 89 => "01100000", 
    90 to 92=> "00000000", 93 => "01100010", 94 to 95=> "00000000", 96 => "01100100", 
    97 => "01100110", 98 => "01101000", 99 => "01101010", 100 => "00000000", 
    101 => "01101100", 102 => "00000000", 103 => "01101110", 104 => "00000000", 
    105 => "01110000", 106 => "01110010", 107 => "01110100", 108 to 112=> "00000000", 
    113 => "01110110", 114 => "00000000", 115 => "01111000", 116 to 118=> "00000000", 
    119 => "01111010", 120 => "01111100", 121 => "01111110", 122 => "00000000", 
    123 => "10000000", 124 to 125=> "00000000", 126 => "10000010", 127 => "10000100", 
    128 => "00000000", 129 => "10000110", 130 => "10001000", 131 => "10001010", 
    132 => "10001100", 133 => "00000000", 134 => "10001110", 135 => "00000000", 
    136 => "10010000", 137 => "00000000", 138 => "10010010", 139 => "00000000", 
    140 => "10010100", 141 to 145=> "00000000", 146 => "10010110", 147 => "10011000", 
    148 => "00000000", 149 => "10011010", 150 => "00000000", 151 => "10011100", 
    152 => "00000000", 153 => "10011110", 154 => "00000000", 155 => "10100000", 
    156 => "10100010", 157 => "10100100", 158 to 162=> "00000000", 163 => "10100110", 
    164 => "10101000", 165 => "10101010", 166 to 168=> "00000000", 169 => "10101100", 
    170 => "00000000", 171 => "10101110", 172 => "10110000", 173 to 194=> "00000000" );


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

entity predict_ensemble_e5X is
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

architecture arch of predict_ensemble_e5X is
    component predict_ensemble_e5X_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e5X_rom_U :  component predict_ensemble_e5X_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


