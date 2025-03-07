-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d3M_rom is 
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


architecture rtl of predict_ensemble_d3M_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 5=> "0", 6 => "1", 7 to 10=> "0", 
    11 => "1", 12 => "0", 13 to 15=> "1", 16 to 17=> "0", 18 to 19=> "1", 20 to 24=> "0", 25 to 26=> "1", 
    27 => "0", 28 => "1", 29 => "0", 30 to 31=> "1", 32 => "0", 33 => "1", 34 to 35=> "0", 
    36 => "1", 37 to 38=> "0", 39 => "1", 40 => "0", 41 => "1", 42 => "0", 43 => "1", 
    44 => "0", 45 => "1", 46 to 47=> "0", 48 => "1", 49 => "0", 50 to 51=> "1", 52 => "0", 
    53 to 54=> "1", 55 to 56=> "0", 57 to 59=> "1", 60 => "0", 61 to 63=> "1", 64 => "0", 65 => "1", 
    66 => "0", 67 to 68=> "1", 69 to 71=> "0", 72 to 73=> "1", 74 => "0", 75 => "1", 76 => "0", 
    77 => "1", 78 => "0", 79 => "1", 80 to 82=> "0", 83 to 85=> "1", 86 to 88=> "0", 89 to 91=> "1", 
    92 => "0", 93 => "1", 94 => "0", 95 to 96=> "1", 97 => "0", 98 => "1", 99 to 102=> "0", 
    103 to 104=> "1", 105 to 106=> "0", 107 to 111=> "1", 112 to 113=> "0", 114 => "1", 115 to 116=> "0", 117 to 119=> "1", 
    120 to 121=> "0", 122 => "1", 123 to 128=> "0", 129 => "1", 130 => "0", 131 to 134=> "1", 135 => "0", 
    136 to 139=> "1", 140 to 145=> "0", 146 to 148=> "1", 149 => "0", 150 => "1", 151 to 152=> "0", 153 => "1", 
    154 => "0", 155 => "1", 156 to 157=> "0", 158 => "1", 159 => "0", 160 => "1", 161 => "0", 
    162 to 165=> "1", 166 => "0", 167 => "1", 168 to 169=> "0", 170 to 171=> "1", 172 to 173=> "0", 174 => "1", 
    175 => "0", 176 => "1", 177 => "0", 178 to 182=> "1", 183 to 194=> "0" );

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

entity predict_ensemble_d3M is
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

architecture arch of predict_ensemble_d3M is
    component predict_ensemble_d3M_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d3M_rom_U :  component predict_ensemble_d3M_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


