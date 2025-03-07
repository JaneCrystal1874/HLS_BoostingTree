-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b2s_rom is 
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


architecture rtl of predict_ensemble_b2s_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 => "0", 5 => "1", 6 => "0", 
    7 => "1", 8 to 10=> "0", 11 => "1", 12 to 13=> "0", 14 to 16=> "1", 17 => "0", 18 => "1", 
    19 => "0", 20 => "1", 21 => "0", 22 => "1", 23 => "0", 24 => "1", 25 to 26=> "0", 
    27 to 29=> "1", 30 to 31=> "0", 32 => "1", 33 => "0", 34 => "1", 35 to 36=> "0", 37 => "1", 
    38 => "0", 39 => "1", 40 => "0", 41 to 42=> "1", 43 => "0", 44 => "1", 45 => "0", 
    46 to 47=> "1", 48 to 49=> "0", 50 => "1", 51 to 52=> "0", 53 => "1", 54 to 57=> "0", 58 => "1", 
    59 => "0", 60 => "1", 61 => "0", 62 => "1", 63 to 65=> "0", 66 => "1", 67 => "0", 
    68 to 72=> "1", 73 => "0", 74 to 75=> "1", 76 to 78=> "0", 79 to 80=> "1", 81 to 83=> "0", 84 => "1", 
    85 => "0", 86 => "1", 87 to 88=> "0", 89 to 91=> "1", 92 to 93=> "0", 94 => "1", 95 to 96=> "0", 
    97 to 98=> "1", 99 to 100=> "0", 101 => "1", 102 => "0", 103 => "1", 104 => "0", 105 => "1", 
    106 => "0", 107 to 109=> "1", 110 to 111=> "0", 112 to 115=> "1", 116 to 117=> "0", 118 to 121=> "1", 122 => "0", 
    123 => "1", 124 => "0", 125 => "1", 126 to 132=> "0", 133 => "1", 134 to 135=> "0", 136 to 138=> "1", 
    139 to 141=> "0", 142 to 146=> "1", 147 to 148=> "0", 149 to 150=> "1", 151 to 154=> "0", 155 to 156=> "1", 157 to 158=> "0", 
    159 to 162=> "1", 163 => "0", 164 to 165=> "1", 166 => "0", 167 => "1", 168 to 171=> "0", 172 to 173=> "1", 
    174 => "0", 175 to 180=> "1", 181 to 194=> "0" );

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

entity predict_ensemble_b2s is
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

architecture arch of predict_ensemble_b2s is
    component predict_ensemble_b2s_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b2s_rom_U :  component predict_ensemble_b2s_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


