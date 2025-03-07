-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bfk_rom is 
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


architecture rtl of predict_ensemble_bfk_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "0111", 2 => "0011", 3 => "0000", 4 => "1001", 
    5 to 7=> "0000", 8 => "1011", 9 => "0011", 10 => "1011", 11 => "0000", 
    12 => "1011", 13 => "0101", 14 => "1011", 15 to 19=> "0000", 20 => "1011", 
    21 => "0011", 22 => "1100", 23 to 24=> "0000", 25 => "1101", 26 => "1100", 
    27 => "1001", 28 => "0000", 29 => "0110", 30 to 31=> "1010", 32 to 34=> "0000", 
    35 => "0100", 36 to 37=> "0000", 38 => "1011", 39 to 40=> "0101", 41 to 42=> "0000", 
    43 => "0001", 44 => "0000", 45 => "0010", 46 to 47=> "0000", 48 to 49=> "0100", 
    50 to 51=> "0000", 52 => "1000", 53 => "0101", 54 => "1000", 55 => "0000", 
    56 => "0100", 57 => "0000", 58 => "0110", 59 => "0000", 60 => "0111", 
    61 => "0101", 62 to 65=> "0000", 66 => "0111", 67 => "0000", 68 => "0110", 
    69 => "0101", 70 to 71=> "1100", 72 to 75=> "0000", 76 => "1010", 77 => "1100", 
    78 => "0010", 79 => "0001", 80 => "1101", 81 to 82=> "0000", 83 => "1101", 
    84 => "1000", 85 to 86=> "0000", 87 => "1101", 88 => "1000", 89 to 92=> "0000", 
    93 => "1011", 94 => "0001", 95 => "0111", 96 => "0000", 97 => "1011", 
    98 => "0010", 99 to 100=> "0000", 101 => "0100", 102 => "0111", 103 to 104=> "0000", 
    105 to 106=> "0001", 107 => "0100", 108 to 109=> "0000", 110 => "0010", 111 => "0011", 
    112 => "0001", 113 => "1000", 114 => "1101", 115 => "1001", 116 => "0111", 
    117 => "0100", 118 => "0000", 119 => "0101", 120 => "0000", 121 => "0100", 
    122 => "0000", 123 => "1101", 124 => "0111", 125 => "1001", 126 => "0010", 
    127 => "0000", 128 => "0001", 129 => "0000", 130 => "0110", 131 => "0001", 
    132 => "0000", 133 => "1100", 134 => "1010", 135 to 137=> "0000", 138 => "1000", 
    139 => "1010", 140 => "0001", 141 => "0011", 142 => "0001", 143 => "0000", 
    144 => "0101", 145 => "0100", 146 to 148=> "0000", 149 => "1001", 150 to 153=> "0000", 
    154 => "0001", 155 to 160=> "0000", 161 to 162=> "0100", 163 => "0000", 164 => "0100", 
    165 => "1101", 166 to 172=> "0000", 173 => "0011", 174 to 180=> "0000", 181 => "0011", 
    182 => "0001", 183 to 194=> "0000" );

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

entity predict_ensemble_bfk is
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

architecture arch of predict_ensemble_bfk is
    component predict_ensemble_bfk_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bfk_rom_U :  component predict_ensemble_bfk_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


