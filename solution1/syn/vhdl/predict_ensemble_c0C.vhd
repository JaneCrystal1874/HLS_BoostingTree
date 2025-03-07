-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c0C_rom is 
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


architecture rtl of predict_ensemble_c0C_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 to 4=> "0", 5 => "1", 6 => "0", 7 => "1", 8 to 10=> "0", 
    11 => "1", 12 => "0", 13 => "1", 14 => "0", 15 to 17=> "1", 18 => "0", 19 => "1", 
    20 => "0", 21 to 23=> "1", 24 => "0", 25 => "1", 26 => "0", 27 => "1", 28 to 29=> "0", 
    30 => "1", 31 => "0", 32 => "1", 33 => "0", 34 => "1", 35 => "0", 36 => "1", 
    37 to 38=> "0", 39 to 41=> "1", 42 to 43=> "0", 44 => "1", 45 => "0", 46 => "1", 47 to 49=> "0", 
    50 to 51=> "1", 52 => "0", 53 => "1", 54 => "0", 55 to 56=> "1", 57 => "0", 58 to 59=> "1", 
    60 => "0", 61 => "1", 62 to 63=> "0", 64 => "1", 65 to 67=> "0", 68 => "1", 69 => "0", 
    70 to 71=> "1", 72 => "0", 73 => "1", 74 => "0", 75 => "1", 76 => "0", 77 => "1", 
    78 to 79=> "0", 80 to 81=> "1", 82 to 83=> "0", 84 => "1", 85 to 87=> "0", 88 to 89=> "1", 90 to 93=> "0", 
    94 to 96=> "1", 97 => "0", 98 to 99=> "1", 100 to 101=> "0", 102 to 104=> "1", 105 to 106=> "0", 107 to 110=> "1", 
    111 => "0", 112 to 113=> "1", 114 => "0", 115 => "1", 116 to 122=> "0", 123 to 124=> "1", 125 to 127=> "0", 
    128 to 131=> "1", 132 => "0", 133 to 135=> "1", 136 to 137=> "0", 138 => "1", 139 to 140=> "0", 141 to 142=> "1", 
    143 to 144=> "0", 145 to 147=> "1", 148 => "0", 149 => "1", 150 => "0", 151 => "1", 152 => "0", 
    153 to 154=> "1", 155 => "0", 156 => "1", 157 to 159=> "0", 160 to 162=> "1", 163 => "0", 164 => "1", 
    165 => "0", 166 to 167=> "1", 168 to 169=> "0", 170 => "1", 171 => "0", 172 => "1", 173 to 174=> "0", 
    175 => "1", 176 => "0", 177 to 180=> "1", 181 to 194=> "0" );

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

entity predict_ensemble_c0C is
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

architecture arch of predict_ensemble_c0C is
    component predict_ensemble_c0C_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c0C_rom_U :  component predict_ensemble_c0C_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


