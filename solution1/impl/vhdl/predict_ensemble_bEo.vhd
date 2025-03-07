-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bEo_rom is 
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


architecture rtl of predict_ensemble_bEo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "1000", 
    5 => "0111", 6 to 7=> "0000", 8 => "1001", 9 => "0000", 10 to 12=> "1011", 
    13 => "1001", 14 to 15=> "0000", 16 => "1011", 17 => "0000", 18 => "0101", 
    19 => "0000", 20 => "0111", 21 to 22=> "0000", 23 => "1001", 24 => "1010", 
    25 to 26=> "0000", 27 => "1011", 28 to 29=> "0000", 30 => "0001", 31 => "0000", 
    32 => "0001", 33 => "0000", 34 => "1101", 35 => "0000", 36 => "1011", 
    37 => "0000", 38 => "0100", 39 => "0000", 40 => "0010", 41 to 42=> "0101", 
    43 => "1010", 44 => "0000", 45 => "1010", 46 to 48=> "0000", 49 => "0100", 
    50 => "0001", 51 => "0100", 52 => "0101", 53 => "1000", 54 => "0000", 
    55 => "1011", 56 to 58=> "0000", 59 => "1011", 60 => "1100", 61 => "1011", 
    62 => "0101", 63 => "1000", 64 => "0000", 65 => "0010", 66 => "0000", 
    67 => "0100", 68 => "0000", 69 => "0101", 70 => "0000", 71 => "1100", 
    72 to 75=> "0000", 76 => "0010", 77 => "0111", 78 => "0010", 79 => "0110", 
    80 to 81=> "0000", 82 => "1011", 83 => "1000", 84 => "0110", 85 => "0000", 
    86 => "0110", 87 to 89=> "0000", 90 to 91=> "1011", 92 => "0000", 93 => "0110", 
    94 => "0101", 95 => "0111", 96 => "0101", 97 => "0110", 98 => "0000", 
    99 => "0101", 100 => "1101", 101 => "0000", 102 => "1011", 103 => "1000", 
    104 => "1101", 105 to 109=> "0000", 110 => "0010", 111 to 113=> "0000", 114 => "1010", 
    115 to 116=> "0000", 117 => "0001", 118 => "0000", 119 => "1101", 120 => "0001", 
    121 to 122=> "0000", 123 => "0111", 124 => "1010", 125 => "1101", 126 to 128=> "0000", 
    129 => "0101", 130 => "0000", 131 => "0100", 132 => "0001", 133 => "1101", 
    134 to 135=> "1010", 136 => "0111", 137 => "0000", 138 => "1011", 139 => "1100", 
    140 => "0001", 141 to 144=> "0000", 145 => "0101", 146 => "0010", 147 => "1010", 
    148 => "0000", 149 => "0101", 150 to 153=> "0000", 154 => "0011", 155 => "0000", 
    156 => "1001", 157 to 158=> "0000", 159 => "1010", 160 => "0000", 161 => "0101", 
    162 to 170=> "0000", 171 => "1011", 172 to 173=> "0000", 174 => "0111", 175 => "0000", 
    176 => "0001", 177 => "0000", 178 => "1011", 179 => "0000", 180 => "0010", 
    181 => "0000", 182 => "1101", 183 => "0000", 184 => "1011", 185 to 194=> "0000" );

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

entity predict_ensemble_bEo is
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

architecture arch of predict_ensemble_bEo is
    component predict_ensemble_bEo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bEo_rom_U :  component predict_ensemble_bEo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


