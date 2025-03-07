-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eRU_rom is 
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


architecture rtl of predict_ensemble_eRU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 5=> "0", 6 => "1", 7 => "0", 8 => "1", 9 => "0", 
    10 => "1", 11 => "0", 12 => "1", 13 => "0", 14 => "1", 15 => "0", 16 => "1", 
    17 to 18=> "0", 19 to 23=> "1", 24 => "0", 25 => "1", 26 => "0", 27 => "1", 28 to 29=> "0", 
    30 to 31=> "1", 32 to 39=> "0", 40 => "1", 41 => "0", 42 to 46=> "1", 47 => "0", 48 to 50=> "1", 
    51 to 53=> "0", 54 to 57=> "1", 58 => "0", 59 => "1", 60 to 62=> "0", 63 to 65=> "1", 66 to 68=> "0", 
    69 => "1", 70 => "0", 71 => "1", 72 to 74=> "0", 75 => "1", 76 to 78=> "0", 79 to 81=> "1", 
    82 to 83=> "0", 84 to 86=> "1", 87 => "0", 88 => "1", 89 to 90=> "0", 91 => "1", 92 => "0", 
    93 => "1", 94 to 95=> "0", 96 to 97=> "1", 98 => "0", 99 => "1", 100 to 101=> "0", 102 to 103=> "1", 
    104 => "0", 105 => "1", 106 to 107=> "0", 108 to 109=> "1", 110 to 112=> "0", 113 to 115=> "1", 116 to 121=> "0", 
    122 to 123=> "1", 124 => "0", 125 to 129=> "1", 130 to 131=> "0", 132 to 135=> "1", 136 => "0", 137 => "1", 
    138 to 141=> "0", 142 => "1", 143 => "0", 144 to 146=> "1", 147 to 148=> "0", 149 => "1", 150 => "0", 
    151 to 152=> "1", 153 to 155=> "0", 156 => "1", 157 to 158=> "0", 159 to 162=> "1", 163 to 165=> "0", 166 => "1", 
    167 => "0", 168 to 170=> "1", 171 to 172=> "0", 173 to 178=> "1", 179 to 194=> "0" );

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

entity predict_ensemble_eRU is
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

architecture arch of predict_ensemble_eRU is
    component predict_ensemble_eRU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eRU_rom_U :  component predict_ensemble_eRU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


