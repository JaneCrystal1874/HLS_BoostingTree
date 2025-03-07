-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eGT_rom is 
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


architecture rtl of predict_ensemble_eGT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00001100", 
    9 => "00001110", 10 => "00000000", 11 => "00010000", 12 to 13=> "00000000", 
    14 => "00010010", 15 => "00010100", 16 => "00000000", 17 => "00010110", 
    18 => "00011000", 19 => "00011010", 20 => "00011100", 21 => "00011110", 
    22 => "00000000", 23 => "00100000", 24 => "00100010", 25 => "00000000", 
    26 => "00100100", 27 => "00100110", 28 => "00101000", 29 => "00101010", 
    30 => "00000000", 31 => "00101100", 32 => "00101110", 33 => "00110000", 
    34 => "00110010", 35 => "00110100", 36 => "00000000", 37 => "00110110", 
    38 => "00111000", 39 => "00111010", 40 => "00111100", 41 => "00111110", 
    42 => "00000000", 43 => "01000000", 44 to 46=> "00000000", 47 => "01000010", 
    48 => "00000000", 49 => "01000100", 50 => "00000000", 51 => "01000110", 
    52 => "01001000", 53 to 57=> "00000000", 58 => "01001010", 59 => "00000000", 
    60 => "01001100", 61 to 69=> "00000000", 70 => "01001110", 71 => "01010000", 
    72 => "01010010", 73 => "01010100", 74 to 75=> "00000000", 76 => "01010110", 
    77 => "01011000", 78 => "01011010", 79 to 81=> "00000000", 82 => "01011100", 
    83 => "01011110", 84 => "01100000", 85 => "00000000", 86 => "01100010", 
    87 to 89=> "00000000", 90 => "01100100", 91 to 92=> "00000000", 93 => "01100110", 
    94 => "00000000", 95 => "01101000", 96 => "01101010", 97 => "01101100", 
    98 => "01101110", 99 to 100=> "00000000", 101 => "01110000", 102 => "01110010", 
    103 => "00000000", 104 => "01110100", 105 => "00000000", 106 => "01110110", 
    107 to 109=> "00000000", 110 => "01111000", 111 => "01111010", 112 => "00000000", 
    113 => "01111100", 114 to 116=> "00000000", 117 => "01111110", 118 => "10000000", 
    119 => "10000010", 120 => "10000100", 121 => "10000110", 122 => "10001000", 
    123 => "10001010", 124 to 126=> "00000000", 127 => "10001100", 128 => "10001110", 
    129 => "10010000", 130 => "00000000", 131 => "10010010", 132 => "00000000", 
    133 => "10010100", 134 => "10010110", 135 => "10011000", 136 to 137=> "00000000", 
    138 => "10011010", 139 to 141=> "00000000", 142 => "10011100", 143 => "00000000", 
    144 => "10011110", 145 => "00000000", 146 => "10100000", 147 to 149=> "00000000", 
    150 => "10100010", 151 to 153=> "00000000", 154 => "10100100", 155 => "00000000", 
    156 => "10100110", 157 => "10101000", 158 => "00000000", 159 => "10101010", 
    160 => "00000000", 161 => "10101100", 162 => "10101110", 163 => "00000000", 
    164 => "10110000", 165 to 170=> "00000000", 171 => "10110010", 172 => "00000000", 
    173 => "10110100", 174 => "00000000", 175 => "10110110", 176 to 177=> "00000000", 
    178 => "10111000", 179 => "10111010", 180 to 194=> "00000000" );


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

entity predict_ensemble_eGT is
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

architecture arch of predict_ensemble_eGT is
    component predict_ensemble_eGT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eGT_rom_U :  component predict_ensemble_eGT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


