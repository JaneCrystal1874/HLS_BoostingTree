-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bkl_rom is 
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


architecture rtl of predict_ensemble_bkl_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "0000", 2 => "0111", 3 to 4=> "1001", 5 to 7=> "0000", 
    8 => "0101", 9 => "1000", 10 => "1011", 11 => "1000", 12 to 13=> "0000", 
    14 => "0101", 15 => "0111", 16 => "1000", 17 => "1101", 18 => "0000", 
    19 => "0010", 20 => "1000", 21 => "0000", 22 => "1011", 23 => "0001", 
    24 => "1000", 25 to 26=> "0000", 27 => "1011", 28 to 29=> "0000", 30 => "0001", 
    31 to 32=> "0000", 33 => "0100", 34 to 35=> "0000", 36 => "1011", 37 => "0000", 
    38 => "0011", 39 => "1001", 40 to 41=> "0000", 42 to 43=> "1100", 44 => "0000", 
    45 => "1010", 46 => "1001", 47 => "1010", 48 => "0101", 49 => "0000", 
    50 => "1000", 51 => "0000", 52 => "1100", 53 to 54=> "0101", 55 => "0100", 
    56 to 62=> "0000", 63 => "0110", 64 to 67=> "0000", 68 => "0100", 69 => "0000", 
    70 => "0010", 71 => "0000", 72 => "0010", 73 to 74=> "0000", 75 => "1011", 
    76 => "0000", 77 => "0101", 78 => "1011", 79 to 81=> "0000", 82 => "0100", 
    83 => "0101", 84 => "1100", 85 => "0010", 86 => "1010", 87 to 89=> "1100", 
    90 => "0001", 91 => "0000", 92 => "1011", 93 => "0001", 94 to 95=> "0000", 
    96 => "0111", 97 => "0000", 98 => "1100", 99 => "0000", 100 => "0001", 
    101 => "0111", 102 to 104=> "0000", 105 => "0100", 106 to 109=> "0000", 110 => "0010", 
    111 => "1010", 112 => "0000", 113 to 114=> "0010", 115 => "0000", 116 => "0010", 
    117 => "0000", 118 => "0011", 119 to 121=> "0000", 122 => "1010", 123 => "0000", 
    124 => "0011", 125 => "0001", 126 => "0000", 127 to 128=> "0101", 129 => "0010", 
    130 => "1100", 131 to 132=> "0000", 133 => "1100", 134 to 136=> "0000", 137 => "0101", 
    138 => "1000", 139 => "0100", 140 => "1001", 141 => "1100", 142 to 150=> "0000", 
    151 => "0110", 152 to 153=> "0000", 154 => "1000", 155 => "0000", 156 => "1000", 
    157 => "0000", 158 to 159=> "1011", 160 to 161=> "1001", 162 => "0000", 163 => "1000", 
    164 => "0000", 165 => "0111", 166 => "0110", 167 to 168=> "0000", 169 => "0101", 
    170 => "0000", 171 => "0111", 172 => "0000", 173 => "1001", 174 => "0100", 
    175 to 176=> "0000", 177 => "1100", 178 to 179=> "0000", 180 => "0110", 181 to 182=> "0000", 
    183 => "0110", 184 => "0000", 185 => "0011", 186 to 194=> "0000" );

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

entity predict_ensemble_bkl is
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

architecture arch of predict_ensemble_bkl is
    component predict_ensemble_bkl_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bkl_rom_U :  component predict_ensemble_bkl_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


