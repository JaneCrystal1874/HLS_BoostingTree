-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_byn_rom is 
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


architecture rtl of predict_ensemble_byn_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 7=> "0", 8 to 9=> "1", 10 => "0", 
    11 => "1", 12 => "0", 13 => "1", 14 => "0", 15 => "1", 16 => "0", 17 => "1", 
    18 => "0", 19 to 20=> "1", 21 to 22=> "0", 23 to 24=> "1", 25 to 26=> "0", 27 to 29=> "1", 30 to 31=> "0", 
    32 => "1", 33 => "0", 34 => "1", 35 to 38=> "0", 39 to 43=> "1", 44 => "0", 45 => "1", 
    46 to 48=> "0", 49 => "1", 50 to 52=> "0", 53 to 54=> "1", 55 => "0", 56 to 59=> "1", 60 to 61=> "0", 
    62 => "1", 63 to 66=> "0", 67 to 68=> "1", 69 => "0", 70 => "1", 71 to 74=> "0", 75 to 77=> "1", 
    78 => "0", 79 to 82=> "1", 83 to 84=> "0", 85 => "1", 86 => "0", 87 => "1", 88 => "0", 
    89 to 90=> "1", 91 to 93=> "0", 94 to 96=> "1", 97 to 102=> "0", 103 to 105=> "1", 106 => "0", 107 => "1", 
    108 to 111=> "0", 112 to 113=> "1", 114 => "0", 115 to 116=> "1", 117 to 119=> "0", 120 to 122=> "1", 123 to 124=> "0", 
    125 => "1", 126 to 127=> "0", 128 => "1", 129 to 133=> "0", 134 => "1", 135 => "0", 136 => "1", 
    137 to 138=> "0", 139 to 142=> "1", 143 to 145=> "0", 146 to 147=> "1", 148 to 149=> "0", 150 to 151=> "1", 152 to 153=> "0", 
    154 to 155=> "1", 156 => "0", 157 => "1", 158 to 159=> "0", 160 => "1", 161 => "0", 162 to 164=> "1", 
    165 => "0", 166 to 170=> "1", 171 => "0", 172 => "1", 173 to 177=> "0", 178 => "1", 179 => "0", 
    180 => "1", 181 => "0", 182 to 192=> "1", 193 to 194=> "0" );

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

entity predict_ensemble_byn is
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

architecture arch of predict_ensemble_byn is
    component predict_ensemble_byn_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_byn_rom_U :  component predict_ensemble_byn_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


