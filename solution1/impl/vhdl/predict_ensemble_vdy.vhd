-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_vdy_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_vdy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 to 3=> "1", 4 => "0", 5 => "1", 6 to 10=> "0", 11 => "1", 12 to 13=> "0", 
    14 to 17=> "1", 18 => "0", 19 to 20=> "1", 21 to 23=> "0", 24 => "1", 25 => "0", 26 to 28=> "1", 
    29 => "0", 30 => "1", 31 to 34=> "0", 35 => "1", 36 to 37=> "0", 38 => "1", 39 to 40=> "0", 
    41 to 46=> "1", 47 to 48=> "0", 49 => "1", 50 to 51=> "0", 52 => "1", 53 to 55=> "0", 56 => "1", 
    57 => "0", 58 to 60=> "1", 61 to 62=> "0", 63 => "1", 64 to 67=> "0", 68 => "1", 69 to 70=> "0", 
    71 to 72=> "1", 73 => "0", 74 => "1", 75 to 76=> "0", 77 to 78=> "1", 79 => "0", 80 => "1", 
    81 to 82=> "0", 83 => "1", 84 to 85=> "0", 86 to 93=> "1", 94 to 96=> "0", 97 to 98=> "1", 99 to 100=> "0", 
    101 => "1", 102 to 104=> "0", 105 => "1", 106 => "0", 107 => "1", 108 to 109=> "0", 110 => "1", 
    111 => "0", 112 => "1", 113 => "0", 114 to 117=> "1", 118 => "0", 119 to 120=> "1", 121 to 123=> "0", 
    124 => "1", 125 => "0", 126 => "1", 127 => "0", 128 => "1", 129 to 132=> "0", 133 => "1", 
    134 => "0", 135 to 137=> "1", 138 => "0", 139 to 140=> "1", 141 to 142=> "0", 143 to 144=> "1", 145 => "0", 
    146 => "1", 147 => "0", 148 => "1", 149 to 151=> "0", 152 => "1", 153 => "0", 154 => "1", 
    155 => "0", 156 to 157=> "1", 158 to 159=> "0", 160 => "1", 161 to 162=> "0", 163 to 167=> "1", 168 to 171=> "0", 
    172 to 175=> "1", 176 to 178=> "0", 179 to 180=> "1", 181 => "0", 182 to 185=> "1", 186 => "0", 187 to 190=> "1", 
    191 to 194=> "0" );

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

entity predict_ensemble_vdy is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_vdy is
    component predict_ensemble_vdy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_vdy_rom_U :  component predict_ensemble_vdy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


