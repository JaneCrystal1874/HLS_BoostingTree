-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cKz_rom is 
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


architecture rtl of predict_ensemble_cKz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 7=> "00000000", 8 => "00001010", 9 => "00000000", 
    10 => "00001100", 11 => "00000000", 12 => "00001110", 13 => "00010000", 
    14 => "00010010", 15 => "00010100", 16 => "00010110", 17 to 18=> "00000000", 
    19 => "00011000", 20 => "00011010", 21 to 22=> "00000000", 23 => "00011100", 
    24 to 26=> "00000000", 27 => "00011110", 28 to 29=> "00000000", 30 => "00100000", 
    31 => "00100010", 32 => "00100100", 33 => "00100110", 34 => "00101000", 
    35 => "00101010", 36 to 38=> "00000000", 39 => "00101100", 40 => "00101110", 
    41 => "00000000", 42 => "00110000", 43 => "00110010", 44 => "00000000", 
    45 => "00110100", 46 => "00110110", 47 => "00000000", 48 => "00111000", 
    49 => "00111010", 50 to 51=> "00000000", 52 => "00111100", 53 => "00000000", 
    54 => "00111110", 55 to 61=> "00000000", 62 => "01000000", 63 => "01000010", 
    64 => "00000000", 65 => "01000100", 66 to 67=> "00000000", 68 => "01000110", 
    69 => "01001000", 70 => "01001010", 71 => "00000000", 72 => "01001100", 
    73 => "01001110", 74 => "01010000", 75 => "01010010", 76 => "01010100", 
    77 => "01010110", 78 to 79=> "00000000", 80 => "01011000", 81 => "01011010", 
    82 to 86=> "00000000", 87 => "01011100", 88 => "01011110", 89 => "00000000", 
    90 => "01100000", 91 => "01100010", 92 => "00000000", 93 => "01100100", 
    94 to 96=> "00000000", 97 => "01100110", 98 => "00000000", 99 => "01101000", 
    100 to 103=> "00000000", 104 => "01101010", 105 => "01101100", 106 => "01101110", 
    107 => "01110000", 108 => "01110010", 109 => "01110100", 110 to 112=> "00000000", 
    113 => "01110110", 114 => "01111000", 115 => "01111010", 116 => "00000000", 
    117 => "01111100", 118 => "00000000", 119 => "01111110", 120 to 121=> "00000000", 
    122 => "10000000", 123 to 125=> "00000000", 126 => "10000010", 127 => "10000100", 
    128 => "10000110", 129 to 131=> "00000000", 132 => "10001000", 133 to 134=> "00000000", 
    135 => "10001010", 136 => "10001100", 137 => "10001110", 138 => "10010000", 
    139 to 142=> "00000000", 143 => "10010010", 144 => "00000000", 145 => "10010100", 
    146 => "10010110", 147 => "00000000", 148 => "10011000", 149 => "10011010", 
    150 => "00000000", 151 => "10011100", 152 => "10011110", 153 to 157=> "00000000", 
    158 => "10100000", 159 => "10100010", 160 => "10100100", 161 => "10100110", 
    162 => "00000000", 163 => "10101000", 164 => "10101010", 165 to 166=> "00000000", 
    167 => "10101100", 168 to 170=> "00000000", 171 => "10101110", 172 => "10110000", 
    173 => "10110010", 174 => "10110100", 175 to 176=> "00000000", 177 => "10110110", 
    178 to 181=> "00000000", 182 => "10111000", 183 => "10111010", 184 to 194=> "00000000" );


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

entity predict_ensemble_cKz is
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

architecture arch of predict_ensemble_cKz is
    component predict_ensemble_cKz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cKz_rom_U :  component predict_ensemble_cKz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


