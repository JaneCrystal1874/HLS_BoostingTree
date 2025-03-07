-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bun_rom is 
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


architecture rtl of predict_ensemble_bun_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "1000", 
    5 => "1011", 6 to 7=> "0000", 8 => "1010", 9 => "0111", 10 => "1010", 
    11 => "0000", 12 => "1011", 13 => "1101", 14 => "0000", 15 => "1101", 
    16 => "1011", 17 to 18=> "0000", 19 => "1011", 20 => "0000", 21 => "0111", 
    22 => "0101", 23 => "1011", 24 to 25=> "0000", 26 => "0010", 27 => "0100", 
    28 to 30=> "0000", 31 => "1011", 32 => "0000", 33 => "0101", 34 => "0110", 
    35 to 38=> "0000", 39 to 41=> "0101", 42 to 44=> "0000", 45 => "1100", 46 => "0000", 
    47 => "0110", 48 => "1100", 49 => "1101", 50 => "0010", 51 to 53=> "0000", 
    54 => "1011", 55 => "0010", 56 => "0000", 57 => "0111", 58 => "0010", 
    59 => "1011", 60 to 62=> "0000", 63 => "0100", 64 => "0001", 65 => "0000", 
    66 => "0100", 67 => "0000", 68 => "0001", 69 => "0000", 70 => "1001", 
    71 => "0000", 72 => "1010", 73 => "0001", 74 => "0110", 75 to 76=> "0000", 
    77 => "0100", 78 => "0111", 79 => "1101", 80 => "1000", 81 => "1011", 
    82 => "1010", 83 => "0000", 84 => "0110", 85 => "0001", 86 => "0100", 
    87 => "0101", 88 to 89=> "0000", 90 => "1010", 91 => "0000", 92 => "0011", 
    93 => "0000", 94 => "0011", 95 => "0000", 96 => "1010", 97 => "0000", 
    98 => "1101", 99 => "0101", 100 to 101=> "0010", 102 to 104=> "0000", 105 => "0011", 
    106 to 111=> "0000", 112 => "1011", 113 to 116=> "0000", 117 => "0011", 118 => "0000", 
    119 => "0011", 120 to 121=> "0000", 122 => "0101", 123 to 124=> "0000", 125 => "0110", 
    126 => "1001", 127 => "1101", 128 => "0110", 129 => "0000", 130 => "1011", 
    131 => "0001", 132 => "1000", 133 => "0001", 134 => "0100", 135 to 136=> "0000", 
    137 => "1011", 138 => "0010", 139 to 141=> "0000", 142 => "1010", 143 => "1000", 
    144 => "1011", 145 => "1101", 146 => "0000", 147 => "0010", 148 => "0011", 
    149 to 150=> "0000", 151 => "0101", 152 => "0100", 153 to 156=> "0000", 157 => "1101", 
    158 to 159=> "0000", 160 => "1100", 161 to 164=> "0000", 165 => "0010", 166 => "0000", 
    167 => "0100", 168 to 169=> "0000", 170 => "1100", 171 => "0010", 172 to 176=> "0000", 
    177 => "0110", 178 => "0000", 179 => "0100", 180 => "0000", 181 => "0011", 
    182 to 183=> "0000", 184 => "0110", 185 to 194=> "0000" );

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

entity predict_ensemble_bun is
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

architecture arch of predict_ensemble_bun is
    component predict_ensemble_bun_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bun_rom_U :  component predict_ensemble_bun_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


