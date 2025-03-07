-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dYM_rom is 
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


architecture rtl of predict_ensemble_dYM_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 5=> "0", 6 to 7=> "1", 8 to 9=> "0", 10 => "1", 11 => "0", 
    12 to 14=> "1", 15 => "0", 16 to 17=> "1", 18 => "0", 19 => "1", 20 to 22=> "0", 23 to 25=> "1", 
    26 to 29=> "0", 30 to 31=> "1", 32 to 33=> "0", 34 to 35=> "1", 36 to 37=> "0", 38 to 39=> "1", 40 => "0", 
    41 to 42=> "1", 43 => "0", 44 to 45=> "1", 46 => "0", 47 => "1", 48 to 49=> "0", 50 => "1", 
    51 to 52=> "0", 53 to 55=> "1", 56 => "0", 57 => "1", 58 to 59=> "0", 60 => "1", 61 to 64=> "0", 
    65 to 66=> "1", 67 to 70=> "0", 71 to 74=> "1", 75 => "0", 76 => "1", 77 to 81=> "0", 82 => "1", 
    83 to 85=> "0", 86 => "1", 87 to 88=> "0", 89 to 90=> "1", 91 => "0", 92 to 93=> "1", 94 => "0", 
    95 to 96=> "1", 97 => "0", 98 to 101=> "1", 102 to 104=> "0", 105 to 106=> "1", 107 => "0", 108 to 110=> "1", 
    111 to 112=> "0", 113 to 114=> "1", 115 => "0", 116 to 117=> "1", 118 to 119=> "0", 120 => "1", 121 => "0", 
    122 to 123=> "1", 124 to 127=> "0", 128 to 131=> "1", 132 => "0", 133 to 135=> "1", 136 to 139=> "0", 140 => "1", 
    141 to 142=> "0", 143 => "1", 144 to 146=> "0", 147 => "1", 148 to 150=> "0", 151 to 153=> "1", 154 to 156=> "0", 
    157 => "1", 158 => "0", 159 to 162=> "1", 163 => "0", 164 => "1", 165 => "0", 166 to 169=> "1", 
    170 to 173=> "0", 174 to 175=> "1", 176 to 177=> "0", 178 to 181=> "1", 182 => "0", 183 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_dYM is
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

architecture arch of predict_ensemble_dYM is
    component predict_ensemble_dYM_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dYM_rom_U :  component predict_ensemble_dYM_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


