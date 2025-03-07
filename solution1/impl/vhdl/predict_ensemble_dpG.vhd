-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dpG_rom is 
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


architecture rtl of predict_ensemble_dpG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 => "1", 6 to 10=> "0", 11 => "1", 12 => "0", 
    13 => "1", 14 => "0", 15 to 21=> "1", 22 => "0", 23 => "1", 24 to 25=> "0", 26 => "1", 
    27 => "0", 28 => "1", 29 to 31=> "0", 32 to 33=> "1", 34 => "0", 35 to 36=> "1", 37 to 38=> "0", 
    39 to 40=> "1", 41 to 43=> "0", 44 to 45=> "1", 46 => "0", 47 => "1", 48 to 50=> "0", 51 to 55=> "1", 
    56 to 58=> "0", 59 => "1", 60 => "0", 61 => "1", 62 => "0", 63 => "1", 64 to 66=> "0", 
    67 to 68=> "1", 69 => "0", 70 => "1", 71 => "0", 72 to 75=> "1", 76 => "0", 77 => "1", 
    78 to 81=> "0", 82 => "1", 83 => "0", 84 to 85=> "1", 86 to 87=> "0", 88 to 90=> "1", 91 => "0", 
    92 => "1", 93 to 95=> "0", 96 => "1", 97 to 99=> "0", 100 => "1", 101 => "0", 102 => "1", 
    103 to 105=> "0", 106 => "1", 107 => "0", 108 => "1", 109 => "0", 110 to 115=> "1", 116 => "0", 
    117 to 119=> "1", 120 to 121=> "0", 122 to 123=> "1", 124 => "0", 125 => "1", 126 to 128=> "0", 129 to 130=> "1", 
    131 => "0", 132 => "1", 133 to 135=> "0", 136 => "1", 137 => "0", 138 => "1", 139 to 140=> "0", 
    141 to 142=> "1", 143 to 144=> "0", 145 to 146=> "1", 147 to 148=> "0", 149 to 152=> "1", 153 to 154=> "0", 155 => "1", 
    156 to 159=> "0", 160 => "1", 161 => "0", 162 to 163=> "1", 164 => "0", 165 to 167=> "1", 168 to 169=> "0", 
    170 to 171=> "1", 172 => "0", 173 to 174=> "1", 175 => "0", 176 => "1", 177 => "0", 178 to 179=> "1", 
    180 => "0", 181 to 182=> "1", 183 to 194=> "0" );

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

entity predict_ensemble_dpG is
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

architecture arch of predict_ensemble_dpG is
    component predict_ensemble_dpG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dpG_rom_U :  component predict_ensemble_dpG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


