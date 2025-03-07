-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_edO_rom is 
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


architecture rtl of predict_ensemble_edO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 to 6=> "0", 7 => "1", 8 => "0", 9 => "1", 10 => "0", 
    11 => "1", 12 => "0", 13 => "1", 14 to 16=> "0", 17 to 19=> "1", 20 to 21=> "0", 22 => "1", 
    23 => "0", 24 to 26=> "1", 27 => "0", 28 to 29=> "1", 30 => "0", 31 => "1", 32 to 35=> "0", 
    36 => "1", 37 => "0", 38 to 39=> "1", 40 to 43=> "0", 44 to 45=> "1", 46 => "0", 47 => "1", 
    48 to 49=> "0", 50 to 51=> "1", 52 => "0", 53 => "1", 54 => "0", 55 to 59=> "1", 60 => "0", 
    61 => "1", 62 to 64=> "0", 65 => "1", 66 to 67=> "0", 68 to 69=> "1", 70 to 72=> "0", 73 to 75=> "1", 
    76 => "0", 77 to 78=> "1", 79 to 81=> "0", 82 to 84=> "1", 85 to 89=> "0", 90 => "1", 91 => "0", 
    92 => "1", 93 => "0", 94 to 96=> "1", 97 => "0", 98 => "1", 99 to 101=> "0", 102 to 105=> "1", 
    106 => "0", 107 to 108=> "1", 109 => "0", 110 to 111=> "1", 112 to 116=> "0", 117 to 118=> "1", 119 to 120=> "0", 
    121 to 123=> "1", 124 => "0", 125 to 128=> "1", 129 => "0", 130 to 131=> "1", 132 => "0", 133 => "1", 
    134 to 136=> "0", 137 to 139=> "1", 140 => "0", 141 => "1", 142 to 146=> "0", 147 to 148=> "1", 149 => "0", 
    150 to 152=> "1", 153 => "0", 154 => "1", 155 => "0", 156 => "1", 157 => "0", 158 => "1", 
    159 => "0", 160 to 161=> "1", 162 to 165=> "0", 166 to 168=> "1", 169 => "0", 170 to 172=> "1", 173 to 194=> "0" );

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

entity predict_ensemble_edO is
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

architecture arch of predict_ensemble_edO is
    component predict_ensemble_edO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_edO_rom_U :  component predict_ensemble_edO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


