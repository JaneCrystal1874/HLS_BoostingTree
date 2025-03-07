-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dlF_rom is 
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


architecture rtl of predict_ensemble_dlF_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0110", 4 => "1011", 
    5 => "0000", 6 => "0110", 7 => "0000", 8 => "1000", 9 to 10=> "0000", 
    11 => "1001", 12 => "0011", 13 => "0001", 14 => "0111", 15 to 19=> "0000", 
    20 => "0111", 21 => "0000", 22 to 23=> "0101", 24 => "0000", 25 => "0011", 
    26 to 27=> "0000", 28 => "0010", 29 => "1010", 30 => "0101", 31 => "0111", 
    32 => "0000", 33 => "0101", 34 => "0000", 35 => "1001", 36 => "0111", 
    37 to 38=> "0000", 39 => "1001", 40 to 41=> "0000", 42 => "0010", 43 => "1011", 
    44 to 47=> "0000", 48 => "0011", 49 => "0000", 50 => "0011", 51 => "0000", 
    52 => "0100", 53 => "0000", 54 => "0001", 55 => "1011", 56 => "0000", 
    57 => "1001", 58 => "1000", 59 => "1010", 60 to 61=> "0000", 62 => "1101", 
    63 to 64=> "0000", 65 => "1011", 66 => "0111", 67 to 69=> "0000", 70 => "0011", 
    71 => "0000", 72 => "0110", 73 => "1000", 74 => "1010", 75 => "0100", 
    76 => "0000", 77 => "1011", 78 => "0000", 79 to 81=> "0100", 82 => "1011", 
    83 => "0111", 84 to 85=> "0000", 86 => "0011", 87 => "0000", 88 => "0001", 
    89 => "0110", 90 => "0100", 91 => "0000", 92 to 93=> "1011", 94 => "0000", 
    95 => "1011", 96 to 99=> "0000", 100 => "0100", 101 => "0101", 102 => "1010", 
    103 => "0110", 104 to 106=> "0000", 107 => "0111", 108 => "0000", 109 => "0111", 
    110 to 111=> "0000", 112 => "0001", 113 => "0000", 114 to 115=> "0001", 116 => "0111", 
    117 => "0100", 118 => "1001", 119 => "0000", 120 => "0011", 121 to 125=> "0000", 
    126 => "0101", 127 => "0100", 128 => "0000", 129 => "0110", 130 => "1001", 
    131 to 132=> "0000", 133 => "1010", 134 to 139=> "0000", 140 => "1101", 141 => "0101", 
    142 to 143=> "0001", 144 to 147=> "0000", 148 => "0010", 149 => "0000", 150 => "0001", 
    151 to 152=> "0101", 153 to 156=> "0000", 157 => "1100", 158 => "0101", 159 => "0011", 
    160 => "0010", 161 => "0000", 162 => "0101", 163 to 164=> "0000", 165 => "1010", 
    166 => "0010", 167 to 168=> "0000", 169 => "0010", 170 to 171=> "0000", 172 => "0001", 
    173 to 175=> "0000", 176 => "1000", 177 to 194=> "0000" );

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

entity predict_ensemble_dlF is
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

architecture arch of predict_ensemble_dlF is
    component predict_ensemble_dlF_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dlF_rom_U :  component predict_ensemble_dlF_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


