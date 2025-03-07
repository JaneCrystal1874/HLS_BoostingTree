-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eIT_rom is 
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


architecture rtl of predict_ensemble_eIT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0101", 1 => "1011", 2 to 3=> "0000", 4 => "1011", 5 => "0000", 
    6 => "1011", 7 => "0000", 8 => "0101", 9 => "0110", 10 => "0000", 
    11 => "1011", 12 => "0010", 13 => "1000", 14 => "0011", 15 to 19=> "0000", 
    20 to 21=> "1010", 22 => "0001", 23 => "1011", 24 to 25=> "0000", 26 => "1001", 
    27 => "0000", 28 => "1000", 29 => "0001", 30 => "1001", 31 => "1010", 
    32 to 35=> "0000", 36 => "1011", 37 => "0000", 38 => "1010", 39 => "0000", 
    40 => "1011", 41 => "0000", 42 => "1000", 43 => "0110", 44 => "1000", 
    45 => "0010", 46 => "0000", 47 => "1011", 48 => "0000", 49 => "1011", 
    50 => "0001", 51 => "0000", 52 => "1010", 53 to 55=> "0000", 56 => "0111", 
    57 to 58=> "0000", 59 => "1011", 60 to 61=> "0000", 62 => "1010", 63 to 64=> "0000", 
    65 => "0111", 66 => "0000", 67 => "0111", 68 => "0000", 69 => "0100", 
    70 => "0000", 71 => "0010", 72 => "0101", 73 => "0110", 74 to 77=> "0000", 
    78 => "1011", 79 to 80=> "0101", 81 => "0111", 82 => "0000", 83 => "0101", 
    84 to 85=> "0000", 86 => "1011", 87 => "0000", 88 => "0001", 89 => "1001", 
    90 => "0000", 91 => "0010", 92 => "0011", 93 => "1001", 94 => "0001", 
    95 => "0000", 96 => "0011", 97 => "0000", 98 => "0111", 99 to 100=> "1001", 
    101 => "0010", 102 => "0100", 103 => "0111", 104 to 105=> "0000", 106 => "1010", 
    107 to 110=> "0000", 111 => "0100", 112 => "0000", 113 => "0010", 114 => "0001", 
    115 to 116=> "0000", 117 => "1011", 118 => "1100", 119 to 120=> "0000", 121 => "0111", 
    122 to 124=> "0000", 125 => "1011", 126 to 129=> "0000", 130 => "1010", 131 => "0111", 
    132 => "0000", 133 => "1010", 134 => "0000", 135 => "1000", 136 => "0000", 
    137 => "1000", 138 => "0111", 139 => "1000", 140 => "0000", 141 => "1000", 
    142 => "0111", 143 to 146=> "0000", 147 => "1011", 148 to 150=> "0000", 151 => "0001", 
    152 => "0110", 153 to 155=> "0000", 156 => "0001", 157 => "0101", 158 => "0010", 
    159 => "0000", 160 => "0011", 161 => "0000", 162 => "1011", 163 to 194=> "0000" );

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

entity predict_ensemble_eIT is
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

architecture arch of predict_ensemble_eIT is
    component predict_ensemble_eIT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eIT_rom_U :  component predict_ensemble_eIT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


