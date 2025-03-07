-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_3i2_rom is 
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


architecture rtl of predict_ensemble_3i2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 to 4=> "00000000", 
    5 => "00001000", 6 => "00001010", 7 to 9=> "00000000", 10 => "00001100", 
    11 => "00001110", 12 => "00010000", 13 to 15=> "00000000", 16 => "00010010", 
    17 => "00010100", 18 => "00010110", 19 to 21=> "00000000", 22 => "00011000", 
    23 => "00011010", 24 => "00000000", 25 => "00011100", 26 => "00011110", 
    27 => "00100000", 28 => "00000000", 29 => "00100010", 30 => "00100100", 
    31 => "00100110", 32 => "00101000", 33 to 35=> "00000000", 36 => "00101010", 
    37 => "00101100", 38 => "00101110", 39 to 40=> "00000000", 41 => "00110000", 
    42 => "00110010", 43 => "00000000", 44 => "00110100", 45 => "00110110", 
    46 => "00000000", 47 => "00111000", 48 to 49=> "00000000", 50 => "00111010", 
    51 => "00111100", 52 => "00111110", 53 to 56=> "00000000", 57 => "01000000", 
    58 to 59=> "00000000", 60 => "01000010", 61 => "01000100", 62 => "00000000", 
    63 => "01000110", 64 to 65=> "00000000", 66 => "01001000", 67 => "01001010", 
    68 => "01001100", 69 => "01001110", 70 => "01010000", 71 => "01010010", 
    72 => "00000000", 73 => "01010100", 74 => "01010110", 75 => "00000000", 
    76 => "01011000", 77 => "01011010", 78 to 85=> "00000000", 86 => "01011100", 
    87 => "00000000", 88 => "01011110", 89 => "01100000", 90 => "01100010", 
    91 => "00000000", 92 => "01100100", 93 to 94=> "00000000", 95 => "01100110", 
    96 => "00000000", 97 => "01101000", 98 => "00000000", 99 => "01101010", 
    100 => "01101100", 101 => "00000000", 102 => "01101110", 103 => "00000000", 
    104 => "01110000", 105 => "00000000", 106 => "01110010", 107 => "01110100", 
    108 => "00000000", 109 => "01110110", 110 => "00000000", 111 => "01111000", 
    112 => "01111010", 113 to 118=> "00000000", 119 => "01111100", 120 to 122=> "00000000", 
    123 => "01111110", 124 => "10000000", 125 => "00000000", 126 => "10000010", 
    127 => "00000000", 128 => "10000100", 129 to 131=> "00000000", 132 => "10000110", 
    133 => "10001000", 134 => "10001010", 135 to 136=> "00000000", 137 => "10001100", 
    138 => "10001110", 139 => "10010000", 140 => "10010010", 141 => "10010100", 
    142 => "10010110", 143 => "00000000", 144 => "10011000", 145 => "00000000", 
    146 => "10011010", 147 => "10011100", 148 to 150=> "00000000", 151 => "10011110", 
    152 => "10100000", 153 => "00000000", 154 => "10100010", 155 to 158=> "00000000", 
    159 => "10100100", 160 to 161=> "00000000", 162 => "10100110", 163 => "10101000", 
    164 => "10101010", 165 to 168=> "00000000", 169 => "10101100", 170 => "10101110", 
    171 => "00000000", 172 => "10110000", 173 => "10110010", 174 => "10110100", 
    175 to 176=> "00000000", 177 => "10110110", 178 to 194=> "00000000" );


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

entity predict_ensemble_3i2 is
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

architecture arch of predict_ensemble_3i2 is
    component predict_ensemble_3i2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_3i2_rom_U :  component predict_ensemble_3i2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


