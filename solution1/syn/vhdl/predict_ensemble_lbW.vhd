-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_lbW_rom is 
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


architecture rtl of predict_ensemble_lbW_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 to 6=> "0", 7 to 10=> "1", 11 to 12=> "0", 13 => "1", 14 => "0", 
    15 to 16=> "1", 17 to 18=> "0", 19 => "1", 20 to 28=> "0", 29 to 32=> "1", 33 to 35=> "0", 36 to 37=> "1", 
    38 => "0", 39 to 46=> "1", 47 to 48=> "0", 49 to 50=> "1", 51 to 53=> "0", 54 => "1", 55 to 59=> "0", 
    60 => "1", 61 => "0", 62 to 66=> "1", 67 to 69=> "0", 70 to 72=> "1", 73 to 75=> "0", 76 => "1", 
    77 to 78=> "0", 79 => "1", 80 => "0", 81 => "1", 82 to 84=> "0", 85 => "1", 86 to 91=> "0", 
    92 to 93=> "1", 94 to 95=> "0", 96 => "1", 97 to 98=> "0", 99 to 100=> "1", 101 => "0", 102 to 103=> "1", 
    104 to 105=> "0", 106 => "1", 107 to 108=> "0", 109 to 113=> "1", 114 => "0", 115 => "1", 116 => "0", 
    117 => "1", 118 => "0", 119 => "1", 120 to 122=> "0", 123 to 124=> "1", 125 to 126=> "0", 127 to 128=> "1", 
    129 to 130=> "0", 131 to 133=> "1", 134 => "0", 135 => "1", 136 => "0", 137 to 140=> "1", 141 to 144=> "0", 
    145 => "1", 146 => "0", 147 to 150=> "1", 151 to 152=> "0", 153 to 155=> "1", 156 to 158=> "0", 159 to 161=> "1", 
    162 to 163=> "0", 164 to 168=> "1", 169 to 170=> "0", 171 to 172=> "1", 173 to 174=> "0", 175 => "1", 176 => "0", 
    177 to 181=> "1", 182 => "0", 183 to 184=> "1", 185 to 194=> "0" );

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

entity predict_ensemble_lbW is
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

architecture arch of predict_ensemble_lbW is
    component predict_ensemble_lbW_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_lbW_rom_U :  component predict_ensemble_lbW_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


