-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b7t_rom is 
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


architecture rtl of predict_ensemble_b7t_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 => "0", 5 => "1", 6 to 7=> "0", 
    8 => "1", 9 to 10=> "0", 11 to 12=> "1", 13 => "0", 14 to 15=> "1", 16 to 18=> "0", 19 to 21=> "1", 
    22 to 23=> "0", 24 => "1", 25 => "0", 26 => "1", 27 to 28=> "0", 29 => "1", 30 => "0", 
    31 => "1", 32 to 33=> "0", 34 to 35=> "1", 36 => "0", 37 => "1", 38 to 39=> "0", 40 to 41=> "1", 
    42 => "0", 43 => "1", 44 to 45=> "0", 46 => "1", 47 to 49=> "0", 50 => "1", 51 => "0", 
    52 => "1", 53 => "0", 54 => "1", 55 to 56=> "0", 57 => "1", 58 => "0", 59 => "1", 
    60 => "0", 61 => "1", 62 => "0", 63 to 65=> "1", 66 to 67=> "0", 68 to 73=> "1", 74 to 75=> "0", 
    76 => "1", 77 to 80=> "0", 81 to 83=> "1", 84 to 86=> "0", 87 => "1", 88 to 89=> "0", 90 => "1", 
    91 to 92=> "0", 93 => "1", 94 to 95=> "0", 96 to 98=> "1", 99 to 101=> "0", 102 to 105=> "1", 106 => "0", 
    107 => "1", 108 => "0", 109 => "1", 110 => "0", 111 to 112=> "1", 113 => "0", 114 => "1", 
    115 => "0", 116 => "1", 117 to 118=> "0", 119 => "1", 120 => "0", 121 => "1", 122 => "0", 
    123 => "1", 124 => "0", 125 to 126=> "1", 127 to 129=> "0", 130 to 131=> "1", 132 to 134=> "0", 135 to 136=> "1", 
    137 to 138=> "0", 139 to 141=> "1", 142 to 143=> "0", 144 to 146=> "1", 147 to 148=> "0", 149 to 150=> "1", 151 => "0", 
    152 to 154=> "1", 155 => "0", 156 => "1", 157 to 158=> "0", 159 => "1", 160 => "0", 161 => "1", 
    162 to 163=> "0", 164 to 165=> "1", 166 to 168=> "0", 169 to 173=> "1", 174 => "0", 175 => "1", 176 to 177=> "0", 
    178 to 179=> "1", 180 to 182=> "0", 183 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_b7t is
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

architecture arch of predict_ensemble_b7t is
    component predict_ensemble_b7t_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b7t_rom_U :  component predict_ensemble_b7t_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


