-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cZC_rom is 
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


architecture rtl of predict_ensemble_cZC_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 => "00001110", 9 to 11=> "00000000", 12 => "00010000", 13 to 14=> "00000000", 
    15 => "00010010", 16 => "00010100", 17 => "00010110", 18 to 19=> "00000000", 
    20 => "00011000", 21 => "00000000", 22 => "00011010", 23 to 24=> "00000000", 
    25 => "00011100", 26 => "00000000", 27 => "00011110", 28 => "00000000", 
    29 => "00100000", 30 => "00100010", 31 to 33=> "00000000", 34 => "00100100", 
    35 => "00100110", 36 => "00000000", 37 => "00101000", 38 => "00000000", 
    39 => "00101010", 40 => "00101100", 41 => "00000000", 42 => "00101110", 
    43 => "00000000", 44 => "00110000", 45 => "00000000", 46 => "00110010", 
    47 => "00110100", 48 to 49=> "00000000", 50 => "00110110", 51 => "00111000", 
    52 => "00000000", 53 => "00111010", 54 => "00000000", 55 => "00111100", 
    56 => "00111110", 57 => "01000000", 58 to 60=> "00000000", 61 => "01000010", 
    62 => "01000100", 63 => "01000110", 64 => "01001000", 65 to 66=> "00000000", 
    67 => "01001010", 68 to 72=> "00000000", 73 => "01001100", 74 => "00000000", 
    75 => "01001110", 76 => "00000000", 77 => "01010000", 78 => "00000000", 
    79 => "01010010", 80 => "00000000", 81 => "01010100", 82 => "01010110", 
    83 => "01011000", 84 => "01011010", 85 => "00000000", 86 => "01011100", 
    87 => "01011110", 88 => "00000000", 89 => "01100000", 90 => "00000000", 
    91 => "01100010", 92 => "01100100", 93 to 96=> "00000000", 97 => "01100110", 
    98 => "00000000", 99 => "01101000", 100 => "01101010", 101 => "01101100", 
    102 => "00000000", 103 => "01101110", 104 => "00000000", 105 => "01110000", 
    106 to 109=> "00000000", 110 => "01110010", 111 => "00000000", 112 => "01110100", 
    113 => "00000000", 114 => "01110110", 115 => "00000000", 116 => "01111000", 
    117 to 119=> "00000000", 120 => "01111010", 121 => "00000000", 122 => "01111100", 
    123 => "00000000", 124 => "01111110", 125 => "10000000", 126 => "10000010", 
    127 => "00000000", 128 => "10000100", 129 => "10000110", 130 => "10001000", 
    131 => "00000000", 132 => "10001010", 133 => "00000000", 134 => "10001100", 
    135 => "10001110", 136 => "10010000", 137 to 138=> "00000000", 139 => "10010010", 
    140 => "10010100", 141 to 142=> "00000000", 143 => "10010110", 144 => "10011000", 
    145 => "00000000", 146 => "10011010", 147 => "10011100", 148 to 150=> "00000000", 
    151 => "10011110", 152 => "00000000", 153 => "10100000", 154 to 156=> "00000000", 
    157 => "10100010", 158 => "00000000", 159 => "10100100", 160 => "00000000", 
    161 => "10100110", 162 => "10101000", 163 to 164=> "00000000", 165 => "10101010", 
    166 => "00000000", 167 => "10101100", 168 => "10101110", 169 to 172=> "00000000", 
    173 => "10110000", 174 => "10110010", 175 => "10110100", 176 to 178=> "00000000", 
    179 => "10110110", 180 => "10111000", 181 to 183=> "00000000", 184 => "10111010", 
    185 to 194=> "00000000" );


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

entity predict_ensemble_cZC is
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

architecture arch of predict_ensemble_cZC is
    component predict_ensemble_cZC_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cZC_rom_U :  component predict_ensemble_cZC_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


