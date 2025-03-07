-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b6t_rom is 
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


architecture rtl of predict_ensemble_b6t_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00000000", 6 => "00001000", 7 => "00000000", 
    8 => "00001010", 9 => "00001100", 10 => "00001110", 11 => "00000000", 
    12 => "00010000", 13 => "00010010", 14 to 16=> "00000000", 17 => "00010100", 
    18 => "00000000", 19 => "00010110", 20 => "00000000", 21 => "00011000", 
    22 => "00000000", 23 => "00011010", 24 => "00000000", 25 => "00011100", 
    26 => "00011110", 27 to 29=> "00000000", 30 => "00100000", 31 => "00100010", 
    32 => "00000000", 33 => "00100100", 34 => "00000000", 35 => "00100110", 
    36 => "00101000", 37 => "00000000", 38 => "00101010", 39 => "00000000", 
    40 => "00101100", 41 to 42=> "00000000", 43 => "00101110", 44 => "00000000", 
    45 => "00110000", 46 to 47=> "00000000", 48 => "00110010", 49 => "00110100", 
    50 => "00000000", 51 => "00110110", 52 => "00111000", 53 => "00000000", 
    54 => "00111010", 55 => "00111100", 56 => "00111110", 57 => "01000000", 
    58 => "00000000", 59 => "01000010", 60 => "00000000", 61 => "01000100", 
    62 => "00000000", 63 => "01000110", 64 => "01001000", 65 => "01001010", 
    66 => "00000000", 67 => "01001100", 68 to 72=> "00000000", 73 => "01001110", 
    74 to 75=> "00000000", 76 => "01010000", 77 => "01010010", 78 => "01010100", 
    79 to 80=> "00000000", 81 => "01010110", 82 => "01011000", 83 => "01011010", 
    84 => "00000000", 85 => "01011100", 86 => "00000000", 87 => "01011110", 
    88 => "01100000", 89 to 91=> "00000000", 92 => "01100010", 93 => "01100100", 
    94 => "00000000", 95 => "01100110", 96 => "01101000", 97 to 98=> "00000000", 
    99 => "01101010", 100 => "01101100", 101 => "00000000", 102 => "01101110", 
    103 => "00000000", 104 => "01110000", 105 => "00000000", 106 => "01110010", 
    107 to 109=> "00000000", 110 => "01110100", 111 => "01110110", 112 to 115=> "00000000", 
    116 => "01111000", 117 => "01111010", 118 to 121=> "00000000", 122 => "01111100", 
    123 => "00000000", 124 => "01111110", 125 => "00000000", 126 => "10000000", 
    127 => "10000010", 128 => "10000100", 129 => "10000110", 130 => "10001000", 
    131 => "10001010", 132 => "10001100", 133 => "00000000", 134 => "10001110", 
    135 => "10010000", 136 to 138=> "00000000", 139 => "10010010", 140 => "10010100", 
    141 => "10010110", 142 to 146=> "00000000", 147 => "10011000", 148 => "10011010", 
    149 to 150=> "00000000", 151 => "10011100", 152 => "10011110", 153 => "10100000", 
    154 => "10100010", 155 to 156=> "00000000", 157 => "10100100", 158 => "10100110", 
    159 to 162=> "00000000", 163 => "10101000", 164 to 165=> "00000000", 166 => "10101010", 
    167 => "00000000", 168 => "10101100", 169 => "10101110", 170 => "10110000", 
    171 => "10110010", 172 to 173=> "00000000", 174 => "10110100", 175 to 194=> "00000000" );


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

entity predict_ensemble_b6t is
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

architecture arch of predict_ensemble_b6t is
    component predict_ensemble_b6t_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b6t_rom_U :  component predict_ensemble_b6t_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


