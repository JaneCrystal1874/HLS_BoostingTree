-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eiP_rom is 
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


architecture rtl of predict_ensemble_eiP_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 => "1", 6 to 9=> "0", 10 => "1", 11 => "0", 
    12 to 13=> "1", 14 => "0", 15 to 16=> "1", 17 => "0", 18 to 21=> "1", 22 => "0", 23 => "1", 
    24 to 25=> "0", 26 => "1", 27 to 31=> "0", 32 to 33=> "1", 34 to 36=> "0", 37 to 42=> "1", 43 to 45=> "0", 
    46 to 47=> "1", 48 to 50=> "0", 51 to 53=> "1", 54 => "0", 55 => "1", 56 => "0", 57 => "1", 
    58 to 59=> "0", 60 => "1", 61 to 65=> "0", 66 to 68=> "1", 69 to 70=> "0", 71 to 72=> "1", 73 => "0", 
    74 to 75=> "1", 76 => "0", 77 to 79=> "1", 80 to 81=> "0", 82 to 83=> "1", 84 => "0", 85 => "1", 
    86 => "0", 87 => "1", 88 => "0", 89 => "1", 90 => "0", 91 => "1", 92 => "0", 
    93 to 94=> "1", 95 => "0", 96 => "1", 97 => "0", 98 => "1", 99 => "0", 100 to 101=> "1", 
    102 to 104=> "0", 105 to 107=> "1", 108 => "0", 109 => "1", 110 to 111=> "0", 112 => "1", 113 => "0", 
    114 => "1", 115 to 119=> "0", 120 => "1", 121 to 122=> "0", 123 => "1", 124 to 125=> "0", 126 => "1", 
    127 => "0", 128 => "1", 129 => "0", 130 to 132=> "1", 133 => "0", 134 to 137=> "1", 138 to 140=> "0", 
    141 to 142=> "1", 143 to 144=> "0", 145 => "1", 146 => "0", 147 to 148=> "1", 149 to 151=> "0", 152 to 155=> "1", 
    156 => "0", 157 => "1", 158 to 159=> "0", 160 to 162=> "1", 163 => "0", 164 => "1", 165 => "0", 
    166 => "1", 167 to 169=> "0", 170 to 174=> "1", 175 to 194=> "0" );

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

entity predict_ensemble_eiP is
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

architecture arch of predict_ensemble_eiP is
    component predict_ensemble_eiP_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eiP_rom_U :  component predict_ensemble_eiP_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


