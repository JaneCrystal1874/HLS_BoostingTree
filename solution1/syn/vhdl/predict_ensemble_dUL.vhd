-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dUL_rom is 
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


architecture rtl of predict_ensemble_dUL_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1010", 3 => "0110", 4 => "1000", 
    5 to 6=> "0000", 7 => "0010", 8 => "0000", 9 => "0010", 10 => "0101", 
    11 => "0010", 12 => "0000", 13 => "1101", 14 => "0000", 15 => "0011", 
    16 to 17=> "0000", 18 => "1010", 19 => "0000", 20 => "0101", 21 => "1100", 
    22 => "0000", 23 => "0101", 24 to 25=> "0000", 26 => "1011", 27 => "0000", 
    28 => "0111", 29 => "0000", 30 => "1011", 31 => "0000", 32 => "0101", 
    33 => "0000", 34 => "1010", 35 to 37=> "0000", 38 => "0111", 39 => "1011", 
    40 to 41=> "0000", 42 to 43=> "1010", 44 => "0000", 45 => "1010", 46 => "1011", 
    47 => "0001", 48 to 51=> "0000", 52 => "0001", 53 => "0000", 54 => "1101", 
    55 => "0000", 56 to 57=> "1101", 58 => "0011", 59 => "1001", 60 => "0000", 
    61 => "1000", 62 => "0111", 63 => "1000", 64 => "0011", 65 => "1010", 
    66 to 67=> "0000", 68 => "0010", 69 to 71=> "0000", 72 => "1010", 73 => "0010", 
    74 => "1101", 75 to 77=> "0010", 78 => "0111", 79 to 80=> "0000", 81 => "0100", 
    82 => "0000", 83 => "1000", 84 to 85=> "0000", 86 => "1011", 87 to 90=> "0000", 
    91 => "1011", 92 => "1101", 93 to 95=> "0000", 96 => "1010", 97 => "0000", 
    98 => "1000", 99 => "0000", 100 => "1011", 101 => "0001", 102 => "1011", 
    103 => "0100", 104 to 105=> "0000", 106 => "0101", 107 to 109=> "0000", 110 => "1010", 
    111 => "0111", 112 => "0100", 113 to 114=> "0000", 115 to 116=> "0101", 117 to 119=> "0000", 
    120 => "0100", 121 => "1101", 122 => "0000", 123 => "0011", 124 to 125=> "0000", 
    126 => "0011", 127 => "0101", 128 => "0000", 129 => "0110", 130 to 131=> "0000", 
    132 => "0010", 133 => "0101", 134 => "1000", 135 => "0000", 136 => "1011", 
    137 to 138=> "0000", 139 => "1000", 140 to 141=> "0000", 142 => "0110", 143 to 147=> "0000", 
    148 => "0111", 149 => "0010", 150 => "0000", 151 => "1000", 152 => "1100", 
    153 => "0010", 154 => "1010", 155 to 156=> "0000", 157 => "0011", 158 to 160=> "0000", 
    161 => "1001", 162 => "0111", 163 => "0101", 164 to 165=> "0000", 166 => "0111", 
    167 => "0101", 168 to 171=> "0000", 172 => "0101", 173 => "0000", 174 => "0101", 
    175 to 194=> "0000" );

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

entity predict_ensemble_dUL is
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

architecture arch of predict_ensemble_dUL is
    component predict_ensemble_dUL_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dUL_rom_U :  component predict_ensemble_dUL_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


