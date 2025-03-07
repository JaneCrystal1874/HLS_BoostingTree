-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eyR_rom is 
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


architecture rtl of predict_ensemble_eyR_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1010", 3 => "1011", 4 => "0101", 
    5 => "0000", 6 => "1010", 7 => "1000", 8 => "0000", 9 => "1011", 
    10 => "0000", 11 => "1011", 12 => "0011", 13 => "0000", 14 => "1000", 
    15 => "0000", 16 => "1011", 17 => "0011", 18 => "0000", 19 => "1010", 
    20 to 21=> "0000", 22 => "0101", 23 to 24=> "0000", 25 => "1010", 26 => "0101", 
    27 => "1100", 28 => "0000", 29 => "1010", 30 => "0000", 31 => "0011", 
    32 => "0110", 33 => "0000", 34 => "0011", 35 to 39=> "0000", 40 => "1100", 
    41 => "0000", 42 => "1001", 43 to 45=> "0000", 46 => "1001", 47 => "0000", 
    48 => "1011", 49 => "1001", 50 => "1011", 51 => "1010", 52 to 53=> "0000", 
    54 => "0111", 55 => "1010", 56 to 57=> "0000", 58 => "1001", 59 to 60=> "0000", 
    61 => "1010", 62 => "1101", 63 => "0111", 64 to 65=> "0000", 66 => "0011", 
    67 => "1000", 68 to 70=> "0000", 71 => "0001", 72 => "0000", 73 => "0001", 
    74 => "1001", 75 to 77=> "0000", 78 => "0111", 79 => "1101", 80 => "1100", 
    81 => "0100", 82 => "0101", 83 => "1101", 84 => "0001", 85 => "0100", 
    86 => "0000", 87 => "0111", 88 => "0000", 89 => "0110", 90 => "0000", 
    91 => "0010", 92 to 94=> "0000", 95 => "1011", 96 to 98=> "0000", 99 => "0011", 
    100 => "0000", 101 => "0011", 102 to 103=> "0000", 104 => "1010", 105 to 106=> "0000", 
    107 to 108=> "0100", 109 => "1001", 110 => "0000", 111 => "0101", 112 to 113=> "0000", 
    114 => "1011", 115 => "1000", 116 => "0101", 117 => "0000", 118 => "1011", 
    119 => "1010", 120 to 122=> "0000", 123 => "1011", 124 => "0101", 125 to 128=> "0000", 
    129 => "1000", 130 => "0000", 131 => "1011", 132 to 133=> "0000", 134 => "1000", 
    135 => "1011", 136 => "1100", 137 => "0000", 138 => "1010", 139 => "0111", 
    140 => "1011", 141 => "0000", 142 => "1101", 143 to 145=> "0000", 146 => "1100", 
    147 => "0101", 148 => "1100", 149 => "1010", 150 to 152=> "0000", 153 => "1000", 
    154 => "0000", 155 => "0010", 156 => "0000", 157 => "1100", 158 to 161=> "0000", 
    162 => "0101", 163 to 194=> "0000" );

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

entity predict_ensemble_eyR is
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

architecture arch of predict_ensemble_eyR is
    component predict_ensemble_eyR_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eyR_rom_U :  component predict_ensemble_eyR_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


