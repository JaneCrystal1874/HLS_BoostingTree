-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dyH_rom is 
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


architecture rtl of predict_ensemble_dyH_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 to 5=> "00000000", 6 => "00001000", 7 => "00001010", 8 => "00001100", 
    9 => "00000000", 10 => "00001110", 11 => "00010000", 12 => "00010010", 
    13 => "00000000", 14 => "00010100", 15 to 16=> "00000000", 17 => "00010110", 
    18 => "00000000", 19 => "00011000", 20 => "00011010", 21 => "00000000", 
    22 => "00011100", 23 to 25=> "00000000", 26 => "00011110", 27 => "00100000", 
    28 => "00100010", 29 => "00000000", 30 => "00100100", 31 => "00000000", 
    32 => "00100110", 33 to 34=> "00000000", 35 => "00101000", 36 => "00101010", 
    37 => "00000000", 38 => "00101100", 39 => "00101110", 40 => "00000000", 
    41 => "00110000", 42 to 43=> "00000000", 44 => "00110010", 45 to 46=> "00000000", 
    47 => "00110100", 48 to 49=> "00000000", 50 => "00110110", 51 => "00111000", 
    52 => "00000000", 53 => "00111010", 54 => "00111100", 55 => "00111110", 
    56 to 57=> "00000000", 58 => "01000000", 59 => "00000000", 60 => "01000010", 
    61 => "01000100", 62 => "01000110", 63 to 65=> "00000000", 66 => "01001000", 
    67 => "00000000", 68 => "01001010", 69 => "01001100", 70 => "00000000", 
    71 => "01001110", 72 to 73=> "00000000", 74 => "01010000", 75 => "01010010", 
    76 => "00000000", 77 => "01010100", 78 to 81=> "00000000", 82 => "01010110", 
    83 => "01011000", 84 => "01011010", 85 => "01011100", 86 => "00000000", 
    87 => "01011110", 88 to 90=> "00000000", 91 => "01100000", 92 => "00000000", 
    93 => "01100010", 94 => "01100100", 95 => "01100110", 96 => "01101000", 
    97 to 98=> "00000000", 99 => "01101010", 100 to 103=> "00000000", 104 => "01101100", 
    105 => "01101110", 106 => "01110000", 107 => "01110010", 108 => "00000000", 
    109 => "01110100", 110 to 111=> "00000000", 112 => "01110110", 113 => "01111000", 
    114 => "00000000", 115 => "01111010", 116 => "01111100", 117 to 118=> "00000000", 
    119 => "01111110", 120 to 121=> "00000000", 122 => "10000000", 123 to 124=> "00000000", 
    125 => "10000010", 126 to 128=> "00000000", 129 => "10000100", 130 => "00000000", 
    131 => "10000110", 132 => "10001000", 133 => "10001010", 134 => "00000000", 
    135 => "10001100", 136 => "00000000", 137 => "10001110", 138 => "10010000", 
    139 => "10010010", 140 => "10010100", 141 => "10010110", 142 => "10011000", 
    143 to 144=> "00000000", 145 => "10011010", 146 => "10011100", 147 to 148=> "00000000", 
    149 => "10011110", 150 => "10100000", 151 => "00000000", 152 => "10100010", 
    153 => "10100100", 154 => "10100110", 155 => "00000000", 156 => "10101000", 
    157 => "10101010", 158 => "10101100", 159 to 169=> "00000000", 170 => "10101110", 
    171 => "00000000", 172 => "10110000", 173 => "00000000", 174 => "10110010", 
    175 => "00000000", 176 => "10110100", 177 to 194=> "00000000" );


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

entity predict_ensemble_dyH is
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

architecture arch of predict_ensemble_dyH is
    component predict_ensemble_dyH_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dyH_rom_U :  component predict_ensemble_dyH_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


