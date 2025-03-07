-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Lf8_rom is 
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


architecture rtl of predict_ensemble_Lf8_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "1001", 2 => "0001", 3 => "0000", 4 => "1011", 
    5 to 6=> "0000", 7 => "0111", 8 => "1011", 9 => "0000", 10 => "0100", 
    11 => "0000", 12 => "1011", 13 to 15=> "0000", 16 => "1011", 17 => "0000", 
    18 => "1011", 19 => "0000", 20 => "1011", 21 => "0000", 22 => "1011", 
    23 => "1010", 24 to 25=> "1011", 26 to 27=> "0000", 28 => "0110", 29 to 30=> "0000", 
    31 => "1001", 32 => "1011", 33 => "0011", 34 => "1001", 35 to 36=> "0000", 
    37 => "0100", 38 => "0011", 39 => "0111", 40 => "0110", 41 => "0101", 
    42 to 43=> "0000", 44 => "0101", 45 => "0000", 46 => "1010", 47 => "1011", 
    48 to 49=> "0000", 50 => "0101", 51 => "0000", 52 => "0100", 53 to 55=> "0000", 
    56 => "1001", 57 => "0000", 58 => "1010", 59 => "0101", 60 => "0011", 
    61 => "0100", 62 => "1100", 63 => "0000", 64 => "1010", 65 => "0111", 
    66 to 67=> "0000", 68 => "1000", 69 => "1010", 70 => "1001", 71 => "0000", 
    72 => "0110", 73 to 79=> "0000", 80 => "0110", 81 to 82=> "0000", 83 => "1011", 
    84 => "1001", 85 to 86=> "0000", 87 => "0100", 88 => "1010", 89 => "0000", 
    90 => "0101", 91 to 92=> "0000", 93 to 94=> "1010", 95 => "0011", 96 => "0000", 
    97 => "0011", 98 to 99=> "0000", 100 => "1000", 101 => "1011", 102 to 106=> "0000", 
    107 to 108=> "1011", 109 to 111=> "0000", 112 => "0011", 113 => "1010", 114 => "1001", 
    115 => "0000", 116 => "0110", 117 => "0111", 118 => "1001", 119 => "0000", 
    120 => "0111", 121 => "0001", 122 to 123=> "0000", 124 => "1011", 125 to 126=> "0000", 
    127 => "1010", 128 to 129=> "1000", 130 to 131=> "0000", 132 => "1000", 133 => "0000", 
    134 => "1010", 135 => "1000", 136 => "0101", 137 => "0000", 138 => "1001", 
    139 => "0011", 140 to 141=> "1100", 142 => "0000", 143 => "1011", 144 => "1001", 
    145 to 146=> "0000", 147 => "0111", 148 => "0000", 149 => "1101", 150 => "0100", 
    151 => "1011", 152 => "0101", 153 to 156=> "0000", 157 to 158=> "0001", 159 => "0000", 
    160 => "1100", 161 => "0100", 162 to 164=> "0000", 165 => "0111", 166 to 168=> "0000", 
    169 => "0001", 170 to 172=> "0000", 173 => "0111", 174 => "0000", 175 => "0100", 
    176 to 177=> "0000", 178 => "0011", 179 => "1100", 180 to 182=> "0000", 183 => "0001", 
    184 to 185=> "0000", 186 => "0111", 187 to 194=> "0000" );

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

entity predict_ensemble_Lf8 is
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

architecture arch of predict_ensemble_Lf8 is
    component predict_ensemble_Lf8_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Lf8_rom_U :  component predict_ensemble_Lf8_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


