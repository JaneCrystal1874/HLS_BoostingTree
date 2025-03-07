-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cnw_rom is 
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


architecture rtl of predict_ensemble_cnw_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "1001", 3 => "0000", 4 => "1011", 
    5 => "0000", 6 => "1000", 7 => "0011", 8 => "0000", 9 => "0001", 
    10 => "0111", 11 to 12=> "0000", 13 to 14=> "0101", 15 => "0000", 16 => "0111", 
    17 => "0110", 18 to 20=> "0000", 21 => "0101", 22 => "0001", 23 => "0110", 
    24 to 26=> "0000", 27 to 28=> "1001", 29 to 30=> "0000", 31 to 32=> "1011", 33 => "0000", 
    34 => "0011", 35 => "0000", 36 => "1010", 37 => "0011", 38 => "0000", 
    39 => "1100", 40 => "0011", 41 => "0100", 42 to 43=> "0000", 44 => "1011", 
    45 to 46=> "0000", 47 => "1100", 48 to 49=> "0000", 50 => "1011", 51 => "0001", 
    52 => "0010", 53 => "0000", 54 => "1011", 55 => "0001", 56 => "0000", 
    57 => "0111", 58 => "1010", 59 => "0101", 60 => "1010", 61 to 63=> "0000", 
    64 => "1011", 65 => "0000", 66 => "1101", 67 to 68=> "0000", 69 => "0100", 
    70 to 73=> "0000", 74 => "1011", 75 to 76=> "0100", 77 => "0101", 78 => "0000", 
    79 => "0100", 80 to 81=> "0000", 82 => "1000", 83 => "0101", 84 => "0000", 
    85 => "1011", 86 to 88=> "0000", 89 => "0100", 90 => "0000", 91 => "0110", 
    92 => "0000", 93 => "0101", 94 => "0100", 95 => "0010", 96 => "0110", 
    97 => "0010", 98 to 103=> "0000", 104 => "0100", 105 to 107=> "0000", 108 => "1100", 
    109 => "0101", 110 => "1011", 111 to 113=> "0000", 114 => "1011", 115 => "0000", 
    116 => "1101", 117 => "0000", 118 to 119=> "0101", 120 => "1000", 121 => "0100", 
    122 => "0000", 123 => "1001", 124 => "0000", 125 => "0001", 126 => "0011", 
    127 => "0000", 128 => "1011", 129 => "1000", 130 => "0000", 131 => "0110", 
    132 to 133=> "0000", 134 => "0111", 135 to 136=> "0000", 137 to 138=> "0111", 139 to 140=> "0000", 
    141 to 142=> "1010", 143 => "0101", 144 => "0000", 145 => "0100", 146 => "1100", 
    147 => "0110", 148 to 149=> "0000", 150 => "1000", 151 => "0100", 152 => "0011", 
    153 to 154=> "0000", 155 => "1010", 156 => "0111", 157 => "0000", 158 => "1011", 
    159 => "0111", 160 => "0011", 161 to 162=> "0000", 163 => "1101", 164 => "0000", 
    165 => "0111", 166 to 167=> "0000", 168 => "0010", 169 to 172=> "0000", 173 => "1001", 
    174 => "0001", 175 => "0000", 176 => "0100", 177 => "0000", 178 => "1010", 
    179 => "1001", 180 to 183=> "0000", 184 => "0111", 185 to 194=> "0000" );

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

entity predict_ensemble_cnw is
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

architecture arch of predict_ensemble_cnw is
    component predict_ensemble_cnw_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cnw_rom_U :  component predict_ensemble_cnw_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


