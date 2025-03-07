-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dOK_rom is 
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


architecture rtl of predict_ensemble_dOK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 to 4=> "0", 5 => "1", 6 => "0", 7 => "1", 8 to 9=> "0", 
    10 to 11=> "1", 12 => "0", 13 => "1", 14 to 15=> "0", 16 to 17=> "1", 18 to 19=> "0", 20 to 21=> "1", 
    22 => "0", 23 to 25=> "1", 26 to 27=> "0", 28 to 29=> "1", 30 to 35=> "0", 36 to 37=> "1", 38 => "0", 
    39 to 40=> "1", 41 => "0", 42 to 43=> "1", 44 to 45=> "0", 46 => "1", 47 to 51=> "0", 52 to 53=> "1", 
    54 to 55=> "0", 56 => "1", 57 to 58=> "0", 59 to 62=> "1", 63 to 64=> "0", 65 to 67=> "1", 68 to 71=> "0", 
    72 => "1", 73 => "0", 74 => "1", 75 to 76=> "0", 77 => "1", 78 => "0", 79 to 80=> "1", 
    81 => "0", 82 to 84=> "1", 85 => "0", 86 to 87=> "1", 88 => "0", 89 => "1", 90 => "0", 
    91 to 93=> "1", 94 => "0", 95 => "1", 96 => "0", 97 to 98=> "1", 99 to 101=> "0", 102 => "1", 
    103 to 104=> "0", 105 to 106=> "1", 107 => "0", 108 to 109=> "1", 110 to 111=> "0", 112 to 114=> "1", 115 => "0", 
    116 => "1", 117 => "0", 118 => "1", 119 to 120=> "0", 121 => "1", 122 to 124=> "0", 125 => "1", 
    126 => "0", 127 to 128=> "1", 129 => "0", 130 to 131=> "1", 132 to 135=> "0", 136 => "1", 137 => "0", 
    138 to 142=> "1", 143 => "0", 144 => "1", 145 => "0", 146 => "1", 147 => "0", 148 to 149=> "1", 
    150 to 151=> "0", 152 to 153=> "1", 154 => "0", 155 => "1", 156 to 159=> "0", 160 to 162=> "1", 163 to 166=> "0", 
    167 => "1", 168 to 169=> "0", 170 to 171=> "1", 172 => "0", 173 to 176=> "1", 177 => "0", 178 to 180=> "1", 
    181 to 194=> "0" );

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

entity predict_ensemble_dOK is
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

architecture arch of predict_ensemble_dOK is
    component predict_ensemble_dOK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dOK_rom_U :  component predict_ensemble_dOK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


