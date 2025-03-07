-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ejP_rom is 
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


architecture rtl of predict_ensemble_ejP_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0100", 4 => "1000", 
    5 => "0000", 6 => "0110", 7 => "0101", 8 => "0010", 9 => "1010", 
    10 => "0000", 11 => "0101", 12 to 13=> "0000", 14 => "0111", 15 to 16=> "0000", 
    17 => "0011", 18 to 21=> "0000", 22 => "1001", 23 => "0000", 24 => "1010", 
    25 => "0110", 26 => "0000", 27 => "0011", 28 => "1010", 29 => "1011", 
    30 => "1010", 31 => "0010", 32 to 33=> "0000", 34 => "0011", 35 => "0101", 
    36 => "1001", 37 to 42=> "0000", 43 => "0111", 44 => "1101", 45 => "0110", 
    46 to 47=> "0000", 48 => "0111", 49 to 50=> "1011", 51 to 53=> "0000", 54 => "1100", 
    55 => "0000", 56 => "1000", 57 => "0000", 58 => "0100", 59 => "0110", 
    60 => "0000", 61 => "0101", 62 => "0001", 63 => "0110", 64 => "0100", 
    65 => "1000", 66 to 68=> "0000", 69 => "1001", 70 => "0001", 71 to 72=> "0000", 
    73 => "0001", 74 to 75=> "0000", 76 => "0101", 77 to 79=> "0000", 80 => "0010", 
    81 => "0011", 82 to 83=> "0000", 84 => "1100", 85 => "0000", 86 => "0100", 
    87 => "0000", 88 => "1100", 89 => "0000", 90 => "0111", 91 => "0000", 
    92 => "1010", 93 to 94=> "0000", 95 => "1010", 96 => "0000", 97 => "1010", 
    98 => "0000", 99 => "0011", 100 to 101=> "0000", 102 => "0111", 103 => "1001", 
    104 => "0111", 105 to 107=> "0000", 108 => "0110", 109 => "0000", 110 to 111=> "1011", 
    112 => "0000", 113 => "1101", 114 => "0000", 115 => "1100", 116 => "1011", 
    117 => "0101", 118 => "0001", 119 => "1100", 120 => "0000", 121 => "1011", 
    122 => "0101", 123 => "0000", 124 => "1010", 125 => "1001", 126 => "0000", 
    127 => "0111", 128 => "0000", 129 => "1011", 130 to 132=> "0000", 133 => "1100", 
    134 to 137=> "0000", 138 => "1011", 139 => "1000", 140 => "1100", 141 to 142=> "0000", 
    143 => "0010", 144 => "0100", 145 => "0000", 146 => "0001", 147 to 148=> "0000", 
    149 => "1000", 150 to 151=> "0110", 152 to 155=> "0000", 156 => "1001", 157 => "0000", 
    158 => "0101", 159 => "0011", 160 to 162=> "0000", 163 => "0001", 164 => "0000", 
    165 => "1010", 166 => "0000", 167 => "1010", 168 => "1001", 169 => "0111", 
    170 to 194=> "0000" );

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

entity predict_ensemble_ejP is
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

architecture arch of predict_ensemble_ejP is
    component predict_ensemble_ejP_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ejP_rom_U :  component predict_ensemble_ejP_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


