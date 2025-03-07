-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e2W_rom is 
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


architecture rtl of predict_ensemble_e2W_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0101", 1 => "0111", 2 => "0000", 3 => "0111", 4 => "0100", 
    5 => "1010", 6 => "0000", 7 => "0101", 8 => "0000", 9 => "0101", 
    10 => "1010", 11 => "0000", 12 => "0110", 13 => "1011", 14 => "0000", 
    15 => "1000", 16 => "1011", 17 => "1010", 18 to 19=> "0000", 20 => "0111", 
    21 => "1000", 22 to 23=> "0000", 24 to 25=> "0101", 26 to 27=> "0000", 28 => "0100", 
    29 to 30=> "0000", 31 => "0111", 32 to 34=> "0000", 35 => "0001", 36 => "0000", 
    37 => "0011", 38 => "0000", 39 => "0101", 40 => "0000", 41 => "0011", 
    42 to 43=> "0000", 44 => "0010", 45 => "0000", 46 => "1001", 47 => "0011", 
    48 => "1010", 49 => "0000", 50 => "0011", 51 to 55=> "0000", 56 => "1011", 
    57 => "0000", 58 => "0110", 59 => "0001", 60 => "0000", 61 => "1000", 
    62 => "1100", 63 => "0001", 64 to 65=> "0000", 66 => "1011", 67 => "1101", 
    68 => "0111", 69 => "0011", 70 => "1001", 71 => "0101", 72 => "1101", 
    73 to 76=> "0000", 77 => "0110", 78 => "1010", 79 => "0000", 80 => "0001", 
    81 => "1011", 82 => "0100", 83 to 84=> "0000", 85 => "0111", 86 to 88=> "0000", 
    89 => "0011", 90 to 92=> "0000", 93 => "1000", 94 to 95=> "0000", 96 => "1000", 
    97 => "0100", 98 => "1010", 99 => "1000", 100 => "0000", 101 => "1000", 
    102 => "0000", 103 => "1011", 104 => "0000", 105 => "0101", 106 => "1001", 
    107 => "0101", 108 to 112=> "0000", 113 => "0111", 114 => "0000", 115 => "0111", 
    116 to 118=> "0000", 119 => "1100", 120 => "1000", 121 => "1010", 122 => "0000", 
    123 => "1010", 124 to 125=> "0000", 126 => "0011", 127 => "0101", 128 => "0000", 
    129 => "0100", 130 => "0001", 131 => "1011", 132 => "0100", 133 => "0000", 
    134 => "1011", 135 => "0000", 136 => "1000", 137 => "0000", 138 => "0101", 
    139 => "0000", 140 => "1000", 141 to 145=> "0000", 146 => "1100", 147 => "0111", 
    148 => "0000", 149 => "0011", 150 => "0000", 151 => "1001", 152 => "0000", 
    153 => "0011", 154 => "0000", 155 => "1011", 156 => "1100", 157 => "0111", 
    158 to 162=> "0000", 163 to 164=> "0111", 165 => "1010", 166 to 168=> "0000", 169 => "1010", 
    170 => "0000", 171 => "1001", 172 => "0101", 173 to 194=> "0000" );

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

entity predict_ensemble_e2W is
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

architecture arch of predict_ensemble_e2W is
    component predict_ensemble_e2W_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e2W_rom_U :  component predict_ensemble_e2W_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


