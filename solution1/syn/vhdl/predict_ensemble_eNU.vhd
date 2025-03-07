-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eNU_rom is 
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


architecture rtl of predict_ensemble_eNU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0111", 2 => "0100", 3 => "0111", 4 => "0000", 5 => "0100", 
    6 => "0000", 7 => "1011", 8 => "0000", 9 => "1010", 10 to 11=> "0000", 
    12 => "0101", 13 => "0100", 14 => "1010", 15 => "1011", 16 to 21=> "0000", 
    22 => "0101", 23 => "0111", 24 to 25=> "0000", 26 => "1000", 27 => "1011", 
    28 to 29=> "0000", 30 => "1001", 31 => "0100", 32 => "0101", 33 => "0000", 
    34 => "0100", 35 => "0110", 36 => "0001", 37 => "0101", 38 => "0000", 
    39 => "0101", 40 => "0000", 41 => "0111", 42 to 44=> "0000", 45 to 46=> "1000", 
    47 to 48=> "0000", 49 => "1000", 50 => "0101", 51 => "0011", 52 => "0000", 
    53 => "1001", 54 to 57=> "0000", 58 => "0101", 59 => "0000", 60 => "0011", 
    61 => "0111", 62 => "0101", 63 => "0000", 64 => "1011", 65 => "0011", 
    66 to 67=> "0000", 68 => "0010", 69 => "0000", 70 => "0110", 71 => "0111", 
    72 => "0011", 73 to 75=> "0000", 76 => "1010", 77 to 80=> "0000", 81 => "0010", 
    82 to 83=> "0000", 84 => "1101", 85 => "1011", 86 => "1000", 87 => "0000", 
    88 => "1100", 89 => "0000", 90 => "0111", 91 => "1011", 92 to 94=> "0000", 
    95 => "0101", 96 => "1000", 97 => "0000", 98 => "1100", 99 => "0000", 
    100 => "1010", 101 => "0110", 102 => "0000", 103 to 104=> "0011", 105 to 109=> "0000", 
    110 => "0001", 111 => "0000", 112 => "1001", 113 => "1010", 114 => "0111", 
    115 to 116=> "0000", 117 => "1000", 118 => "0000", 119 => "1011", 120 => "0000", 
    121 to 122=> "1010", 123 => "0000", 124 => "1100", 125 => "0010", 126 => "1001", 
    127 to 128=> "0000", 129 => "0010", 130 => "0111", 131 => "1101", 132 => "1100", 
    133 to 135=> "0000", 136 => "1000", 137 => "0011", 138 => "1001", 139 => "1000", 
    140 to 146=> "0000", 147 => "1010", 148 => "0000", 149 => "0010", 150 => "0000", 
    151 => "1101", 152 => "0100", 153 => "0000", 154 => "0011", 155 => "0100", 
    156 to 157=> "0000", 158 => "0100", 159 => "0101", 160 to 161=> "0000", 162 => "0111", 
    163 to 194=> "0000" );

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

entity predict_ensemble_eNU is
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

architecture arch of predict_ensemble_eNU is
    component predict_ensemble_eNU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eNU_rom_U :  component predict_ensemble_eNU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


