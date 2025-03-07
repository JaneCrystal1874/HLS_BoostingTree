-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eeO_rom is 
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


architecture rtl of predict_ensemble_eeO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "1000", 2 => "0000", 3 => "1000", 4 => "1010", 5 => "1011", 
    6 => "0101", 7 => "0000", 8 => "0110", 9 => "0000", 10 => "1100", 
    11 => "0000", 12 => "1000", 13 => "0000", 14 => "1101", 15 to 16=> "0101", 
    17 to 19=> "0000", 20 => "1011", 21 => "1000", 22 => "0000", 23 => "1011", 
    24 to 26=> "0000", 27 => "1011", 28 to 29=> "0000", 30 => "0110", 31 => "0000", 
    32 => "0010", 33 => "1010", 34 => "0011", 35 => "0111", 36 => "0000", 
    37 => "0111", 38 to 39=> "0000", 40 => "1010", 41 => "1011", 42 => "0111", 
    43 => "0011", 44 to 45=> "0000", 46 => "1010", 47 => "0000", 48 => "1000", 
    49 => "0011", 50 to 51=> "0000", 52 => "0011", 53 => "0000", 54 => "1011", 
    55 to 59=> "0000", 60 => "1001", 61 => "0000", 62 => "1010", 63 to 64=> "0001", 
    65 => "0000", 66 => "0010", 67 => "1001", 68 to 69=> "0000", 70 => "1100", 
    71 => "0101", 72 => "0010", 73 to 75=> "0000", 76 => "1100", 77 to 78=> "0000", 
    79 => "1011", 80 => "1100", 81 => "0100", 82 to 84=> "0000", 85 => "1100", 
    86 => "0001", 87 => "1001", 88 => "0011", 89 => "1100", 90 => "0000", 
    91 => "1010", 92 => "0000", 93 => "1010", 94 to 96=> "0000", 97 => "1101", 
    98 => "0000", 99 => "1011", 100 to 101=> "0101", 102 to 105=> "0000", 106 => "0011", 
    107 to 108=> "0000", 109 => "1001", 110 to 111=> "0000", 112 => "0111", 113 => "1010", 
    114 => "1001", 115 => "1100", 116 => "0100", 117 to 118=> "0000", 119 => "0110", 
    120 => "0111", 121 to 123=> "0000", 124 => "1101", 125 to 128=> "0000", 129 => "1001", 
    130 to 131=> "0000", 132 => "1001", 133 => "0000", 134 => "1000", 135 => "0110", 
    136 => "1010", 137 to 139=> "0000", 140 => "1100", 141 => "0000", 142 => "1101", 
    143 => "0101", 144 => "1000", 145 => "0110", 146 => "0111", 147 to 148=> "0000", 
    149 => "1001", 150 to 152=> "0000", 153 => "0011", 154 => "0000", 155 => "1011", 
    156 => "0000", 157 => "0110", 158 => "0000", 159 => "0011", 160 to 161=> "0000", 
    162 => "1000", 163 => "0101", 164 => "1000", 165 => "1010", 166 to 168=> "0000", 
    169 => "0011", 170 to 194=> "0000" );

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

entity predict_ensemble_eeO is
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

architecture arch of predict_ensemble_eeO is
    component predict_ensemble_eeO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eeO_rom_U :  component predict_ensemble_eeO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


