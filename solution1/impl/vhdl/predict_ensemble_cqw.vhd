-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cqw_rom is 
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


architecture rtl of predict_ensemble_cqw_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00000000", 6 => "00001000", 7 => "00001010", 
    8 => "00000000", 9 => "00001100", 10 => "00001110", 11 to 12=> "00000000", 
    13 => "00010000", 14 => "00010010", 15 => "00000000", 16 => "00010100", 
    17 => "00010110", 18 to 20=> "00000000", 21 => "00011000", 22 => "00011010", 
    23 => "00011100", 24 to 26=> "00000000", 27 => "00011110", 28 => "00100000", 
    29 to 30=> "00000000", 31 => "00100010", 32 => "00100100", 33 => "00000000", 
    34 => "00100110", 35 => "00000000", 36 => "00101000", 37 => "00101010", 
    38 => "00000000", 39 => "00101100", 40 => "00101110", 41 => "00110000", 
    42 to 43=> "00000000", 44 => "00110010", 45 to 46=> "00000000", 47 => "00110100", 
    48 to 49=> "00000000", 50 => "00110110", 51 => "00111000", 52 => "00111010", 
    53 => "00000000", 54 => "00111100", 55 => "00111110", 56 => "00000000", 
    57 => "01000000", 58 => "01000010", 59 => "01000100", 60 => "01000110", 
    61 to 63=> "00000000", 64 => "01001000", 65 => "00000000", 66 => "01001010", 
    67 to 68=> "00000000", 69 => "01001100", 70 to 73=> "00000000", 74 => "01001110", 
    75 => "01010000", 76 => "01010010", 77 => "01010100", 78 => "00000000", 
    79 => "01010110", 80 to 81=> "00000000", 82 => "01011000", 83 => "01011010", 
    84 => "00000000", 85 => "01011100", 86 to 88=> "00000000", 89 => "01011110", 
    90 => "00000000", 91 => "01100000", 92 => "00000000", 93 => "01100010", 
    94 => "01100100", 95 => "01100110", 96 => "01101000", 97 => "01101010", 
    98 to 103=> "00000000", 104 => "01101100", 105 to 107=> "00000000", 108 => "01101110", 
    109 => "01110000", 110 => "01110010", 111 to 113=> "00000000", 114 => "01110100", 
    115 => "00000000", 116 => "01110110", 117 => "00000000", 118 => "01111000", 
    119 => "01111010", 120 => "01111100", 121 => "01111110", 122 => "00000000", 
    123 => "10000000", 124 => "00000000", 125 => "10000010", 126 => "10000100", 
    127 => "00000000", 128 => "10000110", 129 => "10001000", 130 => "00000000", 
    131 => "10001010", 132 to 133=> "00000000", 134 => "10001100", 135 to 136=> "00000000", 
    137 => "10001110", 138 => "10010000", 139 to 140=> "00000000", 141 => "10010010", 
    142 => "10010100", 143 => "10010110", 144 => "00000000", 145 => "10011000", 
    146 => "10011010", 147 => "10011100", 148 to 149=> "00000000", 150 => "10011110", 
    151 => "10100000", 152 => "10100010", 153 to 154=> "00000000", 155 => "10100100", 
    156 => "10100110", 157 => "00000000", 158 => "10101000", 159 => "10101010", 
    160 => "10101100", 161 to 162=> "00000000", 163 => "10101110", 164 => "00000000", 
    165 => "10110000", 166 to 167=> "00000000", 168 => "10110010", 169 to 172=> "00000000", 
    173 => "10110100", 174 => "10110110", 175 => "00000000", 176 => "10111000", 
    177 => "00000000", 178 => "10111010", 179 => "10111100", 180 to 183=> "00000000", 
    184 => "10111110", 185 to 194=> "00000000" );


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

entity predict_ensemble_cqw is
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

architecture arch of predict_ensemble_cqw is
    component predict_ensemble_cqw_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cqw_rom_U :  component predict_ensemble_cqw_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


