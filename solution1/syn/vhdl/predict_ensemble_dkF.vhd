-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dkF_rom is 
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


architecture rtl of predict_ensemble_dkF_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 => "1", 6 => "0", 7 => "1", 8 => "0", 
    9 to 10=> "1", 11 to 14=> "0", 15 to 19=> "1", 20 => "0", 21 => "1", 22 to 23=> "0", 24 => "1", 
    25 => "0", 26 to 27=> "1", 28 to 31=> "0", 32 => "1", 33 => "0", 34 => "1", 35 to 36=> "0", 
    37 to 38=> "1", 39 => "0", 40 to 41=> "1", 42 to 43=> "0", 44 to 47=> "1", 48 => "0", 49 => "1", 
    50 => "0", 51 => "1", 52 => "0", 53 => "1", 54 to 55=> "0", 56 => "1", 57 to 59=> "0", 
    60 to 61=> "1", 62 => "0", 63 to 64=> "1", 65 to 66=> "0", 67 to 69=> "1", 70 => "0", 71 => "1", 
    72 to 75=> "0", 76 => "1", 77 => "0", 78 => "1", 79 to 83=> "0", 84 to 85=> "1", 86 => "0", 
    87 => "1", 88 to 90=> "0", 91 => "1", 92 to 93=> "0", 94 => "1", 95 => "0", 96 to 99=> "1", 
    100 to 103=> "0", 104 to 106=> "1", 107 => "0", 108 => "1", 109 => "0", 110 to 111=> "1", 112 => "0", 
    113 => "1", 114 to 118=> "0", 119 => "1", 120 => "0", 121 to 125=> "1", 126 to 127=> "0", 128 => "1", 
    129 to 130=> "0", 131 to 132=> "1", 133 => "0", 134 to 139=> "1", 140 to 143=> "0", 144 to 147=> "1", 148 => "0", 
    149 => "1", 150 to 152=> "0", 153 to 156=> "1", 157 to 160=> "0", 161 => "1", 162 => "0", 163 to 164=> "1", 
    165 to 166=> "0", 167 to 168=> "1", 169 => "0", 170 to 171=> "1", 172 => "0", 173 to 175=> "1", 176 => "0", 
    177 to 178=> "1", 179 to 194=> "0" );

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

entity predict_ensemble_dkF is
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

architecture arch of predict_ensemble_dkF is
    component predict_ensemble_dkF_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dkF_rom_U :  component predict_ensemble_dkF_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


