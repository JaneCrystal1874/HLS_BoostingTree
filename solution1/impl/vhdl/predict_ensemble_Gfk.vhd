-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Gfk_rom is 
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


architecture rtl of predict_ensemble_Gfk_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "1000", 2 => "1011", 3 => "0111", 4 => "1101", 
    5 to 6=> "1011", 7 => "0000", 8 => "0111", 9 => "0000", 10 => "0001", 
    11 to 12=> "0000", 13 => "1010", 14 => "1100", 15 => "0000", 16 => "1001", 
    17 => "0000", 18 => "1010", 19 => "0000", 20 => "0010", 21 => "0101", 
    22 => "0100", 23 => "0101", 24 => "0110", 25 => "0000", 26 => "1011", 
    27 to 28=> "0000", 29 => "1101", 30 => "1010", 31 => "0010", 32 => "0100", 
    33 => "0000", 34 => "0100", 35 => "1011", 36 => "0110", 37 => "0000", 
    38 => "1100", 39 to 42=> "0000", 43 => "0011", 44 => "1010", 45 => "0111", 
    46 => "0000", 47 => "0001", 48 => "0000", 49 => "0111", 50 => "1010", 
    51 => "0000", 52 => "0110", 53 to 57=> "0000", 58 => "1100", 59 => "0001", 
    60 => "0000", 61 => "1011", 62 to 64=> "0000", 65 => "0101", 66 to 73=> "0000", 
    74 => "1101", 75 => "1011", 76 to 79=> "0000", 80 => "1011", 81 => "0000", 
    82 => "1000", 83 => "0011", 84 => "1000", 85 to 86=> "0011", 87 => "0000", 
    88 => "0100", 89 to 90=> "0000", 91 => "0101", 92 => "1011", 93 => "0000", 
    94 => "0101", 95 to 96=> "0000", 97 => "0101", 98 => "0000", 99 => "1001", 
    100 => "0001", 101 => "0110", 102 => "0000", 103 => "0101", 104 => "0000", 
    105 => "0101", 106 => "0011", 107 => "0000", 108 => "0001", 109 => "1011", 
    110 => "0000", 111 => "1000", 112 => "0100", 113 => "0000", 114 => "1011", 
    115 to 116=> "0000", 117 => "0001", 118 => "0100", 119 => "0000", 120 => "0110", 
    121 to 122=> "0000", 123 => "1011", 124 => "1100", 125 => "0000", 126 => "1100", 
    127 => "1000", 128 => "1010", 129 => "0000", 130 => "0101", 131 to 132=> "0000", 
    133 => "0001", 134 => "0011", 135 => "0110", 136 to 138=> "0000", 139 => "0101", 
    140 => "1010", 141 => "1011", 142 to 147=> "0000", 148 => "0001", 149 => "1010", 
    150 => "0101", 151 => "0000", 152 => "0100", 153 => "0110", 154 => "0011", 
    155 to 156=> "0000", 157 => "0100", 158 to 160=> "0000", 161 => "0100", 162 => "0111", 
    163 => "0000", 164 => "0110", 165 to 166=> "0000", 167 => "0110", 168 => "0000", 
    169 => "0100", 170 => "0000", 171 => "1010", 172 to 175=> "0000", 176 => "0011", 
    177 to 178=> "0000", 179 => "0100", 180 => "1101", 181 to 182=> "0000", 183 => "1001", 
    184 => "1011", 185 => "0101", 186 to 194=> "0000" );

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

entity predict_ensemble_Gfk is
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

architecture arch of predict_ensemble_Gfk is
    component predict_ensemble_Gfk_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Gfk_rom_U :  component predict_ensemble_Gfk_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


