-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bJp_rom is 
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


architecture rtl of predict_ensemble_bJp_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "1001", 
    5 => "0000", 6 => "1011", 7 => "0101", 8 => "1011", 9 => "1010", 
    10 => "0000", 11 => "1010", 12 => "0111", 13 to 15=> "0000", 16 => "1010", 
    17 => "0000", 18 => "0110", 19 to 20=> "0000", 21 => "1011", 22 => "0111", 
    23 => "0000", 24 => "1011", 25 => "0000", 26 => "0011", 27 => "0000", 
    28 => "1011", 29 to 31=> "0000", 32 to 33=> "0101", 34 => "0000", 35 => "0010", 
    36 => "0000", 37 => "1011", 38 => "1101", 39 to 41=> "0000", 42 => "1101", 
    43 => "0000", 44 => "0100", 45 => "0000", 46 => "0101", 47 => "0010", 
    48 => "0000", 49 => "0010", 50 => "0000", 51 => "0111", 52 => "0000", 
    53 => "0100", 54 => "1010", 55 to 56=> "0000", 57 => "1001", 58 to 59=> "0000", 
    60 => "0001", 61 => "1000", 62 => "0000", 63 to 64=> "0101", 65 => "0010", 
    66 => "0000", 67 => "1011", 68 => "0010", 69 => "1001", 70 => "0000", 
    71 => "1101", 72 => "1011", 73 => "0000", 74 => "0100", 75 => "0000", 
    76 => "1001", 77 => "0001", 78 => "1101", 79 => "1100", 80 => "1000", 
    81 to 82=> "0000", 83 => "0010", 84 => "1001", 85 => "0100", 86 => "0010", 
    87 to 88=> "0000", 89 => "1011", 90 => "0111", 91 => "0011", 92 to 96=> "0000", 
    97 => "0001", 98 to 99=> "0000", 100 => "0110", 101 to 102=> "0000", 103 => "1010", 
    104 to 105=> "0000", 106 => "1101", 107 => "0000", 108 => "1100", 109 to 113=> "0000", 
    114 => "0110", 115 to 116=> "0000", 117 => "0001", 118 => "0111", 119 => "0001", 
    120 => "0000", 121 => "1011", 122 => "1101", 123 => "0010", 124 => "1101", 
    125 => "1000", 126 => "0000", 127 to 128=> "1101", 129 => "1000", 130 to 131=> "0000", 
    132 => "0101", 133 => "0000", 134 => "0111", 135 to 136=> "0000", 137 => "1100", 
    138 => "0011", 139 to 140=> "0000", 141 => "0101", 142 => "0001", 143 to 147=> "0000", 
    148 => "0011", 149 => "0100", 150 => "0000", 151 => "1000", 152 => "0111", 
    153 => "0011", 154 => "0001", 155 => "0110", 156 to 160=> "0000", 161 => "1101", 
    162 to 163=> "0000", 164 => "1001", 165 => "0000", 166 => "0011", 167 to 168=> "0000", 
    169 to 170=> "0011", 171 => "0000", 172 => "1011", 173 => "0111", 174 => "1101", 
    175 to 180=> "0000", 181 => "0100", 182 to 194=> "0000" );

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

entity predict_ensemble_bJp is
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

architecture arch of predict_ensemble_bJp is
    component predict_ensemble_bJp_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bJp_rom_U :  component predict_ensemble_bJp_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


