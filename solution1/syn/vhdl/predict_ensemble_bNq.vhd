-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bNq_rom is 
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


architecture rtl of predict_ensemble_bNq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 to 5=> "1", 6 to 7=> "0", 8 to 9=> "1", 10 to 15=> "0", 16 to 17=> "1", 18 to 21=> "0", 
    22 to 23=> "1", 24 to 25=> "0", 26 => "1", 27 to 28=> "0", 29 to 34=> "1", 35 => "0", 36 => "1", 
    37 => "0", 38 => "1", 39 to 43=> "0", 44 to 47=> "1", 48 => "0", 49 to 53=> "1", 54 to 58=> "0", 
    59 => "1", 60 => "0", 61 to 64=> "1", 65 to 66=> "0", 67 to 68=> "1", 69 to 70=> "0", 71 to 72=> "1", 
    73 to 75=> "0", 76 to 78=> "1", 79 to 82=> "0", 83 to 84=> "1", 85 => "0", 86 => "1", 87 => "0", 
    88 => "1", 89 => "0", 90 => "1", 91 to 95=> "0", 96 to 99=> "1", 100 => "0", 101 => "1", 
    102 to 103=> "0", 104 => "1", 105 => "0", 106 => "1", 107 to 109=> "0", 110 to 114=> "1", 115 => "0", 
    116 => "1", 117 to 118=> "0", 119 => "1", 120 to 121=> "0", 122 => "1", 123 to 124=> "0", 125 to 127=> "1", 
    128 to 131=> "0", 132 to 134=> "1", 135 to 138=> "0", 139 => "1", 140 to 142=> "0", 143 to 144=> "1", 145 => "0", 
    146 => "1", 147 to 148=> "0", 149 to 151=> "1", 152 => "0", 153 to 154=> "1", 155 => "0", 156 => "1", 
    157 to 158=> "0", 159 => "1", 160 => "0", 161 to 164=> "1", 165 to 167=> "0", 168 to 169=> "1", 170 to 171=> "0", 
    172 => "1", 173 to 175=> "0", 176 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_bNq is
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

architecture arch of predict_ensemble_bNq is
    component predict_ensemble_bNq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bNq_rom_U :  component predict_ensemble_bNq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


