-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bom_rom is 
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


architecture rtl of predict_ensemble_bom_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 7=> "1", 8 to 9=> "0", 10 => "1", 11 to 14=> "0", 
    15 to 16=> "1", 17 to 18=> "0", 19 => "1", 20 => "0", 21 => "1", 22 to 25=> "0", 26 to 27=> "1", 
    28 to 33=> "0", 34 => "1", 35 => "0", 36 => "1", 37 => "0", 38 to 39=> "1", 40 => "0", 
    41 to 43=> "1", 44 => "0", 45 to 46=> "1", 47 => "0", 48 => "1", 49 to 51=> "0", 52 => "1", 
    53 => "0", 54 to 56=> "1", 57 => "0", 58 => "1", 59 => "0", 60 to 62=> "1", 63 to 64=> "0", 
    65 => "1", 66 => "0", 67 => "1", 68 to 71=> "0", 72 to 73=> "1", 74 => "0", 75 => "1", 
    76 => "0", 77 => "1", 78 to 81=> "0", 82 to 83=> "1", 84 to 85=> "0", 86 to 88=> "1", 89 => "0", 
    90 to 91=> "1", 92 to 93=> "0", 94 => "1", 95 => "0", 96 => "1", 97 to 98=> "0", 99 => "1", 
    100 => "0", 101 => "1", 102 to 104=> "0", 105 => "1", 106 to 107=> "0", 108 to 111=> "1", 112 to 113=> "0", 
    114 => "1", 115 to 116=> "0", 117 to 120=> "1", 121 to 122=> "0", 123 to 124=> "1", 125 => "0", 126 to 128=> "1", 
    129 => "0", 130 to 131=> "1", 132 => "0", 133 => "1", 134 to 138=> "0", 139 to 140=> "1", 141 to 142=> "0", 
    143 to 145=> "1", 146 to 147=> "0", 148 => "1", 149 to 150=> "0", 151 => "1", 152 to 156=> "0", 157 to 159=> "1", 
    160 => "0", 161 to 167=> "1", 168 => "0", 169 to 170=> "1", 171 => "0", 172 to 178=> "1", 179 to 194=> "0" );

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

entity predict_ensemble_bom is
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

architecture arch of predict_ensemble_bom is
    component predict_ensemble_bom_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bom_rom_U :  component predict_ensemble_bom_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


