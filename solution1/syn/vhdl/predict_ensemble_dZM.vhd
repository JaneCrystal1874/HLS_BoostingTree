-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dZM_rom is 
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


architecture rtl of predict_ensemble_dZM_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0111", 4 => "1011", 
    5 => "1000", 6 to 7=> "0000", 8 => "0101", 9 => "1001", 10 => "0000", 
    11 => "0101", 12 to 14=> "0000", 15 => "0011", 16 to 17=> "0000", 18 => "0011", 
    19 => "0000", 20 => "1010", 21 => "1011", 22 => "1010", 23 to 25=> "0000", 
    26 to 27=> "0001", 28 => "0010", 29 => "1010", 30 to 31=> "0000", 32 => "1010", 
    33 => "0110", 34 to 35=> "0000", 36 => "0010", 37 => "1101", 38 to 39=> "0000", 
    40 => "0111", 41 to 42=> "0000", 43 => "1011", 44 to 45=> "0000", 46 => "1100", 
    47 => "0000", 48 => "1010", 49 => "0011", 50 => "0000", 51 => "0001", 
    52 => "0011", 53 to 55=> "0000", 56 => "1101", 57 => "0000", 58 => "0010", 
    59 => "1010", 60 => "0000", 61 => "1010", 62 => "1101", 63 => "0001", 
    64 => "0100", 65 to 66=> "0000", 67 => "0100", 68 => "1100", 69 => "0100", 
    70 => "1101", 71 to 74=> "0000", 75 => "0100", 76 => "0000", 77 => "1101", 
    78 => "1000", 79 => "1001", 80 => "0110", 81 => "0111", 82 => "0000", 
    83 => "1101", 84 => "1011", 85 => "1001", 86 => "0000", 87 => "0110", 
    88 => "1101", 89 to 90=> "0000", 91 => "0111", 92 to 93=> "0000", 94 => "1011", 
    95 to 96=> "0000", 97 => "0100", 98 to 101=> "0000", 102 => "1000", 103 => "0001", 
    104 => "1000", 105 to 106=> "0000", 107 => "1010", 108 to 110=> "0000", 111 => "1011", 
    112 => "0101", 113 to 114=> "0000", 115 => "0100", 116 to 117=> "0000", 118 => "0110", 
    119 => "0100", 120 => "0000", 121 => "1100", 122 to 123=> "0000", 124 => "1010", 
    125 => "0111", 126 => "0010", 127 => "0110", 128 to 131=> "0000", 132 => "0110", 
    133 to 135=> "0000", 136 to 137=> "1100", 138 => "0110", 139 => "0001", 140 => "0000", 
    141 => "1011", 142 => "1001", 143 => "0000", 144 => "1011", 145 => "0110", 
    146 => "1011", 147 => "0000", 148 => "1100", 149 => "0011", 150 => "0101", 
    151 to 153=> "0000", 154 => "1011", 155 => "1100", 156 => "1101", 157 => "0000", 
    158 => "0101", 159 to 162=> "0000", 163 => "0100", 164 => "0000", 165 => "1100", 
    166 to 169=> "0000", 170 => "0010", 171 => "0011", 172 => "1000", 173 => "0010", 
    174 to 175=> "0000", 176 => "1001", 177 => "1000", 178 to 181=> "0000", 182 => "1101", 
    183 to 194=> "0000" );

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

entity predict_ensemble_dZM is
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

architecture arch of predict_ensemble_dZM is
    component predict_ensemble_dZM_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dZM_rom_U :  component predict_ensemble_dZM_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


