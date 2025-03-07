-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_KfY_rom is 
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


architecture rtl of predict_ensemble_KfY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 to 6=> "1", 7 to 8=> "0", 9 => "1", 10 => "0", 
    11 => "1", 12 => "0", 13 to 15=> "1", 16 => "0", 17 => "1", 18 => "0", 19 => "1", 
    20 => "0", 21 => "1", 22 to 25=> "0", 26 to 27=> "1", 28 => "0", 29 to 30=> "1", 31 to 34=> "0", 
    35 to 36=> "1", 37 to 41=> "0", 42 to 43=> "1", 44 => "0", 45 => "1", 46 to 47=> "0", 48 to 49=> "1", 
    50 => "0", 51 => "1", 52 => "0", 53 to 55=> "1", 56 => "0", 57 => "1", 58 to 62=> "0", 
    63 => "1", 64 to 65=> "0", 66 to 67=> "1", 68 to 70=> "0", 71 => "1", 72 => "0", 73 to 79=> "1", 
    80 => "0", 81 to 82=> "1", 83 to 84=> "0", 85 to 86=> "1", 87 to 88=> "0", 89 => "1", 90 => "0", 
    91 to 92=> "1", 93 to 95=> "0", 96 => "1", 97 => "0", 98 to 99=> "1", 100 to 101=> "0", 102 to 106=> "1", 
    107 to 108=> "0", 109 to 111=> "1", 112 to 114=> "0", 115 => "1", 116 to 118=> "0", 119 => "1", 120 to 121=> "0", 
    122 to 123=> "1", 124 => "0", 125 to 126=> "1", 127 to 129=> "0", 130 to 131=> "1", 132 => "0", 133 => "1", 
    134 to 136=> "0", 137 => "1", 138 to 141=> "0", 142 => "1", 143 to 144=> "0", 145 to 146=> "1", 147 => "0", 
    148 => "1", 149 to 152=> "0", 153 to 156=> "1", 157 to 158=> "0", 159 => "1", 160 to 161=> "0", 162 to 164=> "1", 
    165 => "0", 166 to 168=> "1", 169 => "0", 170 to 172=> "1", 173 => "0", 174 => "1", 175 => "0", 
    176 to 177=> "1", 178 to 179=> "0", 180 to 182=> "1", 183 => "0", 184 to 185=> "1", 186 => "0", 187 to 190=> "1", 
    191 to 194=> "0" );

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

entity predict_ensemble_KfY is
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

architecture arch of predict_ensemble_KfY is
    component predict_ensemble_KfY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_KfY_rom_U :  component predict_ensemble_KfY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


