-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dvH_rom is 
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


architecture rtl of predict_ensemble_dvH_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "1001", 2 => "0000", 3 => "1011", 4 to 5=> "0000", 
    6 => "0110", 7 => "1100", 8 => "1011", 9 => "0000", 10 => "1001", 
    11 => "1000", 12 => "0101", 13 => "0000", 14 => "1011", 15 to 16=> "0000", 
    17 => "1001", 18 => "0000", 19 => "0011", 20 => "1100", 21 => "0000", 
    22 => "0011", 23 to 25=> "0000", 26 => "1011", 27 => "1001", 28 => "1000", 
    29 => "0000", 30 => "0111", 31 => "0000", 32 => "1011", 33 to 34=> "0000", 
    35 => "1000", 36 => "1010", 37 => "0000", 38 => "1011", 39 => "1001", 
    40 => "0000", 41 => "1000", 42 to 43=> "0000", 44 => "1001", 45 to 46=> "0000", 
    47 => "0101", 48 to 49=> "0000", 50 => "1000", 51 => "1010", 52 => "0000", 
    53 => "0011", 54 => "1001", 55 => "0101", 56 to 57=> "0000", 58 => "0101", 
    59 => "0000", 60 => "1001", 61 => "0100", 62 => "1011", 63 to 65=> "0000", 
    66 => "0011", 67 => "0000", 68 => "1000", 69 => "1100", 70 => "0000", 
    71 => "0110", 72 to 73=> "0000", 74 => "0101", 75 => "0111", 76 => "0000", 
    77 => "1101", 78 to 81=> "0000", 82 => "0011", 83 to 84=> "0001", 85 => "0011", 
    86 => "0000", 87 => "1101", 88 to 90=> "0000", 91 => "1010", 92 => "0000", 
    93 => "0001", 94 => "0101", 95 => "0011", 96 => "1010", 97 to 98=> "0000", 
    99 => "0100", 100 to 103=> "0000", 104 => "1001", 105 => "1010", 106 to 107=> "0011", 
    108 => "0000", 109 => "0101", 110 to 111=> "0000", 112 => "0001", 113 => "0100", 
    114 => "0000", 115 => "1010", 116 => "0011", 117 to 118=> "0000", 119 => "1100", 
    120 to 121=> "0000", 122 => "1101", 123 to 124=> "0000", 125 => "1010", 126 to 128=> "0000", 
    129 => "0101", 130 => "0000", 131 => "0110", 132 => "0100", 133 => "1010", 
    134 => "0000", 135 => "0100", 136 => "0000", 137 => "1000", 138 => "0111", 
    139 => "1101", 140 to 141=> "0101", 142 => "0011", 143 to 144=> "0000", 145 => "1100", 
    146 => "0001", 147 to 148=> "0000", 149 => "0010", 150 => "0101", 151 => "0000", 
    152 => "1010", 153 => "1000", 154 => "0100", 155 => "0000", 156 => "0011", 
    157 => "1000", 158 => "0010", 159 to 169=> "0000", 170 => "1011", 171 => "0000", 
    172 => "0101", 173 => "0000", 174 => "0001", 175 => "0000", 176 => "1101", 
    177 to 194=> "0000" );

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

entity predict_ensemble_dvH is
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

architecture arch of predict_ensemble_dvH is
    component predict_ensemble_dvH_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dvH_rom_U :  component predict_ensemble_dvH_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


