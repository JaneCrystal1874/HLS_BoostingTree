-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_chv_rom is 
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


architecture rtl of predict_ensemble_chv_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 to 7=> "1", 8 to 9=> "0", 10 to 11=> "1", 12 => "0", 
    13 => "1", 14 to 15=> "0", 16 => "1", 17 => "0", 18 => "1", 19 to 20=> "0", 21 => "1", 
    22 => "0", 23 => "1", 24 to 27=> "0", 28 to 30=> "1", 31 to 37=> "0", 38 => "1", 39 => "0", 
    40 to 41=> "1", 42 => "0", 43 => "1", 44 => "0", 45 to 46=> "1", 47 => "0", 48 to 49=> "1", 
    50 => "0", 51 => "1", 52 => "0", 53 to 54=> "1", 55 to 60=> "0", 61 => "1", 62 => "0", 
    63 to 64=> "1", 65 => "0", 66 to 68=> "1", 69 => "0", 70 to 72=> "1", 73 to 75=> "0", 76 to 77=> "1", 
    78 => "0", 79 to 82=> "1", 83 => "0", 84 => "1", 85 to 87=> "0", 88 to 92=> "1", 93 to 95=> "0", 
    96 to 97=> "1", 98 => "0", 99 => "1", 100 to 102=> "0", 103 to 104=> "1", 105 => "0", 106 => "1", 
    107 to 109=> "0", 110 to 111=> "1", 112 => "0", 113 to 117=> "1", 118 to 120=> "0", 121 to 122=> "1", 123 to 124=> "0", 
    125 => "1", 126 => "0", 127 to 128=> "1", 129 => "0", 130 => "1", 131 => "0", 132 => "1", 
    133 => "0", 134 => "1", 135 to 142=> "0", 143 to 146=> "1", 147 => "0", 148 => "1", 149 to 150=> "0", 
    151 => "1", 152 => "0", 153 to 154=> "1", 155 to 156=> "0", 157 => "1", 158 to 159=> "0", 160 to 161=> "1", 
    162 => "0", 163 => "1", 164 to 166=> "0", 167 to 171=> "1", 172 => "0", 173 to 175=> "1", 176 => "0", 
    177 => "1", 178 => "0", 179 to 180=> "1", 181 to 183=> "0", 184 to 188=> "1", 189 to 194=> "0" );

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

entity predict_ensemble_chv is
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

architecture arch of predict_ensemble_chv is
    component predict_ensemble_chv_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_chv_rom_U :  component predict_ensemble_chv_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


