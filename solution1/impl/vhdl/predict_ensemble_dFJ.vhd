-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dFJ_rom is 
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


architecture rtl of predict_ensemble_dFJ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0000", 4 => "1011", 
    5 => "0111", 6 => "1011", 7 to 9=> "0000", 10 => "0111", 11 => "1001", 
    12 => "0100", 13 => "1101", 14 to 16=> "0000", 17 => "0100", 18 => "0101", 
    19 => "1010", 20 => "0000", 21 => "0011", 22 => "0000", 23 => "1010", 
    24 to 25=> "0000", 26 => "1101", 27 => "0110", 28 => "0000", 29 => "1100", 
    30 => "0011", 31 => "0000", 32 => "0011", 33 => "1001", 34 to 35=> "0000", 
    36 => "0111", 37 => "1000", 38 to 41=> "0000", 42 => "1010", 43 to 44=> "0000", 
    45 => "0100", 46 => "1000", 47 to 48=> "0100", 49 => "1000", 50 => "0000", 
    51 => "1100", 52 to 53=> "0000", 54 => "1001", 55 to 56=> "0000", 57 => "1100", 
    58 => "1000", 59 => "0000", 60 => "0101", 61 => "1100", 62 => "0000", 
    63 => "1001", 64 => "0000", 65 => "1101", 66 to 67=> "0000", 68 => "0001", 
    69 => "1011", 70 => "0000", 71 => "0101", 72 => "0111", 73 => "0000", 
    74 => "1010", 75 => "0110", 76 to 79=> "0000", 80 => "0001", 81 to 84=> "0000", 
    85 => "0010", 86 => "1011", 87 => "0111", 88 => "0000", 89 => "1000", 
    90 => "0000", 91 => "0110", 92 => "1011", 93 to 94=> "0000", 95 to 96=> "1011", 
    97 to 99=> "0000", 100 => "1010", 101 => "0000", 102 => "0110", 103 => "1010", 
    104 => "0000", 105 => "0010", 106 => "0100", 107 => "1010", 108 to 109=> "0000", 
    110 => "0101", 111 to 112=> "0000", 113 => "0101", 114 => "0000", 115 => "1100", 
    116 to 117=> "0000", 118 => "1011", 119 => "0001", 120 => "1011", 121 => "1001", 
    122 => "0000", 123 => "0011", 124 to 126=> "0000", 127 => "0010", 128 => "0000", 
    129 to 130=> "0001", 131 => "1001", 132 to 136=> "0000", 137 => "0001", 138 to 139=> "0000", 
    140 => "1011", 141 => "0000", 142 => "1101", 143 => "1001", 144 => "1100", 
    145 => "0011", 146 => "0111", 147 => "0000", 148 => "0010", 149 to 150=> "0100", 
    151 => "0000", 152 => "0001", 153 => "1001", 154 => "0000", 155 => "1101", 
    156 => "0011", 157 => "0000", 158 => "0111", 159 to 161=> "0000", 162 => "1000", 
    163 to 167=> "0000", 168 => "1000", 169 to 170=> "0000", 171 => "1101", 172 => "0001", 
    173 to 194=> "0000" );

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

entity predict_ensemble_dFJ is
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

architecture arch of predict_ensemble_dFJ is
    component predict_ensemble_dFJ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dFJ_rom_U :  component predict_ensemble_dFJ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


