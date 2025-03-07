-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c1C_rom is 
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


architecture rtl of predict_ensemble_c1C_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "0111", 2 => "0000", 3 to 4=> "1011", 5 => "0000", 
    6 => "1000", 7 => "0000", 8 => "1001", 9 => "0011", 10 => "0001", 
    11 => "0000", 12 => "1010", 13 => "0000", 14 => "0011", 15 to 17=> "0000", 
    18 => "0111", 19 => "0000", 20 => "1001", 21 to 23=> "0000", 24 => "0011", 
    25 => "0000", 26 => "0111", 27 => "0000", 28 to 29=> "1010", 30 => "0000", 
    31 => "0101", 32 => "0000", 33 => "0101", 34 => "0000", 35 => "1011", 
    36 => "0000", 37 => "1001", 38 => "1011", 39 to 41=> "0000", 42 => "1010", 
    43 => "0011", 44 => "0000", 45 => "0011", 46 => "0000", 47 => "1100", 
    48 => "0101", 49 => "0100", 50 to 51=> "0000", 52 => "1010", 53 => "0000", 
    54 => "0010", 55 to 56=> "0000", 57 => "0011", 58 to 59=> "0000", 60 => "1000", 
    61 => "0000", 62 => "0101", 63 => "1011", 64 => "0000", 65 => "1011", 
    66 => "1010", 67 => "0001", 68 => "0000", 69 => "0011", 70 to 71=> "0000", 
    72 => "0010", 73 => "0000", 74 => "0100", 75 => "0000", 76 => "1011", 
    77 => "0000", 78 to 79=> "0100", 80 to 81=> "0000", 82 => "1001", 83 => "0010", 
    84 => "0000", 85 => "0110", 86 => "0111", 87 => "1100", 88 to 89=> "0000", 
    90 => "0111", 91 => "0001", 92 => "1101", 93 => "0100", 94 to 96=> "0000", 
    97 => "1001", 98 to 99=> "0000", 100 => "1101", 101 => "1010", 102 to 104=> "0000", 
    105 => "1010", 106 => "1001", 107 to 110=> "0000", 111 => "0110", 112 to 113=> "0000", 
    114 => "1101", 115 => "0000", 116 => "1101", 117 => "1000", 118 => "1011", 
    119 => "1001", 120 to 122=> "1011", 123 to 124=> "0000", 125 => "0111", 126 => "1001", 
    127 => "0111", 128 to 131=> "0000", 132 => "1100", 133 to 135=> "0000", 136 => "1001", 
    137 => "0011", 138 => "0000", 139 => "1001", 140 => "1000", 141 to 142=> "0000", 
    143 => "1001", 144 => "1011", 145 to 147=> "0000", 148 => "0011", 149 => "0000", 
    150 => "1001", 151 => "0000", 152 => "0001", 153 to 154=> "0000", 155 => "0001", 
    156 => "0000", 157 => "0010", 158 => "0101", 159 => "0010", 160 to 162=> "0000", 
    163 => "1000", 164 => "0000", 165 => "0010", 166 to 167=> "0000", 168 => "0011", 
    169 => "0110", 170 => "0000", 171 => "0101", 172 => "0000", 173 => "1001", 
    174 => "1011", 175 => "0000", 176 => "0100", 177 to 194=> "0000" );

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

entity predict_ensemble_c1C is
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

architecture arch of predict_ensemble_c1C is
    component predict_ensemble_c1C_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c1C_rom_U :  component predict_ensemble_c1C_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


