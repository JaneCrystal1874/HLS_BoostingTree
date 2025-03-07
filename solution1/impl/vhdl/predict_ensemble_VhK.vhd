-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_VhK_rom is 
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


architecture rtl of predict_ensemble_VhK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "0110", 
    5 => "1010", 6 => "0100", 7 => "1011", 8 => "0000", 9 => "1000", 
    10 => "0110", 11 => "0010", 12 => "1000", 13 => "1100", 14 to 16=> "0000", 
    17 to 18=> "0001", 19 => "1010", 20 => "1001", 21 to 22=> "0000", 23 => "1000", 
    24 to 26=> "0000", 27 => "1000", 28 => "0011", 29 to 30=> "0000", 31 => "0110", 
    32 => "0101", 33 => "0111", 34 => "0000", 35 => "0011", 36 => "1010", 
    37 to 40=> "0000", 41 => "0111", 42 => "1100", 43 to 46=> "0000", 47 => "0100", 
    48 => "1010", 49 => "0011", 50 => "1011", 51 => "0111", 52 => "1100", 
    53 to 54=> "0000", 55 => "1001", 56 => "0000", 57 to 58=> "1011", 59 => "0010", 
    60 => "0000", 61 => "1000", 62 => "1001", 63 to 67=> "0000", 68 => "1100", 
    69 => "0000", 70 => "1010", 71 to 73=> "0000", 74 => "0010", 75 => "0111", 
    76 => "1100", 77 => "0000", 78 => "0011", 79 to 83=> "0000", 84 => "0111", 
    85 => "0010", 86 to 87=> "0000", 88 => "1011", 89 => "1100", 90 => "0000", 
    91 => "1011", 92 to 94=> "0000", 95 => "0001", 96 => "1000", 97 => "1100", 
    98 => "0000", 99 => "1100", 100 => "0000", 101 => "1000", 102 to 104=> "0000", 
    105 => "1000", 106 => "1010", 107 => "1001", 108 => "1101", 109 => "0000", 
    110 => "0110", 111 to 113=> "0000", 114 => "1101", 115 => "1000", 116 => "1011", 
    117 => "0000", 118 => "1010", 119 => "0000", 120 => "0100", 121 => "0000", 
    122 => "1011", 123 => "0110", 124 => "1101", 125 => "0000", 126 => "0111", 
    127 => "0000", 128 => "1011", 129 to 131=> "0000", 132 => "0111", 133 => "1001", 
    134 to 135=> "0000", 136 => "0100", 137 => "0000", 138 => "0110", 139 to 140=> "0000", 
    141 => "1001", 142 => "1100", 143 => "0001", 144 => "1001", 145 to 146=> "0000", 
    147 => "0101", 148 => "1100", 149 to 152=> "0000", 153 => "0111", 154 => "0110", 
    155 => "0000", 156 => "0011", 157 => "1101", 158 to 159=> "0000", 160 => "0110", 
    161 => "0011", 162 to 164=> "0000", 165 => "1010", 166 => "0101", 167 => "0000", 
    168 => "0111", 169 => "0000", 170 => "1000", 171 to 172=> "0000", 173 => "0110", 
    174 => "0000", 175 => "1010", 176 => "1101", 177 to 178=> "0000", 179 => "0011", 
    180 => "0000", 181 => "0010", 182 => "1101", 183 to 187=> "0000", 188 => "1000", 
    189 => "1001", 190 => "0000", 191 => "0101", 192 to 194=> "0000" );

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

entity predict_ensemble_VhK is
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

architecture arch of predict_ensemble_VhK is
    component predict_ensemble_VhK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_VhK_rom_U :  component predict_ensemble_VhK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


