-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e1W_rom is 
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


architecture rtl of predict_ensemble_e1W_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 to 5=> "0", 6 => "1", 7 => "0", 8 => "1", 9 to 10=> "0", 
    11 => "1", 12 to 13=> "0", 14 => "1", 15 to 17=> "0", 18 to 19=> "1", 20 to 21=> "0", 22 to 23=> "1", 
    24 to 25=> "0", 26 to 27=> "1", 28 => "0", 29 to 30=> "1", 31 => "0", 32 to 34=> "1", 35 => "0", 
    36 => "1", 37 => "0", 38 => "1", 39 => "0", 40 => "1", 41 => "0", 42 to 43=> "1", 
    44 => "0", 45 => "1", 46 to 48=> "0", 49 => "1", 50 => "0", 51 to 55=> "1", 56 => "0", 
    57 => "1", 58 to 59=> "0", 60 => "1", 61 to 63=> "0", 64 to 65=> "1", 66 to 72=> "0", 73 to 76=> "1", 
    77 to 78=> "0", 79 => "1", 80 to 82=> "0", 83 to 84=> "1", 85 => "0", 86 to 88=> "1", 89 => "0", 
    90 to 92=> "1", 93 => "0", 94 to 95=> "1", 96 to 99=> "0", 100 => "1", 101 => "0", 102 => "1", 
    103 => "0", 104 => "1", 105 to 107=> "0", 108 to 112=> "1", 113 => "0", 114 => "1", 115 => "0", 
    116 to 118=> "1", 119 to 121=> "0", 122 => "1", 123 => "0", 124 to 125=> "1", 126 to 127=> "0", 128 => "1", 
    129 to 132=> "0", 133 => "1", 134 => "0", 135 => "1", 136 => "0", 137 => "1", 138 => "0", 
    139 => "1", 140 => "0", 141 to 145=> "1", 146 to 147=> "0", 148 => "1", 149 => "0", 150 => "1", 
    151 => "0", 152 => "1", 153 => "0", 154 => "1", 155 to 157=> "0", 158 to 162=> "1", 163 to 165=> "0", 
    166 to 168=> "1", 169 => "0", 170 => "1", 171 to 172=> "0", 173 to 176=> "1", 177 to 194=> "0" );

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

entity predict_ensemble_e1W is
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

architecture arch of predict_ensemble_e1W is
    component predict_ensemble_e1W_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e1W_rom_U :  component predict_ensemble_e1W_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


