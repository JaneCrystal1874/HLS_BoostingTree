-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dTL_rom is 
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


architecture rtl of predict_ensemble_dTL_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 6=> "1", 7 => "0", 8 => "1", 9 to 11=> "0", 
    12 => "1", 13 => "0", 14 => "1", 15 => "0", 16 to 17=> "1", 18 => "0", 19 => "1", 
    20 to 21=> "0", 22 => "1", 23 => "0", 24 to 25=> "1", 26 => "0", 27 => "1", 28 => "0", 
    29 => "1", 30 => "0", 31 => "1", 32 => "0", 33 => "1", 34 => "0", 35 to 37=> "1", 
    38 to 39=> "0", 40 to 41=> "1", 42 to 43=> "0", 44 => "1", 45 to 47=> "0", 48 to 51=> "1", 52 => "0", 
    53 => "1", 54 => "0", 55 => "1", 56 to 59=> "0", 60 => "1", 61 to 65=> "0", 66 to 67=> "1", 
    68 => "0", 69 to 71=> "1", 72 to 78=> "0", 79 to 80=> "1", 81 => "0", 82 => "1", 83 => "0", 
    84 to 85=> "1", 86 => "0", 87 to 90=> "1", 91 to 92=> "0", 93 to 95=> "1", 96 => "0", 97 => "1", 
    98 => "0", 99 => "1", 100 to 103=> "0", 104 to 105=> "1", 106 => "0", 107 to 109=> "1", 110 to 112=> "0", 
    113 to 114=> "1", 115 to 116=> "0", 117 to 119=> "1", 120 to 121=> "0", 122 => "1", 123 => "0", 124 to 125=> "1", 
    126 to 127=> "0", 128 => "1", 129 => "0", 130 to 131=> "1", 132 to 134=> "0", 135 => "1", 136 => "0", 
    137 to 138=> "1", 139 => "0", 140 to 141=> "1", 142 => "0", 143 to 147=> "1", 148 to 149=> "0", 150 => "1", 
    151 to 154=> "0", 155 to 156=> "1", 157 => "0", 158 to 160=> "1", 161 to 163=> "0", 164 to 165=> "1", 166 to 167=> "0", 
    168 to 171=> "1", 172 => "0", 173 => "1", 174 => "0", 175 to 176=> "1", 177 to 194=> "0" );

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

entity predict_ensemble_dTL is
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

architecture arch of predict_ensemble_dTL is
    component predict_ensemble_dTL_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dTL_rom_U :  component predict_ensemble_dTL_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


