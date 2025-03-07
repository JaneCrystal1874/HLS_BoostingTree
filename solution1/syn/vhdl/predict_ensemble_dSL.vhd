-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dSL_rom is 
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


architecture rtl of predict_ensemble_dSL_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00000000", 
    8 => "00001100", 9 => "00001110", 10 to 11=> "00000000", 12 => "00010000", 
    13 => "00000000", 14 => "00010010", 15 => "00010100", 16 to 17=> "00000000", 
    18 => "00010110", 19 => "00011000", 20 to 21=> "00000000", 22 => "00011010", 
    23 to 25=> "00000000", 26 => "00011100", 27 => "00011110", 28 to 29=> "00000000", 
    30 => "00100000", 31 => "00100010", 32 => "00100100", 33 => "00100110", 
    34 => "00101000", 35 => "00101010", 36 to 37=> "00000000", 38 => "00101100", 
    39 to 40=> "00000000", 41 => "00101110", 42 to 43=> "00000000", 44 => "00110000", 
    45 => "00110010", 46 => "00000000", 47 => "00110100", 48 => "00110110", 
    49 => "00111000", 50 => "00111010", 51 => "00111100", 52 to 53=> "00000000", 
    54 => "00111110", 55 => "01000000", 56 => "00000000", 57 => "01000010", 
    58 => "01000100", 59 to 62=> "00000000", 63 => "01000110", 64 => "01001000", 
    65 to 67=> "00000000", 68 => "01001010", 69 => "01001100", 70 => "01001110", 
    71 => "01010000", 72 => "00000000", 73 => "01010010", 74 => "00000000", 
    75 => "01010100", 76 => "01010110", 77 => "00000000", 78 => "01011000", 
    79 to 80=> "00000000", 81 => "01011010", 82 to 84=> "00000000", 85 => "01011100", 
    86 to 87=> "00000000", 88 => "01011110", 89 => "00000000", 90 => "01100000", 
    91 to 93=> "00000000", 94 => "01100010", 95 => "00000000", 96 => "01100100", 
    97 to 98=> "00000000", 99 => "01100110", 100 => "01101000", 101 => "01101010", 
    102 => "00000000", 103 => "01101100", 104 => "01101110", 105 to 106=> "00000000", 
    107 => "01110000", 108 to 109=> "00000000", 110 => "01110010", 111 => "01110100", 
    112 to 114=> "00000000", 115 => "01110110", 116 => "00000000", 117 => "01111000", 
    118 => "00000000", 119 => "01111010", 120 => "01111100", 121 => "00000000", 
    122 => "01111110", 123 => "10000000", 124 => "10000010", 125 => "00000000", 
    126 => "10000100", 127 to 128=> "00000000", 129 => "10000110", 130 to 131=> "00000000", 
    132 => "10001000", 133 => "10001010", 134 => "10001100", 135 => "10001110", 
    136 => "00000000", 137 => "10010000", 138 to 142=> "00000000", 143 => "10010010", 
    144 => "00000000", 145 => "10010100", 146 => "00000000", 147 => "10010110", 
    148 to 149=> "00000000", 150 => "10011000", 151 => "10011010", 152 to 153=> "00000000", 
    154 => "10011100", 155 => "00000000", 156 => "10011110", 157 => "10100000", 
    158 => "10100010", 159 => "10100100", 160 to 162=> "00000000", 163 => "10100110", 
    164 => "10101000", 165 => "10101010", 166 => "10101100", 167 => "00000000", 
    168 => "10101110", 169 => "10110000", 170 to 171=> "00000000", 172 => "10110010", 
    173 to 176=> "00000000", 177 => "10110100", 178 to 194=> "00000000" );


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

entity predict_ensemble_dSL is
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

architecture arch of predict_ensemble_dSL is
    component predict_ensemble_dSL_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dSL_rom_U :  component predict_ensemble_dSL_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


