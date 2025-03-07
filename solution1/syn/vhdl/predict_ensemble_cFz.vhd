-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cFz_rom is 
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


architecture rtl of predict_ensemble_cFz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00000000", 
    8 => "00001100", 9 => "00000000", 10 => "00001110", 11 => "00010000", 
    12 => "00010010", 13 => "00000000", 14 => "00010100", 15 => "00010110", 
    16 to 19=> "00000000", 20 => "00011000", 21 => "00011010", 22 => "00011100", 
    23 to 24=> "00000000", 25 => "00011110", 26 to 27=> "00000000", 28 => "00100000", 
    29 to 31=> "00000000", 32 => "00100010", 33 => "00100100", 34 => "00000000", 
    35 => "00100110", 36 => "00000000", 37 => "00101000", 38 => "00101010", 
    39 => "00000000", 40 => "00101100", 41 to 43=> "00000000", 44 => "00101110", 
    45 => "00110000", 46 => "00110010", 47 => "00110100", 48 to 49=> "00000000", 
    50 => "00110110", 51 => "00111000", 52 to 53=> "00000000", 54 => "00111010", 
    55 to 56=> "00000000", 57 => "00111100", 58 => "00111110", 59 => "01000000", 
    60 => "01000010", 61 to 65=> "00000000", 66 => "01000100", 67 => "01000110", 
    68 => "00000000", 69 => "01001000", 70 => "00000000", 71 => "01001010", 
    72 => "00000000", 73 => "01001100", 74 to 75=> "00000000", 76 => "01001110", 
    77 => "00000000", 78 => "01010000", 79 => "00000000", 80 => "01010010", 
    81 => "01010100", 82 => "01010110", 83 => "01011000", 84 => "00000000", 
    85 => "01011010", 86 => "01011100", 87 => "01011110", 88 => "00000000", 
    89 => "01100000", 90 => "01100010", 91 => "00000000", 92 => "01100100", 
    93 => "00000000", 94 => "01100110", 95 => "01101000", 96 to 99=> "00000000", 
    100 => "01101010", 101 => "00000000", 102 => "01101100", 103 to 104=> "00000000", 
    105 => "01101110", 106 to 107=> "00000000", 108 => "01110000", 109 => "01110010", 
    110 to 113=> "00000000", 114 => "01110100", 115 => "00000000", 116 => "01110110", 
    117 => "01111000", 118 => "01111010", 119 => "01111100", 120 => "01111110", 
    121 to 125=> "00000000", 126 => "10000000", 127 => "10000010", 128 => "00000000", 
    129 => "10000100", 130 => "10000110", 131 => "10001000", 132 => "10001010", 
    133 to 137=> "00000000", 138 => "10001100", 139 => "10001110", 140 => "10010000", 
    141 => "10010010", 142 => "10010100", 143 => "10010110", 144 => "10011000", 
    145 to 150=> "00000000", 151 => "10011010", 152 => "10011100", 153 => "10011110", 
    154 => "10100000", 155 => "00000000", 156 => "10100010", 157 => "00000000", 
    158 => "10100100", 159 to 161=> "00000000", 162 => "10100110", 163 to 165=> "00000000", 
    166 => "10101000", 167 => "10101010", 168 => "10101100", 169 => "10101110", 
    170 => "10110000", 171 to 174=> "00000000", 175 => "10110010", 176 to 177=> "00000000", 
    178 => "10110100", 179 => "10110110", 180 to 194=> "00000000" );


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

entity predict_ensemble_cFz is
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

architecture arch of predict_ensemble_cFz is
    component predict_ensemble_cFz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cFz_rom_U :  component predict_ensemble_cFz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


