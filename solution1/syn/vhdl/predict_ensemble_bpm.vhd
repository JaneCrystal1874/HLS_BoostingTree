-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bpm_rom is 
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


architecture rtl of predict_ensemble_bpm_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "0111", 3 => "0101", 4 => "1011", 
    5 to 7=> "0000", 8 => "1000", 9 => "1010", 10 => "0000", 11 => "1010", 
    12 => "1100", 13 to 14=> "1011", 15 to 16=> "0000", 17 => "0110", 18 => "1101", 
    19 => "0000", 20 => "1100", 21 => "0000", 22 => "0111", 23 => "0100", 
    24 => "1011", 25 => "1100", 26 to 27=> "0000", 28 => "0001", 29 => "0100", 
    30 to 31=> "0010", 32 => "0101", 33 => "1001", 34 => "0000", 35 => "0010", 
    36 => "0000", 37 => "1101", 38 to 39=> "0000", 40 => "1010", 41 to 43=> "0000", 
    44 => "0101", 45 to 46=> "0000", 47 => "1011", 48 => "0000", 49 => "0001", 
    50 to 51=> "0101", 52 => "0000", 53 => "0010", 54 to 56=> "0000", 57 => "0100", 
    58 => "0000", 59 => "0100", 60 to 62=> "0000", 63 to 64=> "0110", 65 => "0000", 
    66 => "1010", 67 => "0000", 68 => "1011", 69 => "0101", 70 => "0110", 
    71 => "0100", 72 to 73=> "0000", 74 => "0100", 75 => "0000", 76 => "0100", 
    77 => "0000", 78 => "1000", 79 => "0010", 80 to 81=> "1011", 82 to 83=> "0000", 
    84 => "0110", 85 => "0100", 86 to 88=> "0000", 89 => "1001", 90 to 91=> "0000", 
    92 => "1101", 93 => "0010", 94 => "0000", 95 => "0100", 96 => "0000", 
    97 => "0111", 98 => "0101", 99 => "0000", 100 => "0011", 101 => "0000", 
    102 => "1100", 103 => "1011", 104 => "0010", 105 => "0000", 106 => "0010", 
    107 => "1000", 108 to 111=> "0000", 112 => "0101", 113 => "0010", 114 => "0000", 
    115 => "1000", 116 => "0010", 117 to 120=> "0000", 121 => "1100", 122 => "1001", 
    123 to 124=> "0000", 125 => "1100", 126 to 128=> "0000", 129 => "1011", 130 to 131=> "0000", 
    132 => "0001", 133 => "0000", 134 => "1010", 135 => "1000", 136 => "1100", 
    137 => "0111", 138 => "0100", 139 to 140=> "0000", 141 => "0011", 142 => "0100", 
    143 to 145=> "0000", 146 => "0101", 147 => "0110", 148 => "0000", 149 => "0001", 
    150 => "0100", 151 => "0000", 152 => "0001", 153 => "0110", 154 to 155=> "0101", 
    156 => "0111", 157 to 159=> "0000", 160 => "0011", 161 to 167=> "0000", 168 => "0101", 
    169 to 170=> "0000", 171 => "0111", 172 to 194=> "0000" );

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

entity predict_ensemble_bpm is
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

architecture arch of predict_ensemble_bpm is
    component predict_ensemble_bpm_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bpm_rom_U :  component predict_ensemble_bpm_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


