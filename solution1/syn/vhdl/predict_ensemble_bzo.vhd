-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bzo_rom is 
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


architecture rtl of predict_ensemble_bzo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "1011", 
    5 => "1000", 6 => "1011", 7 => "0101", 8 to 9=> "0000", 10 => "1001", 
    11 => "0000", 12 => "0101", 13 => "0000", 14 => "0111", 15 => "0000", 
    16 => "1011", 17 => "0000", 18 => "0111", 19 to 20=> "0000", 21 => "0111", 
    22 => "1011", 23 to 24=> "0000", 25 => "0110", 26 => "1011", 27 to 29=> "0000", 
    30 => "1010", 31 => "0101", 32 => "0000", 33 => "0101", 34 => "0000", 
    35 => "1011", 36 => "1000", 37 => "0011", 38 => "1011", 39 to 43=> "0000", 
    44 => "0100", 45 => "0000", 46 => "0100", 47 => "1011", 48 => "0110", 
    49 => "0000", 50 => "0100", 51 => "0101", 52 => "1010", 53 to 54=> "0000", 
    55 => "1011", 56 to 59=> "0000", 60 to 61=> "0100", 62 => "0000", 63 => "0111", 
    64 => "1001", 65 => "1000", 66 => "0111", 67 to 68=> "0000", 69 => "1101", 
    70 => "0000", 71 => "1001", 72 => "1011", 73 => "1000", 74 => "0100", 
    75 to 77=> "0000", 78 => "1011", 79 to 82=> "0000", 83 => "1001", 84 => "1011", 
    85 => "0000", 86 => "1011", 87 => "0000", 88 => "0100", 89 to 90=> "0000", 
    91 => "1100", 92 to 93=> "0101", 94 to 96=> "0000", 97 => "1010", 98 => "0101", 
    99 => "0100", 100 => "1010", 101 => "1011", 102 => "1001", 103 to 105=> "0000", 
    106 => "1100", 107 => "0000", 108 => "0111", 109 => "0011", 110 => "1101", 
    111 => "0101", 112 to 113=> "0000", 114 => "0111", 115 to 116=> "0000", 117 => "0100", 
    118 => "1101", 119 => "0011", 120 to 122=> "0000", 123 => "1010", 124 => "0100", 
    125 => "0000", 126 => "0011", 127 => "0111", 128 => "0000", 129 => "0001", 
    130 => "0111", 131 => "0101", 132 => "1010", 133 => "0011", 134 => "0000", 
    135 => "0110", 136 => "0000", 137 => "0010", 138 => "0101", 139 to 142=> "0000", 
    143 => "1010", 144 => "0001", 145 => "1100", 146 to 147=> "0000", 148 => "0010", 
    149 => "1100", 150 to 151=> "0000", 152 => "0100", 153 => "1010", 154 to 155=> "0000", 
    156 => "1101", 157 => "0000", 158 => "0011", 159 => "0001", 160 => "0000", 
    161 => "1010", 162 to 164=> "0000", 165 => "1101", 166 to 170=> "0000", 171 => "0001", 
    172 => "0000", 173 => "1010", 174 => "0100", 175 => "1101", 176 => "1011", 
    177 => "0101", 178 => "0000", 179 => "1010", 180 => "0000", 181 => "0111", 
    182 to 194=> "0000" );

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

entity predict_ensemble_bzo is
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

architecture arch of predict_ensemble_bzo is
    component predict_ensemble_bzo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bzo_rom_U :  component predict_ensemble_bzo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


