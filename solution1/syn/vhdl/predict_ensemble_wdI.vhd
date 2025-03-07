-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_wdI_rom is 
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


architecture rtl of predict_ensemble_wdI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "0111", 2 to 3=> "0000", 4 => "1001", 5 => "0000", 
    6 => "1011", 7 => "0011", 8 to 9=> "1011", 10 => "0111", 11 => "0000", 
    12 => "1011", 13 => "0011", 14 to 17=> "0000", 18 => "1011", 19 to 20=> "0000", 
    21 => "0101", 22 => "1010", 23 => "0011", 24 => "0000", 25 => "1010", 
    26 to 28=> "0000", 29 => "0110", 30 => "0000", 31 => "1100", 32 => "0001", 
    33 => "1100", 34 => "1011", 35 => "0000", 36 => "0010", 37 => "0110", 
    38 => "0000", 39 => "0011", 40 => "1010", 41 to 46=> "0000", 47 => "1100", 
    48 => "0101", 49 => "0000", 50 => "1100", 51 => "0011", 52 => "0000", 
    53 => "1100", 54 => "1101", 55 => "1011", 56 => "0000", 57 => "1100", 
    58 to 60=> "0000", 61 => "1001", 62 => "0100", 63 => "0000", 64 => "1010", 
    65 => "1000", 66 => "1011", 67 => "0111", 68 => "0000", 69 => "1010", 
    70 => "0111", 71 to 72=> "0000", 73 => "1011", 74 => "0000", 75 => "0011", 
    76 => "0111", 77 to 78=> "0000", 79 => "0110", 80 => "0000", 81 => "1001", 
    82 => "1011", 83 => "0000", 84 => "0001", 85 => "0110", 86 to 93=> "0000", 
    94 => "1010", 95 => "0100", 96 => "1100", 97 to 98=> "0000", 99 => "0001", 
    100 => "1010", 101 => "0000", 102 => "1100", 103 => "0001", 104 => "0011", 
    105 => "0000", 106 => "0011", 107 => "0000", 108 to 109=> "0100", 110 => "0000", 
    111 => "0100", 112 => "0000", 113 => "1001", 114 to 117=> "0000", 118 => "0100", 
    119 to 120=> "0000", 121 to 122=> "1001", 123 => "0101", 124 => "0000", 125 => "0111", 
    126 => "0000", 127 => "0011", 128 => "0000", 129 => "0101", 130 => "1101", 
    131 => "1010", 132 => "0100", 133 => "0000", 134 => "1010", 135 to 137=> "0000", 
    138 => "1000", 139 to 140=> "0000", 141 => "0001", 142 => "0111", 143 to 144=> "0000", 
    145 => "0111", 146 => "0000", 147 => "1000", 148 => "0000", 149 => "1010", 
    150 to 151=> "1001", 152 => "0000", 153 => "1011", 154 => "0000", 155 => "0100", 
    156 to 157=> "0000", 158 to 159=> "0010", 160 => "0000", 161 => "0111", 162 => "1011", 
    163 to 167=> "0000", 168 => "1000", 169 => "0100", 170 => "0110", 171 => "0101", 
    172 to 175=> "0000", 176 => "0010", 177 => "0101", 178 => "1001", 179 to 180=> "0000", 
    181 => "0001", 182 to 185=> "0000", 186 => "0101", 187 to 194=> "0000" );

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

entity predict_ensemble_wdI is
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

architecture arch of predict_ensemble_wdI is
    component predict_ensemble_wdI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_wdI_rom_U :  component predict_ensemble_wdI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


