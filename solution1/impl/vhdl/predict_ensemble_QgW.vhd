-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_QgW_rom is 
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


architecture rtl of predict_ensemble_QgW_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "1000", 2 => "0011", 3 => "1001", 4 => "0000", 5 => "0101", 
    6 => "0100", 7 => "0000", 8 => "0111", 9 to 13=> "0000", 14 => "1010", 
    15 => "1000", 16 => "0000", 17 => "1011", 18 => "0000", 19 => "0001", 
    20 => "1011", 21 => "0000", 22 => "1011", 23 => "0000", 24 => "1011", 
    25 to 27=> "0000", 28 => "0100", 29 => "0111", 30 => "0110", 31 to 33=> "0000", 
    34 => "0111", 35 => "0011", 36 => "0111", 37 to 38=> "0000", 39 => "0011", 
    40 => "0010", 41 => "1010", 42 => "0000", 43 => "1100", 44 => "1011", 
    45 => "0001", 46 => "0000", 47 => "1101", 48 => "0000", 49 => "0110", 
    50 => "1100", 51 to 52=> "0000", 53 => "0011", 54 to 56=> "0000", 57 => "1010", 
    58 => "1100", 59 to 60=> "0000", 61 => "1100", 62 to 64=> "0000", 65 => "0100", 
    66 => "1011", 67 => "0011", 68 to 69=> "0000", 70 => "1101", 71 => "0001", 
    72 => "0111", 73 to 74=> "1101", 75 => "0101", 76 to 77=> "0000", 78 => "0001", 
    79 => "0110", 80 to 81=> "0000", 82 => "0101", 83 => "0000", 84 => "0101", 
    85 to 88=> "0000", 89 => "1011", 90 => "0001", 91 => "0010", 92 => "0011", 
    93 to 94=> "0000", 95 to 96=> "0100", 97 to 98=> "0000", 99 => "0010", 100 => "0000", 
    101 => "1010", 102 to 106=> "0000", 107 => "0011", 108 => "0001", 109 => "0000", 
    110 => "0100", 111 to 112=> "0011", 113 to 115=> "0000", 116 => "1011", 117 => "0010", 
    118 => "1100", 119 => "0000", 120 => "0001", 121 to 122=> "0000", 123 => "1011", 
    124 => "0000", 125 => "0001", 126 => "0010", 127 => "0011", 128 => "0110", 
    129 to 131=> "0000", 132 to 133=> "1001", 134 => "0010", 135 to 139=> "0000", 140 => "0011", 
    141 => "0010", 142 => "1100", 143 => "0011", 144 => "0101", 145 => "0001", 
    146 => "1010", 147 => "0000", 148 => "0010", 149 => "0000", 150 => "0111", 
    151 => "1000", 152 => "0000", 153 => "0001", 154 => "0101", 155 => "0000", 
    156 => "1100", 157 to 160=> "0000", 161 => "0011", 162 to 167=> "0000", 168 => "0010", 
    169 to 170=> "0000", 171 => "1100", 172 => "0001", 173 => "0000", 174 => "0001", 
    175 => "0000", 176 => "1000", 177 to 194=> "0000" );

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

entity predict_ensemble_QgW is
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

architecture arch of predict_ensemble_QgW is
    component predict_ensemble_QgW_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_QgW_rom_U :  component predict_ensemble_QgW_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


