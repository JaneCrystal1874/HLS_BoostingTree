-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_civ_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_civ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "0111", 2 => "0011", 3 => "0000", 4 => "0111", 
    5 to 7=> "0000", 8 => "1000", 9 => "1011", 10 to 11=> "0000", 12 => "1011", 
    13 => "0000", 14 to 15=> "0101", 16 => "0000", 17 => "0001", 18 => "0000", 
    19 => "0101", 20 => "0110", 21 => "0000", 22 => "0101", 23 => "0000", 
    24 => "1010", 25 => "0001", 26 => "0011", 27 => "1000", 28 to 30=> "0000", 
    31 => "0110", 32 => "0010", 33 => "1010", 34 => "1100", 35 => "0011", 
    36 => "1100", 37 => "0100", 38 => "0000", 39 => "1011", 40 to 41=> "0000", 
    42 => "1000", 43 => "0000", 44 => "1010", 45 to 46=> "0000", 47 => "0101", 
    48 to 49=> "0000", 50 => "1010", 51 => "0000", 52 => "0111", 53 to 54=> "0000", 
    55 => "1101", 56 => "0101", 57 => "0100", 58 => "1100", 59 => "1001", 
    60 => "0101", 61 => "0000", 62 => "0100", 63 to 64=> "0000", 65 => "0110", 
    66 to 68=> "0000", 69 => "1001", 70 to 72=> "0000", 73 => "1101", 74 => "1100", 
    75 => "1011", 76 to 77=> "0000", 78 => "0101", 79 to 82=> "0000", 83 => "1011", 
    84 => "0000", 85 => "0111", 86 => "1011", 87 => "0110", 88 to 92=> "0000", 
    93 => "0111", 94 => "0011", 95 => "0100", 96 to 97=> "0000", 98 => "0011", 
    99 => "0000", 100 => "1010", 101 to 102=> "0101", 103 to 104=> "0000", 105 => "1011", 
    106 => "0000", 107 => "1011", 108 => "1010", 109 => "0101", 110 to 111=> "0000", 
    112 => "1011", 113 to 117=> "0000", 118 => "0110", 119 => "1000", 120 => "1010", 
    121 to 122=> "0000", 123 => "0111", 124 => "0010", 125 => "0000", 126 => "0100", 
    127 to 128=> "0000", 129 => "0101", 130 => "0000", 131 => "0100", 132 => "0000", 
    133 => "0101", 134 => "0000", 135 => "0101", 136 => "0110", 137 => "1000", 
    138 => "1100", 139 => "0101", 140 => "0001", 141 => "0010", 142 => "1101", 
    143 to 146=> "0000", 147 => "0101", 148 => "0000", 149 => "1101", 150 => "0111", 
    151 => "0000", 152 => "1101", 153 to 154=> "0000", 155 => "1001", 156 => "0100", 
    157 => "0000", 158 => "0111", 159 => "1000", 160 to 161=> "0000", 162 => "0100", 
    163 => "0000", 164 => "0111", 165 => "0101", 166 => "1100", 167 to 171=> "0000", 
    172 => "1010", 173 to 175=> "0000", 176 => "1001", 177 => "0000", 178 => "0001", 
    179 to 180=> "0000", 181 to 182=> "0001", 183 => "0010", 184 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_civ is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_civ is
    component predict_ensemble_civ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_civ_rom_U :  component predict_ensemble_civ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


