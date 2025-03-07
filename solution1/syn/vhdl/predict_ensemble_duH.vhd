-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_duH_rom is 
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


architecture rtl of predict_ensemble_duH_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 => "0", 4 to 5=> "1", 6 to 8=> "0", 9 => "1", 10 to 12=> "0", 
    13 => "1", 14 => "0", 15 to 16=> "1", 17 => "0", 18 => "1", 19 to 20=> "0", 21 => "1", 
    22 => "0", 23 to 25=> "1", 26 to 28=> "0", 29 => "1", 30 => "0", 31 => "1", 32 => "0", 
    33 to 34=> "1", 35 to 36=> "0", 37 => "1", 38 to 39=> "0", 40 => "1", 41 => "0", 42 to 43=> "1", 
    44 => "0", 45 to 46=> "1", 47 => "0", 48 to 49=> "1", 50 to 51=> "0", 52 => "1", 53 to 55=> "0", 
    56 to 57=> "1", 58 => "0", 59 => "1", 60 to 62=> "0", 63 to 65=> "1", 66 => "0", 67 => "1", 
    68 to 69=> "0", 70 => "1", 71 => "0", 72 to 73=> "1", 74 to 75=> "0", 76 => "1", 77 => "0", 
    78 to 81=> "1", 82 to 85=> "0", 86 => "1", 87 => "0", 88 to 90=> "1", 91 => "0", 92 => "1", 
    93 to 96=> "0", 97 to 98=> "1", 99 => "0", 100 to 103=> "1", 104 to 107=> "0", 108 => "1", 109 => "0", 
    110 to 111=> "1", 112 to 113=> "0", 114 => "1", 115 to 116=> "0", 117 to 118=> "1", 119 => "0", 120 to 121=> "1", 
    122 => "0", 123 to 124=> "1", 125 => "0", 126 to 128=> "1", 129 => "0", 130 => "1", 131 to 133=> "0", 
    134 => "1", 135 => "0", 136 => "1", 137 to 142=> "0", 143 to 144=> "1", 145 to 146=> "0", 147 to 148=> "1", 
    149 to 150=> "0", 151 => "1", 152 to 154=> "0", 155 => "1", 156 to 158=> "0", 159 to 169=> "1", 170 => "0", 
    171 => "1", 172 => "0", 173 => "1", 174 => "0", 175 => "1", 176 => "0", 177 to 180=> "1", 
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

entity predict_ensemble_duH is
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

architecture arch of predict_ensemble_duH is
    component predict_ensemble_duH_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_duH_rom_U :  component predict_ensemble_duH_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


