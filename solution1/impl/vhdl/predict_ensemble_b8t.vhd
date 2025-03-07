-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b8t_rom is 
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


architecture rtl of predict_ensemble_b8t_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "0000", 2 => "0111", 3 => "0000", 4 => "1001", 
    5 => "0000", 6 => "1000", 7 => "1011", 8 => "0000", 9 => "1000", 
    10 => "1010", 11 to 12=> "0000", 13 => "1011", 14 to 15=> "0000", 16 => "1011", 
    17 => "1101", 18 => "1011", 19 to 21=> "0000", 22 to 23=> "0101", 24 => "0000", 
    25 => "0101", 26 => "0000", 27 => "0111", 28 => "0110", 29 => "0000", 
    30 => "0100", 31 => "0000", 32 => "1000", 33 => "0101", 34 to 35=> "0000", 
    36 => "0110", 37 => "0000", 38 => "0101", 39 => "0100", 40 to 41=> "0000", 
    42 => "1000", 43 => "0000", 44 => "1100", 45 => "0001", 46 => "0000", 
    47 => "0010", 48 => "0110", 49 => "1100", 50 => "0000", 51 => "0010", 
    52 => "0000", 53 => "1011", 54 => "0000", 55 => "0101", 56 => "1100", 
    57 => "0000", 58 => "0101", 59 => "0000", 60 => "0101", 61 => "0000", 
    62 => "0001", 63 to 65=> "0000", 66 => "0110", 67 => "1011", 68 to 73=> "0000", 
    74 to 75=> "1010", 76 => "0000", 77 => "1101", 78 => "0010", 79 => "1101", 
    80 => "0011", 81 to 83=> "0000", 84 => "0001", 85 => "0101", 86 => "0100", 
    87 => "0000", 88 => "0001", 89 => "0100", 90 => "0000", 91 => "0101", 
    92 => "0001", 93 => "0000", 94 => "1010", 95 => "1101", 96 to 98=> "0000", 
    99 to 100=> "1011", 101 => "0111", 102 to 105=> "0000", 106 => "0011", 107 => "0000", 
    108 => "1010", 109 => "0000", 110 => "0001", 111 to 112=> "0000", 113 => "0100", 
    114 => "0000", 115 => "0111", 116 => "0000", 117 => "1010", 118 => "1011", 
    119 => "0000", 120 => "1101", 121 => "0000", 122 => "0110", 123 => "0000", 
    124 => "1001", 125 to 126=> "0000", 127 => "0011", 128 => "0111", 129 => "1100", 
    130 to 131=> "0000", 132 => "0011", 133 => "1101", 134 => "1011", 135 to 136=> "0000", 
    137 => "1101", 138 => "0001", 139 to 141=> "0000", 142 => "1100", 143 => "1000", 
    144 to 146=> "0000", 147 => "0100", 148 => "1100", 149 to 150=> "0000", 151 => "1000", 
    152 to 154=> "0000", 155 => "0100", 156 => "0000", 157 => "1011", 158 => "0010", 
    159 => "0000", 160 => "1010", 161 => "0000", 162 => "0010", 163 => "1001", 
    164 to 165=> "0000", 166 => "0100", 167 => "0010", 168 => "0011", 169 to 173=> "0000", 
    174 => "0111", 175 => "0000", 176 => "0010", 177 => "0100", 178 to 179=> "0000", 
    180 to 181=> "1000", 182 => "0100", 183 to 194=> "0000" );

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

entity predict_ensemble_b8t is
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

architecture arch of predict_ensemble_b8t is
    component predict_ensemble_b8t_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b8t_rom_U :  component predict_ensemble_b8t_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


