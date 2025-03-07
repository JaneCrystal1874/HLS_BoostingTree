-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_exR_rom is 
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


architecture rtl of predict_ensemble_exR_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 => "1", 6 to 7=> "0", 8 => "1", 9 => "0", 
    10 => "1", 11 to 12=> "0", 13 => "1", 14 => "0", 15 => "1", 16 to 17=> "0", 18 => "1", 
    19 => "0", 20 to 21=> "1", 22 => "0", 23 to 24=> "1", 25 to 27=> "0", 28 => "1", 29 => "0", 
    30 => "1", 31 to 32=> "0", 33 => "1", 34 => "0", 35 to 39=> "1", 40 => "0", 41 => "1", 
    42 => "0", 43 to 45=> "1", 46 => "0", 47 => "1", 48 to 51=> "0", 52 to 53=> "1", 54 to 55=> "0", 
    56 to 57=> "1", 58 => "0", 59 to 60=> "1", 61 to 63=> "0", 64 to 65=> "1", 66 to 67=> "0", 68 to 70=> "1", 
    71 => "0", 72 => "1", 73 to 74=> "0", 75 to 77=> "1", 78 to 85=> "0", 86 => "1", 87 => "0", 
    88 => "1", 89 => "0", 90 => "1", 91 => "0", 92 to 94=> "1", 95 => "0", 96 to 98=> "1", 
    99 => "0", 100 => "1", 101 => "0", 102 to 103=> "1", 104 => "0", 105 to 106=> "1", 107 to 109=> "0", 
    110 => "1", 111 => "0", 112 to 113=> "1", 114 to 116=> "0", 117 => "1", 118 to 119=> "0", 120 to 122=> "1", 
    123 to 124=> "0", 125 to 128=> "1", 129 => "0", 130 => "1", 131 => "0", 132 to 133=> "1", 134 to 136=> "0", 
    137 => "1", 138 to 140=> "0", 141 => "1", 142 => "0", 143 to 145=> "1", 146 to 149=> "0", 150 to 152=> "1", 
    153 => "0", 154 => "1", 155 => "0", 156 => "1", 157 => "0", 158 to 161=> "1", 162 => "0", 
    163 to 164=> "1", 165 to 194=> "0" );

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

entity predict_ensemble_exR is
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

architecture arch of predict_ensemble_exR is
    component predict_ensemble_exR_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_exR_rom_U :  component predict_ensemble_exR_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


